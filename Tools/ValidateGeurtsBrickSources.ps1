# Version: 1.0.0
<#
.SYNOPSIS
Checks released catalogue entries against their exact Git package and capability manifests.
.DESCRIPTION
Supply source checkouts whose origin remotes match the catalogue repositories. Read only
committed objects, never checkout files or execute package code. Missing objects fail closed;
fetch them separately before publication. This tool performs no network requests or writes.
.EXAMPLE
& ./Tools/ValidateGeurtsBrickSources.ps1 -SourceRepositories @('C:/src/God', 'C:/src/Audio')
Supply a checkout for every released entry, including independent tools and the legacy adapter.
#>
[CmdletBinding()]
param(
    [string]$RepositoryRoot,
    [string[]]$SourceRepositories = @(),
    [ValidateSet('Text', 'Json')][string]$OutputFormat = 'Text'
)
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($RepositoryRoot)) { $RepositoryRoot = Split-Path -Parent $PSScriptRoot }

function Get-GeurtsRepositoryIdentity([string]$Url) {
    if ($Url -notmatch '^(?:https://github\.com/|git@github\.com:|ssh://git@github\.com/)(?<Repository>[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+?)(?:\.git)?/?$') {
        throw 'Source checkout origin must identify a GitHub repository without credentials, a query or a fragment.'
    }
    return $Matches.Repository.ToLowerInvariant()
}

function Get-GeurtsPinnedSource([string]$Source) {
    if ($Source -notmatch '^(?<Url>https://github\.com/[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+\.git)(?:\?path=(?<Path>[^#]+))?#(?<Ref>[a-fA-F0-9]{40}|v?\d+\.\d+\.\d+)$') {
        throw 'Released source must pin a full commit or a stable release tag, optionally with a package path.'
    }
    $sourceMatch = $Matches.Clone()
    $packagePath = [Uri]::UnescapeDataString([string]$sourceMatch.Path)
    if ($packagePath -and ($packagePath.Contains('\') -or $packagePath.StartsWith('/') -or $packagePath.EndsWith('/') -or
        @($packagePath.Split('/') | Where-Object { $_ -in @('', '.', '..') -or $_ -notmatch '^[A-Za-z0-9_.~-]+$' }).Count)) {
        throw 'Pinned package path is not a safe repository-relative path.'
    }
    [pscustomobject]@{
        Repository = Get-GeurtsRepositoryIdentity $sourceMatch.Url
        Ref = [string]$sourceMatch.Ref
        Prefix = $(if ($packagePath) { $packagePath + '/' } else { '' })
    }
}

function Invoke-GeurtsGitRead([string]$Root, [string[]]$GitArguments) {
    $previousPreference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $gitOutput = @(& git -C $Root @GitArguments 2>&1)
        $gitExit = $LASTEXITCODE
    }
    finally { $ErrorActionPreference = $previousPreference }
    if ($gitExit -ne 0) { throw "Git read failed (exit $gitExit). Verify the source checkout and fetch the pinned objects separately." }
    return ($gitOutput -join "`n")
}

function Get-GeurtsBrickSourceIssues($Brick, $Package, $Capabilities, $Catalogue) {
    $issues = New-Object 'System.Collections.Generic.List[string]'
    if ([string]$Package.name -cne [string]$Brick.id) { $issues.Add('package.json identity differs from the catalogue.') }
    if ([string]$Package.version -cne [string]$Brick.version) { $issues.Add('package.json version differs from the catalogue.') }
    if ([string]$Capabilities.schemaVersion -cne '1.0.0' -or [string]$Capabilities.packageId -cne [string]$Brick.id -or
        [string]$Capabilities.packageVersion -cne [string]$Brick.version) { $issues.Add('ForgeCapabilities.json schema, identity or version differs from the release.') }

    $required = @{}
    foreach ($property in $Package.dependencies.PSObject.Properties) {
        if ($property.Name.StartsWith('com.geurts.gameforge.', [System.StringComparison]::Ordinal)) {
            $required[$property.Name] = [string]$property.Value
        }
    }
    $declared = @{}
    foreach ($dependency in @($Brick.dependencies)) {
        if ($declared.ContainsKey([string]$dependency.id)) { $issues.Add("Duplicate catalogue dependency $($dependency.id).") }
        $declared[[string]$dependency.id] = [string]$dependency.minimumVersion
    }
    $capabilityRequired = @{}
    foreach ($prerequisite in @($Capabilities.prerequisites)) {
        if ($prerequisite.kind -ceq 'package' -and $prerequisite.required -eq $true -and
            ([string]$prerequisite.id).StartsWith('com.geurts.gameforge.', [System.StringComparison]::Ordinal)) {
            if ($capabilityRequired.ContainsKey([string]$prerequisite.id)) { $issues.Add("Duplicate required capability prerequisite $($prerequisite.id).") }
            $capabilityRequired[[string]$prerequisite.id] = [string]$prerequisite.minimumVersion
        }
    }
    foreach ($dependencyId in @(@($required.Keys) + @($declared.Keys) + @($capabilityRequired.Keys) | Sort-Object -Unique)) {
        if (-not $required.ContainsKey($dependencyId)) {
            $issues.Add("$dependencyId is declared as required outside package.json.")
            continue
        }
        $minimum = $required[$dependencyId]
        if ($declared[$dependencyId] -cne $minimum) { $issues.Add("$dependencyId catalogue minimum '$($declared[$dependencyId])' must equal package.json '$minimum'.") }
        if ($capabilityRequired[$dependencyId] -cne $minimum) { $issues.Add("$dependencyId capability minimum '$($capabilityRequired[$dependencyId])' must equal package.json '$minimum'.") }
        $providers = @($Catalogue.bricks | Where-Object { $_.id -ceq $dependencyId -and $_.released -eq $true })
        if ($minimum -notmatch '^\d+\.\d+\.\d+$' -or $providers.Count -ne 1 -or
            [string]$providers[0].version -notmatch '^\d+\.\d+\.\d+$') {
            $issues.Add("$dependencyId needs one released catalogue provider and stable semantic versions.")
        }
        elseif ([version]$providers[0].version -lt [version]$minimum) { $issues.Add("$dependencyId catalogue provider $($providers[0].version) cannot satisfy $minimum.") }
    }
    return $issues.ToArray()
}

# Dot-sourcing exposes the pure comparison and Git reader for isolated regression tests only.
if ($MyInvocation.InvocationName -eq '.') { return }

$checks = New-Object 'System.Collections.Generic.List[object]'
$failures = New-Object 'System.Collections.Generic.List[string]'
$previousLazyFetch = $env:GIT_NO_LAZY_FETCH
$previousOptionalLocks = $env:GIT_OPTIONAL_LOCKS
try {
    $env:GIT_NO_LAZY_FETCH = '1'
    $env:GIT_OPTIONAL_LOCKS = '0'
    if (-not $SourceRepositories.Count) { throw 'SourceRepositories is required for publication. Supply cached owning Git checkouts for every released catalogue entry.' }
    $cataloguePath = Join-Path $RepositoryRoot 'GeurtsTechniques/GeurtsBrickCatalogue.json'
    $catalogue = [System.IO.File]::ReadAllText($cataloguePath) | ConvertFrom-Json
    if ($catalogue.schemaVersion -ne 1) { throw 'Unsupported catalogue schema.' }
    $released = @($catalogue.bricks | Where-Object { $_.released -eq $true })
    if (-not $released.Count -or @($catalogue.bricks.id | Select-Object -Unique).Count -ne @($catalogue.bricks).Count) { throw 'Catalogue must have released entries and unique identities.' }
    $repositories = @{}
    foreach ($sourceRoot in $SourceRepositories) {
        $fullRoot = [System.IO.Path]::GetFullPath($sourceRoot)
        if ($fullRoot.Length -ge 260) { throw "Source path is $($fullRoot.Length) characters (maximum 259): $fullRoot" }
        $origin = Invoke-GeurtsGitRead $fullRoot @('remote', 'get-url', 'origin')
        $identity = Get-GeurtsRepositoryIdentity $origin
        if ($repositories.ContainsKey($identity)) { throw "Duplicate checkout for $identity." }
        $repositories[$identity] = $fullRoot
    }
    foreach ($brick in $released) {
        $commit = $null
        $entryIssues = @()
        try {
            if ($brick.sourceKind -cne 'git') { throw 'Released installation source is not Git.' }
            $pin = Get-GeurtsPinnedSource $brick.source
            $sourceRoot = $repositories[$pin.Repository]
            if (-not $sourceRoot) { throw "Missing owning source checkout for $($pin.Repository)." }
            $commit = Invoke-GeurtsGitRead $sourceRoot @('rev-parse', '--verify', ($pin.Ref + '^{commit}'))
            if ($pin.Ref -match '^[a-fA-F0-9]{40}$' -and $commit -cne $pin.Ref.ToLowerInvariant()) { throw 'Resolved commit differs from the exact source pin.' }
            foreach ($file in @('package.json', 'ForgeCapabilities.json')) {
                $logicalPath = [System.IO.Path]::GetFullPath((Join-Path $sourceRoot ($pin.Prefix + $file)))
                if ($logicalPath.Length -ge 260) { throw "Manifest path is $($logicalPath.Length) characters (maximum 259): $logicalPath" }
            }
            $package = (Invoke-GeurtsGitRead $sourceRoot @('show', ($commit + ':' + $pin.Prefix + 'package.json'))) | ConvertFrom-Json
            $capabilities = (Invoke-GeurtsGitRead $sourceRoot @('show', ($commit + ':' + $pin.Prefix + 'ForgeCapabilities.json'))) | ConvertFrom-Json
            $entryIssues = @(Get-GeurtsBrickSourceIssues $brick $package $capabilities $catalogue)
        }
        catch { $entryIssues = @($_.Exception.Message) }
        foreach ($issue in $entryIssues) { $failures.Add("$($brick.id): $issue") }
        $checks.Add([pscustomobject]@{ id = $brick.id; version = $brick.version; source = $brick.source; commit = $commit; passed = ($entryIssues.Count -eq 0); issues = $entryIssues })
    }
}
catch { $failures.Add($_.Exception.Message) }
finally {
    $env:GIT_NO_LAZY_FETCH = $previousLazyFetch
    $env:GIT_OPTIONAL_LOCKS = $previousOptionalLocks
}
$result = [pscustomobject]@{ status = $(if ($failures.Count) { 'INVALID' } else { 'VALID' }); checks = $checks.ToArray(); failures = $failures.ToArray() }
if ($OutputFormat -eq 'Json') { $result | ConvertTo-Json -Depth 7 }
else {
    foreach ($check in $checks) { Write-Host ("{0} {1} {2} at {3}" -f $(if ($check.passed) { 'PASS' } else { 'FAIL' }), $check.id, $check.version, $check.commit) }
    foreach ($failure in $failures) { Write-Host $failure -ForegroundColor Red }
}
if ($failures.Count) { exit 1 }
exit 0
