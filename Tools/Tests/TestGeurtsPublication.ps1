# Version: 1.0.0
[CmdletBinding()]
param(
    [string]$RepositoryRoot,
    [ValidateSet('Text', 'Json')][string]$OutputFormat = 'Text'
)
$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($RepositoryRoot)) { $RepositoryRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot) }
. (Join-Path $RepositoryRoot 'Tools/ValidateGeurtsPublication.ps1') -RepositoryRoot $RepositoryRoot -OutputFormat $OutputFormat
$passed = 0
$failures = New-Object 'System.Collections.Generic.List[string]'
$encoding = New-Object Text.UTF8Encoding($false)
$temporaryBase = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd([char[]]'\/') + [IO.Path]::DirectorySeparatorChar
$fixture = Join-Path $temporaryBase ('ggf-publication-' + [guid]::NewGuid().ToString('N'))

function Assert-Publication([bool]$Condition, [string]$Name) {
    if ($Condition) { $script:passed++; if ($OutputFormat -eq 'Text') { Write-Host "PASS: $Name" } }
    else { $script:failures.Add($Name); if ($OutputFormat -eq 'Text') { Write-Host "FAIL: $Name" } }
}
function Assert-PublicationFailure([scriptblock]$Action, [string]$Pattern, [string]$Name) {
    $message = ''
    try { $null = & $Action } catch { $message = $_.Exception.Message }
    Assert-Publication ($message -match $Pattern) $Name
}
function Write-PublicationFixture([string]$Root, [string]$Version, [string]$Content) {
    [IO.File]::WriteAllText((Join-Path $Root 'GeurtsTechniqueManifest.md'), "# Fixture`r`n`r`n**Version:** $Version`r`n", $encoding)
    [IO.File]::WriteAllText((Join-Path $Root 'README.md'), ($Content + "`r`n"), $encoding)
    $null = Invoke-GeurtsPublicationGit $Root @('add', '--all')
    $null = Invoke-GeurtsPublicationGit $Root @('-c', 'user.name=Publication fixture', '-c', 'user.email=fixture@example.invalid', 'commit', '--quiet', '-m', 'Fixture snapshot')
}
try {
    if (($fixture.Length + 100) -ge 260) { throw "Publication fixture needs a shorter temporary root: $fixture" }
    $root = Join-Path $fixture 'source with spaces'
    $null = New-Item -ItemType Directory -Path $root
    $null = Invoke-GeurtsPublicationGit $root @('init', '--quiet')
    Write-PublicationFixture $root '0.62.0' 'Original published content'
    $null = Invoke-GeurtsPublicationGit $root @('tag', 'v0.62.0')
    $original = Get-GeurtsPublicationResult -Root $root
    Assert-Publication ($original.status -ceq 'VALID' -and -not $original.changed) 'Unchanged published content can be revalidated'
    [IO.File]::AppendAllText((Join-Path $root 'README.md'), "Uncommitted edit`r`n", $encoding)
    Assert-PublicationFailure { Get-GeurtsPublicationResult -Root $root } 'uncommitted' 'Uncommitted content cannot masquerade as the committed candidate'
    Write-PublicationFixture $root '0.62.0' 'Changed content retaining the published version'
    Assert-PublicationFailure { Get-GeurtsPublicationResult -Root $root } 'higher than published' 'Changed content under a reused release version fails'
    Write-PublicationFixture $root '0.62.1' 'Compatible maintenance release'
    $next = Get-GeurtsPublicationResult -Root $root
    Assert-Publication ($next.changed -and $next.candidateVersion -ceq '0.62.1' -and $next.baselineTag -ceq 'v0.62.0') 'A higher version validates against the newest published tag'
    Assert-PublicationFailure { Get-GeurtsPublicationResult -Root $root -Tag 'v0.62.0' } 'differs from candidate' 'A tag must match the candidate documentation version'
    $null = Invoke-GeurtsPublicationGit $root @('tag', 'v0.62.1')
    $tagged = Get-GeurtsPublicationResult -Root $root -Tag 'v0.62.1'
    Assert-Publication (-not $tagged.changed) 'A matching immutable tag can be validated after publication'
    $shallow = Join-Path $fixture 'shallow'
    $url = 'file:///' + $root.Replace('\', '/')
    $null = Invoke-GeurtsPublicationGit $fixture @('clone', '--quiet', '--depth', '1', $url, $shallow)
    Assert-PublicationFailure { Get-GeurtsPublicationResult -Root $shallow } 'complete Git history' 'Shallow history cannot hide the release baseline'
    Write-PublicationFixture $root '0.61.9' 'Accidental downgrade'
    Assert-PublicationFailure { Get-GeurtsPublicationResult -Root $root } 'higher than published' 'A lower documentation version fails'
    $null = Invoke-GeurtsPublicationGit $root @('tag', 'v9.9.9')
    Assert-PublicationFailure { Get-GeurtsPublicationResult -Root $root } 'differs from its committed' 'A release tag with mismatched metadata fails'
    $untagged = Join-Path $fixture 'untagged'
    $null = New-Item -ItemType Directory -Path $untagged
    $null = Invoke-GeurtsPublicationGit $untagged @('init', '--quiet')
    Write-PublicationFixture $untagged '1.0.0' 'No fetched release baseline'
    Assert-PublicationFailure { Get-GeurtsPublicationResult -Root $untagged } 'No stable' 'Missing release tags fail visibly rather than skip comparison'
}
catch { $failures.Add('Publication harness: ' + $_.Exception.Message) }
finally {
    $resolved = [IO.Path]::GetFullPath($fixture)
    if ($resolved.StartsWith($temporaryBase, [StringComparison]::OrdinalIgnoreCase) -and
        (Split-Path -Leaf $resolved).StartsWith('ggf-publication-', [StringComparison]::Ordinal)) {
        if (Test-Path -LiteralPath $resolved) { Remove-Item -LiteralPath $resolved -Recurse -Force }
    }
    else { $failures.Add('Refused unsafe publication-fixture cleanup: ' + $resolved) }
}
$report = [pscustomobject]@{ status = $(if ($failures.Count) { 'FAILED' } else { 'PASSED' }); passed = $passed; failed = $failures.Count; failures = $failures.ToArray() }
if ($OutputFormat -eq 'Json') { $report | ConvertTo-Json -Depth 3 }
else { "Publication tests: passed=$passed failed=$($failures.Count)"; $failures | ForEach-Object { Write-Host $_ } }
if ($failures.Count) { exit 1 }
