# Version: 1.2.0
<#
.SYNOPSIS
Checks committed Unity package metadata and released catalogue source declarations.
.DESCRIPTION
Supply source checkouts whose origin remotes match the catalogue repositories. Read only
committed objects, never checkout files or execute package code. Missing objects fail closed;
fetch them separately before publication. This tool performs no network requests or writes.
.EXAMPLE
& ./Tools/ValidateGeurtsBrickSources.ps1 -SourceRepositories @('C:/src/God', 'C:/src/Audio')
Supply a checkout for every released entry, including independent tools and the legacy adapter.
.EXAMPLE
& ./Tools/ValidateGeurtsBrickSources.ps1 -MetadataRepository C:/src/NewBrick -MetadataRef <candidate-commit>
Validate a committed candidate before its first release, without adding it to the catalogue.
MetadataPackagePath selects a nested package; the repository/package root itself needs no sidecar.
#>
[CmdletBinding()]
param(
    [string]$RepositoryRoot,
    [string[]]$SourceRepositories = @(),
    [string]$MetadataRepository,
    [string]$MetadataRef = 'HEAD',
    [string]$MetadataPackagePath = '',
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

function Invoke-GeurtsGitRead([string]$Root, [string[]]$GitArguments, [int[]]$AllowedExitCodes = @(0)) {
    $previousPreference = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $gitOutput = @(& git -C $Root @GitArguments 2>&1)
        $gitExit = $LASTEXITCODE
    }
    finally { $ErrorActionPreference = $previousPreference }
    if ($gitExit -notin $AllowedExitCodes) { throw "Git read failed (exit $gitExit). Verify the source checkout and fetch the pinned objects separately." }
    return ($gitOutput -join "`n")
}


function Test-GeurtsImportedPath([string]$Path, [bool]$IsDirectory = $false) {
    # Git has no portable hidden attribute. Use Unity's name-based exclusions only.
    $streaming = $false
    $parts = $Path.Split('/')
    for ($index = 0; $index -lt $parts.Count; $index++) {
        $part = $parts[$index]
        if (($part.StartsWith('.') -and -not $streaming) -or $part.EndsWith('~') -or $part -ieq 'cvs') { return $false }
        if (-not $IsDirectory -and $index -eq $parts.Count - 1 -and $part.EndsWith('.tmp', [StringComparison]::OrdinalIgnoreCase)) { return $false }
        if ($part -ceq 'StreamingAssets') { $streaming = $true }
    }
    return $true
}

function Get-GeurtsMetadataIssues([string]$Root, [string]$Commit, [string]$Prefix = '') {
    $issues = New-Object 'System.Collections.Generic.List[string]'
    $tree = $Commit + ':' + $Prefix.TrimEnd('/')
    $entries = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::Ordinal)
    $inventory = Invoke-GeurtsGitRead $Root @('-c', 'core.quotePath=false', 'ls-tree', '-r', '-t', $tree)
    foreach ($line in @($inventory -split "`n" | Where-Object { $_ })) {
        if ($line -notmatch '^(?<Mode>[0-9]{6}) (?:blob|tree|commit) [a-f0-9]{40}\t(?<Path>.+)$' -or $Matches.Path.StartsWith('"')) {
            throw 'Package tree contains an unsupported or escaped Git path.'
        }
        $entries.Add($Matches.Path, $Matches.Mode)
    }
    if (-not $entries.ContainsKey('package.json')) { throw 'Selected package tree has no committed package.json.' }
    $metas = New-Object 'System.Collections.Generic.Dictionary[string,object]' ([StringComparer]::Ordinal)
    foreach ($path in $entries.Keys) {
        $isMeta = $path.EndsWith('.meta', [StringComparison]::OrdinalIgnoreCase)
        $importPath = if ($isMeta) { $path.Substring(0, $path.Length - 5) } else { $path }
        $isDirectory = $entries[$path] -eq '040000' -or ($isMeta -and $entries.ContainsKey($importPath) -and $entries[$importPath] -eq '040000')
        if (-not (Test-GeurtsImportedPath $importPath $isDirectory)) { continue }
        if ($entries[$path] -notin @('040000', '100644', '100755')) { $issues.Add("Unsupported imported Git object: $path"); continue }
        if ($isMeta) {
            if ($entries[$path] -eq '040000') { $issues.Add("Unsupported metadata directory: $path"); continue }
            $metas.Add($path, (New-Object 'System.Collections.Generic.List[string]'))
        }
        elseif (-not $entries.ContainsKey($path + '.meta')) { $issues.Add("Missing committed Unity metadata: $path.meta") }
    }
    if ($metas.Count) {
        # One Git read per package, rather than starting one process for every sidecar.
        $lines = Invoke-GeurtsGitRead $Root @('-c', 'core.quotePath=false', 'grep', '-I', '-n', '-E', '^(guid:|folderAsset:)', $tree, '--', '*.meta') @(0, 1)
        foreach ($line in @($lines -split "`n" | Where-Object { $_ })) {
            if (-not $line.StartsWith($tree + ':', [StringComparison]::Ordinal)) { throw 'Unexpected metadata grep output.' }
            $record = $line.Substring($tree.Length + 1)
            if ($record -notmatch '^(?<Path>.+?):[0-9]+:(?<Value>.*)$') { throw 'Unsupported metadata path in Git output.' }
            if ($metas.ContainsKey($Matches.Path)) { $metas[$Matches.Path].Add($Matches.Value.TrimEnd("`r")) }
        }
    }
    $guids = @{}
    foreach ($path in $metas.Keys) {
        $guidLines = @($metas[$path] | Where-Object { $_ -cmatch '^guid:' })
        if ($guidLines.Count -ne 1 -or $guidLines[0] -cnotmatch '^guid: [a-fA-F0-9]{32}$' -or $guidLines[0] -match '^guid: 0{32}$') {
            $issues.Add("Invalid Unity metadata GUID: $path")
        }
        else {
            $guid = $guidLines[0].Substring(6).ToLowerInvariant()
            if ($guids.ContainsKey($guid)) { $issues.Add("Duplicate Unity metadata GUID: $path and $($guids[$guid])") }
            else { $guids[$guid] = $path }
        }
        $asset = $path.Substring(0, $path.Length - 5)
        $folderLines = @($metas[$path] | Where-Object { $_ -cmatch '^folderAsset:' })
        $folder = $folderLines.Count -eq 1 -and $folderLines[0] -ceq 'folderAsset: yes'
        if ($entries.ContainsKey($asset)) {
            if (($entries[$asset] -eq '040000') -ne $folder -or $folderLines.Count -gt 1) { $issues.Add("Unity metadata folder marker disagrees with asset: $path") }
        }
        elseif (-not $folder) { $issues.Add("Orphan Unity file metadata: $path") }
        # A folderAsset sidecar can represent an intentionally empty folder: Git stores no empty trees.
    }
    return @($issues.ToArray() | Sort-Object)
}

function Get-GeurtsCapabilityIssues($Capabilities) {
    $issues = New-Object 'System.Collections.Generic.List[string]'
    function Require-Fields($Object, [hashtable]$Types, [string]$Label) {
        foreach ($name in $Types.Keys) {
            $property = if ($null -ne $Object) { $Object.PSObject.Properties[$name] } else { $null }
            $value = $null
            if ($property) { $value = $property.Value }
            $valid = $null -ne $property -and $null -ne $value
            if ($valid) {
                switch ($Types[$name]) {
                    'text' { $valid = $value -is [string] -and -not [string]::IsNullOrWhiteSpace($value) }
                    'string' { $valid = $value -is [string] }
                    'array' { $valid = $value -is [System.Array] }
                    'bool' { $valid = $value -is [bool] }
                    'object' { $valid = $value -is [pscustomobject] }
                }
            }
            if (-not $valid) { $issues.Add("Capability $Label.$name is missing or has an invalid type/value.") }
        }
    }
    Require-Fields $Capabilities @{ schemaVersion='text'; packageId='text'; packageVersion='text'; maturity='text'; prerequisites='array'; features='array'; operations='array'; validation='object' } 'root'
    Require-Fields $Capabilities.validation @{ unityVersion='text'; scope='text'; unverified='array' } 'validation'
    if (@($Capabilities.validation.unverified | Where-Object { $_ -isnot [string] -or [string]::IsNullOrWhiteSpace($_) }).Count) { $issues.Add('Capability unverified scope must contain nonempty strings.') }
    $operationIds = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
    foreach ($operation in @($Capabilities.operations)) {
        Require-Fields $operation @{ id='text'; description='text'; source='text'; symbol='text'; confirmationRequired='bool' } 'operation'
        if ([string]$operation.id -cnotmatch '^[a-z][a-z0-9]*(?:_[a-z0-9]+)*$' -or -not $operationIds.Add([string]$operation.id)) { $issues.Add('Capability operation IDs must be unique lower_snake_case values.') }
        if ([string]$operation.source -cnotmatch '^[A-Za-z0-9_.~/]+\.cs$' -or @(([string]$operation.source).Split('/') | Where-Object { $_ -in @('', '.', '..') }).Count) { $issues.Add('Capability operation source must be a safe relative C# path.') }
    }
    $featureIds = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
    foreach ($feature in @($Capabilities.features)) {
        Require-Fields $feature @{ id='text'; description='text'; maturity='text'; provider='text'; implemented='bool'; operations='array'; validation='array' } 'feature'
        if ([string]$feature.id -cnotmatch '^[a-z][a-z0-9]*(?:_[a-z0-9]+)*$' -or -not $featureIds.Add([string]$feature.id)) { $issues.Add('Capability feature IDs must be unique lower_snake_case values.') }
        if ($feature.provider -cnotin @('editor','runtime','none')) { $issues.Add('Capability feature provider is unsupported.') }
        if ($feature.implemented -ne $true -and @($feature.operations).Count) { $issues.Add('Planned capability features cannot advertise operations.') }
        if (-not @($feature.validation).Count -or @($feature.validation | Where-Object { $_ -isnot [string] -or [string]::IsNullOrWhiteSpace($_) }).Count) { $issues.Add('Capability feature validation scope is missing or invalid.') }
        $references = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
        foreach ($id in @($feature.operations)) {
            if ($id -isnot [string] -or -not $operationIds.Contains([string]$id) -or -not $references.Add([string]$id)) { $issues.Add('Capability feature operation references must resolve uniquely without repeated entries.') }
        }
    }
    $prerequisiteIds = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
    foreach ($prerequisite in @($Capabilities.prerequisites)) {
        Require-Fields $prerequisite @{ id='text'; kind='text'; detail='text'; minimumVersion='string'; required='bool' } 'prerequisite'
        if (-not $prerequisiteIds.Add([string]$prerequisite.id)) { $issues.Add('Capability prerequisite IDs must be unique.') }
    }
    return $issues.ToArray()
}

function Get-GeurtsBrickSourceIssues($Brick, $Package, $Capabilities, $Catalogue) {
    $issues = New-Object 'System.Collections.Generic.List[string]'
    foreach ($issue in @(Get-GeurtsCapabilityIssues $Capabilities)) { $issues.Add($issue) }
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
    if ($MetadataRepository) {
        if ($SourceRepositories.Count) { throw 'MetadataRepository and SourceRepositories are separate validation modes.' }
        if ($MetadataRef -notmatch '^[A-Za-z0-9][A-Za-z0-9._/-]*$') { throw 'MetadataRef must be a safe Git revision, preferably a full candidate commit.' }
        if ($MetadataPackagePath -and ($MetadataPackagePath -notmatch '^[A-Za-z0-9_.~/-]+$' -or @($MetadataPackagePath.Split('/') | Where-Object { $_ -in @('', '.', '..') }).Count)) { throw 'MetadataPackagePath must be a safe package-relative directory without leading/trailing slashes.' }
        $metadataRoot = [IO.Path]::GetFullPath($MetadataRepository)
        if ($metadataRoot.Length -ge 260) { throw "Metadata repository path exceeds 259 characters: $metadataRoot" }
        $commit = Invoke-GeurtsGitRead $metadataRoot @('rev-parse', '--verify', ($MetadataRef + '^{commit}'))
        $entryIssues = @(Get-GeurtsMetadataIssues $metadataRoot $commit $MetadataPackagePath)
        foreach ($issue in $entryIssues) { $failures.Add($issue) }
        $checks.Add([pscustomobject]@{ id='unity_metadata'; version=''; source=$MetadataPackagePath; commit=$commit; passed=($entryIssues.Count -eq 0); issues=$entryIssues })
    }
    else {
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
                $entryIssues = @(Get-GeurtsBrickSourceIssues $brick $package $capabilities $catalogue) + @(Get-GeurtsMetadataIssues $sourceRoot $commit $pin.Prefix)
                if (-not $entryIssues.Count) {
                    foreach ($operation in @($capabilities.operations)) {
                        $logicalPath = [System.IO.Path]::GetFullPath((Join-Path $sourceRoot ($pin.Prefix + $operation.source)))
                        if ($logicalPath.Length -ge 260) { throw "Operation source path is $($logicalPath.Length) characters (maximum 259): $logicalPath" }
                        $code = Invoke-GeurtsGitRead $sourceRoot @('show', ($commit + ':' + $pin.Prefix + $operation.source))
                        if (-not $code.Contains([string]$operation.symbol)) { throw "Capability operation symbol is absent from its pinned source: $($operation.id)." }
                    }
                }
            }
            catch { $entryIssues = @($_.Exception.Message) }
            foreach ($issue in $entryIssues) { $failures.Add("$($brick.id): $issue") }
            $checks.Add([pscustomobject]@{ id = $brick.id; version = $brick.version; source = $brick.source; commit = $commit; passed = ($entryIssues.Count -eq 0); issues = $entryIssues })
        }
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
