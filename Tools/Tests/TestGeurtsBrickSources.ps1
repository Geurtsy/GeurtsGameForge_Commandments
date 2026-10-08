# Version: 1.0.0
[CmdletBinding()]
param(
    [string]$RepositoryRoot,
    [ValidateSet('Text', 'Json')][string]$OutputFormat = 'Text'
)
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($RepositoryRoot)) { $RepositoryRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot) }
$gateScript = Join-Path $RepositoryRoot 'Tools/ValidateGeurtsBrickSources.ps1'
. $gateScript -RepositoryRoot $RepositoryRoot -OutputFormat $OutputFormat
$passed = 0
$testFailures = New-Object 'System.Collections.Generic.List[string]'
function Assert-Source([bool]$Condition, [string]$Name) {
    if ($Condition) { $script:passed++ }
    else { $script:testFailures.Add($Name) }
}
function Assert-SourceRejected([scriptblock]$Action, [string]$Name) {
    $rejected = $false
    try { & $Action | Out-Null } catch { $rejected = $true }
    Assert-Source $rejected $Name
}
function New-Comparison {
    return ('{"brick":{"id":"com.geurts.gameforge.example","version":"1.0.0","dependencies":[{"id":"com.geurts.gameforge.god","minimumVersion":"0.35.0"}]},"package":{"name":"com.geurts.gameforge.example","version":"1.0.0","dependencies":{"com.geurts.gameforge.god":"0.35.0","com.unity.modules.audio":"1.0.0"}},"capabilities":{"schemaVersion":"1.0.0","packageId":"com.geurts.gameforge.example","packageVersion":"1.0.0","prerequisites":[{"id":"com.geurts.gameforge.god","kind":"package","required":true,"minimumVersion":"0.35.0"}]},"catalogue":{"bricks":[{"id":"com.geurts.gameforge.god","version":"0.35.0","released":true}]}}' | ConvertFrom-Json)
}
function Get-ComparisonIssues($Comparison) {
    return @(Get-GeurtsBrickSourceIssues $Comparison.brick $Comparison.package $Comparison.capabilities $Comparison.catalogue)
}
function Write-SourceFixture([string]$Path, $Value) {
    [System.IO.File]::WriteAllText($Path, ($Value | ConvertTo-Json -Depth 8), (New-Object System.Text.UTF8Encoding($false)))
}
function Invoke-FixtureGate([string[]]$Roots) {
    $output = & $gateScript -RepositoryRoot $fixture -SourceRepositories $Roots -OutputFormat Json
    return [pscustomobject]@{ Code = $LASTEXITCODE; Result = ($output | ConvertFrom-Json) }
}
$temporaryBase = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
$fixture = Join-Path $temporaryBase ('ggf-sources-' + [Guid]::NewGuid().ToString('N'))
try {
    $comparison = New-Comparison
    Assert-Source (@(Get-ComparisonIssues $comparison).Count -eq 0) 'Matching manifests pass; non-Forge Unity dependencies need no brick catalogue entries'
    foreach ($minimum in @('0.33.1', '0.34.0', '0.36.0')) {
        $comparison = New-Comparison
        $comparison.brick.dependencies[0].minimumVersion = $minimum
        Assert-Source ((Get-ComparisonIssues $comparison) -match 'catalogue minimum') "Understated or overstated catalogue minimum $minimum is rejected"
    }
    $comparison = New-Comparison
    $comparison.brick.dependencies = @()
    Assert-Source (@(Get-ComparisonIssues $comparison).Count -gt 0) 'Omitted required catalogue dependency is rejected'
    $comparison = New-Comparison
    $comparison.package.dependencies.PSObject.Properties.Remove('com.geurts.gameforge.god')
    Assert-Source (@(Get-ComparisonIssues $comparison).Count -gt 0) 'Extra catalogue or capability dependency cannot invent a package requirement'
    $comparison = New-Comparison
    $comparison.brick.dependencies += $comparison.brick.dependencies[0]
    Assert-Source ((Get-ComparisonIssues $comparison) -match 'Duplicate catalogue dependency') 'Duplicate catalogue dependencies are rejected'
    foreach ($mutation in @('minimum', 'missing', 'optional', 'duplicate')) {
        $comparison = New-Comparison
        switch ($mutation) {
            'minimum' { $comparison.capabilities.prerequisites[0].minimumVersion = '0.34.0' }
            'missing' { $comparison.capabilities.prerequisites = @() }
            'optional' { $comparison.capabilities.prerequisites[0].required = $false }
            'duplicate' { $comparison.capabilities.prerequisites += $comparison.capabilities.prerequisites[0] }
        }
        Assert-Source (@(Get-ComparisonIssues $comparison).Count -gt 0) "Capability prerequisite $mutation mismatch is rejected"
    }
    foreach ($mutation in @('old', 'unreleased', 'missing')) {
        $comparison = New-Comparison
        switch ($mutation) {
            'old' { $comparison.catalogue.bricks[0].version = '0.34.0' }
            'unreleased' { $comparison.catalogue.bricks[0].released = $false }
            'missing' { $comparison.catalogue.bricks = @() }
        }
        Assert-Source (@(Get-ComparisonIssues $comparison).Count -gt 0) "Required provider $mutation state cannot satisfy a release"
    }
    foreach ($mutation in @('package_id', 'package_version', 'capability_id', 'capability_version', 'schema')) {
        $comparison = New-Comparison
        switch ($mutation) {
            'package_id' { $comparison.package.name = 'com.geurts.gameforge.wrong' }
            'package_version' { $comparison.package.version = '0.9.0' }
            'capability_id' { $comparison.capabilities.packageId = 'com.geurts.gameforge.wrong' }
            'capability_version' { $comparison.capabilities.packageVersion = '0.9.0' }
            'schema' { $comparison.capabilities.schemaVersion = '2.0.0' }
        }
        Assert-Source (@(Get-ComparisonIssues $comparison).Count -gt 0) "Release $mutation mismatch is rejected"
    }
    $comparison = New-Comparison
    $comparison.brick.dependencies = @()
    $comparison.package.dependencies = @{}
    $comparison.capabilities.prerequisites = @()
    Assert-Source (@(Get-ComparisonIssues $comparison).Count -eq 0) 'Independent installer and passive adapter need no God dependency'
    $comparison = New-Comparison
    $comparison.capabilities.prerequisites += [pscustomobject]@{ id = 'com.geurts.gameforge.optional'; kind = 'package'; required = $false; minimumVersion = '9.0.0' }
    Assert-Source (@(Get-ComparisonIssues $comparison).Count -eq 0) 'Optional peer capabilities do not become required dependencies'

    Assert-Source ((Get-GeurtsRepositoryIdentity 'git@github.com:Geurtsy/Example.git') -ceq 'geurtsy/example') 'SSH checkout origins match HTTPS catalogue repositories'
    $pin = Get-GeurtsPinnedSource 'https://github.com/Geurtsy/Example.git?path=Packages~/Peer#v1.0.0'
    Assert-Source ($pin.Repository -ceq 'geurtsy/example' -and $pin.Prefix -ceq 'Packages~/Peer/' -and $pin.Ref -ceq 'v1.0.0') 'Immutable release tags and safe subpackage paths are resolved'
    foreach ($source in @(
        'https://github.com/Geurtsy/Example.git#main',
        'https://github.com/Geurtsy/Example.git#1234567',
        'https://github.com/Geurtsy/Example.git?path=../Peer#v1.0.0',
        'https://github.com/Geurtsy/Example.git?path=%2e%2e/Peer#v1.0.0',
        'https://github.com/Geurtsy/Example.git?path=/Peer#v1.0.0',
        'https://github.com/Geurtsy/Example.git?path=Peer\Other#v1.0.0'
    )) { Assert-SourceRejected { Get-GeurtsPinnedSource $source } "Mutable, ambiguous or unsafe source is rejected: $source" }

    # End-to-end fixtures are disposable Git sources, never a consumer or Unity project.
    $deepestFixturePath = Join-Path $fixture 'peer/Packages~/Peer/ForgeCapabilities.json'
    if ($deepestFixturePath.Length -ge 260) { throw "Fixture path is $($deepestFixturePath.Length) characters: $deepestFixturePath" }
    New-Item -ItemType Directory -Path (Join-Path $fixture 'GeurtsTechniques') -Force | Out-Null
    $sourceRoots = @()
    $entries = @()
    foreach ($owner in @('god', 'peer')) {
        $root = Join-Path $fixture $owner
        $prefix = if ($owner -eq 'peer') { 'Packages~/Peer/' } else { '' }
        $packageRoot = Join-Path $root $prefix
        New-Item -ItemType Directory -Path $packageRoot -Force | Out-Null
        $sample = New-Comparison
        if ($owner -eq 'god') {
            $sample.brick.id = 'com.geurts.gameforge.god'; $sample.brick.version = '0.35.0'; $sample.brick.dependencies = @()
            $sample.package.name = $sample.brick.id; $sample.package.version = $sample.brick.version; $sample.package.dependencies = @{}
            $sample.capabilities.packageId = $sample.brick.id; $sample.capabilities.packageVersion = $sample.brick.version; $sample.capabilities.prerequisites = @()
        }
        Write-SourceFixture (Join-Path $packageRoot 'package.json') $sample.package
        Write-SourceFixture (Join-Path $packageRoot 'ForgeCapabilities.json') $sample.capabilities
        Invoke-GeurtsGitRead $root @('init', '-q', '-b', 'main') | Out-Null
        Invoke-GeurtsGitRead $root @('remote', 'add', 'origin', "https://github.com/fixture/$owner.git") | Out-Null
        Invoke-GeurtsGitRead $root @('add', '--', '.') | Out-Null
        Invoke-GeurtsGitRead $root @('-c', 'user.name=Forge Tests', '-c', 'user.email=tests@example.invalid', 'commit', '-qm', 'Fixture') | Out-Null
        $commit = Invoke-GeurtsGitRead $root @('rev-parse', 'HEAD')
        $source = "https://github.com/fixture/$owner.git" + $(if ($prefix) { '?path=' + $prefix.TrimEnd('/') } else { '' }) + '#' + $commit
        $sample.brick | Add-Member released $true
        $sample.brick | Add-Member sourceKind 'git'
        $sample.brick | Add-Member source $source
        $entries += $sample.brick
        $sourceRoots += $root
    }
    $fixtureCatalogue = [pscustomobject]@{ schemaVersion = 1; packageVersion = '1.0.0'; bricks = $entries }
    $fixtureCataloguePath = Join-Path $fixture 'GeurtsTechniques/GeurtsBrickCatalogue.json'
    Write-SourceFixture $fixtureCataloguePath $fixtureCatalogue
    $workingPackage = Join-Path $fixture 'peer/Packages~/Peer/package.json'
    [System.IO.File]::WriteAllText($workingPackage, 'Uncommitted content must not be read or overwritten.')
    $workingHash = (Get-FileHash -LiteralPath $workingPackage).Hash
    $check = Invoke-FixtureGate $sourceRoots
    Assert-Source ($check.Code -eq 0 -and $check.Result.status -ceq 'VALID' -and $check.Result.checks.Count -eq 2) 'CLI validates exact pinned commits including a nested package'
    Assert-Source ((Get-FileHash -LiteralPath $workingPackage).Hash -ceq $workingHash) 'CLI preserves uncommitted checkout files'
    $check = Invoke-FixtureGate @($sourceRoots[0])
    Assert-Source ($check.Code -ne 0 -and ($check.Result.failures -match 'Missing owning source checkout')) 'Missing owning checkout fails closed'
    $entries[1].dependencies[0].minimumVersion = '0.34.0'
    Write-SourceFixture $fixtureCataloguePath $fixtureCatalogue
    $check = Invoke-FixtureGate $sourceRoots
    Assert-Source ($check.Code -ne 0 -and ($check.Result.failures -match 'catalogue minimum')) 'CLI rejects the original God minimum regression'
    $entries[1].dependencies[0].minimumVersion = '0.35.0'
    $entries[1].source = $entries[1].source -replace '#[a-f0-9]{40}$', ('#' + ('0' * 40))
    Write-SourceFixture $fixtureCataloguePath $fixtureCatalogue
    $check = Invoke-FixtureGate $sourceRoots
    Assert-Source ($check.Code -ne 0 -and ($check.Result.failures -match 'Git read failed')) 'Missing pinned commit cannot fall back to HEAD'
    $check = Invoke-FixtureGate @()
    Assert-Source ($check.Code -ne 0 -and ($check.Result.failures -match 'SourceRepositories is required')) 'Publication cannot pass without source evidence'
}
catch { $testFailures.Add("Harness error: $($_.Exception.Message) at line $($_.InvocationInfo.ScriptLineNumber)") }
finally {
    if (Test-Path -LiteralPath $fixture) {
        $fullFixture = [System.IO.Path]::GetFullPath($fixture)
        if (-not $fullFixture.StartsWith($temporaryBase, [System.StringComparison]::OrdinalIgnoreCase) -or
            (Split-Path -Leaf $fullFixture) -notmatch '^ggf-sources-[a-f0-9]{32}$') { throw "Unsafe cleanup path: $fullFixture" }
        Remove-Item -LiteralPath $fullFixture -Recurse -Force
    }
}
$testResult = [pscustomobject]@{ status = $(if ($testFailures.Count) { 'FAILED' } else { 'PASSED' }); passed = $passed; failed = $testFailures.Count; failures = $testFailures.ToArray() }
if ($OutputFormat -eq 'Json') { $testResult | ConvertTo-Json -Depth 5 }
else { Write-Host ("Source tests: passed={0}, failed={1}" -f $passed, $testFailures.Count); $testFailures | ForEach-Object { Write-Host $_ -ForegroundColor Red } }
if ($testFailures.Count) { exit 1 }
exit 0
