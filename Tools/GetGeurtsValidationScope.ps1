# Version: 1.0.0
# Select regressions from a complete Git diff; never trust a caller-supplied path list.
[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot),
    [string]$BaseRevision,
    [string]$ReleaseTag,
    [ValidateSet('Text', 'Json')][string]$OutputFormat = 'Json'
)
$ErrorActionPreference = 'Stop'
$scope = 'Full'
$reason = 'No trustworthy complete change range; run full regressions.'
$paths = @()
try {
    $root = [IO.Path]::GetFullPath($RepositoryRoot)
    # Tag push events have no useful before SHA. Resolve an actual current tag
    # and the newest prior stable ancestor release, never a guessed parent/range.
    if (($BaseRevision -match '^0+$' -or [string]::IsNullOrWhiteSpace($BaseRevision)) -and
        -not [string]::IsNullOrWhiteSpace($ReleaseTag)) {
        if ($ReleaseTag -cnotmatch '^v(?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*)$') { throw 'Invalid stable release tag.' }
        $tagCommit = [string](& git -C $root rev-parse --verify ($ReleaseTag + '^{commit}') 2>$null)
        if ($LASTEXITCODE -ne 0) { throw 'Current release tag unavailable.' }
        $headCommit = [string](& git -C $root rev-parse HEAD)
        if ($LASTEXITCODE -ne 0 -or $tagCommit -cne $headCommit) { throw 'Release tag does not identify this candidate.' }
        $priorTags = @(& git -C $root tag --merged HEAD --sort=-version:refname)
        if ($LASTEXITCODE -ne 0) { throw 'Release ancestry unavailable.' }
        $priorTags = @($priorTags | Where-Object { $_ -cne $ReleaseTag -and $_ -cmatch '^v(?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*)$' })
        if ($priorTags.Count -eq 0) { throw 'No previous stable ancestor release.' }
        $BaseRevision = [string](& git -C $root rev-parse --verify ($priorTags[0] + '^{commit}') 2>$null)
        if ($LASTEXITCODE -ne 0) { throw 'Previous stable release unavailable.' }
    }
    if ($BaseRevision -cnotmatch '^[0-9a-f]{40}$' -or $BaseRevision -match '^0+$') { throw 'Base must be an exact existing commit.' }
    & git -C $root cat-file -e ($BaseRevision + '^{commit}') 2>$null
    if ($LASTEXITCODE -ne 0) { throw 'Base commit unavailable.' }
    & git -C $root merge-base --is-ancestor $BaseRevision HEAD 2>$null
    if ($LASTEXITCODE -ne 0) { throw 'Base is not an ancestor of this candidate.' }
    $dirty = @(& git -C $root status --porcelain --untracked-files=all)
    if ($LASTEXITCODE -ne 0 -or $dirty.Count) { throw 'Candidate must be clean and committed.' }
    $changes = @(& git -C $root -c core.quotePath=true diff --no-renames --name-status $BaseRevision HEAD --)
    if ($LASTEXITCODE -ne 0 -or $changes.Count -eq 0) { throw 'No complete changed-file set.' }
    $paths = @($changes | ForEach-Object { ($_ -split "`t", 2)[1] })
    $registry = [IO.File]::ReadAllText((Join-Path $root 'GeurtsTechniques/GeurtsDocumentationRegistry.json')) | ConvertFrom-Json
    $full = $false
    # These owners change shared validation, permissions, preservation or startup.
    $sharedOwners = @('GeurtsTechnicalTechnique.md', 'GeurtsGameForgeAutomationTechnique.md',
        'GeurtsDocumentationMaintenanceTechnique.md', 'GeurtsBrickContract.md',
        'GeurtsCommandmentsCompanionTechnique.md', 'GeurtsBigBangTechnique.md',
        'GeurtsForgeSetupTechnique.md', 'GeurtsFolderStructureTechnique.md',
        'GeurtsAIAgentSetupTechnique.md', 'GeurtsGameDesignDocumentationTechnique.md')
    foreach ($change in $changes) {
        if ($change -cnotmatch '^M\t(?<Path>[A-Za-z0-9_./-]+)$') { $full = $true; break }
        $path = $Matches.Path
        if ($path -cnotin @($registry.files.path)) { $full = $true; break }
        $before = @(& git -C $root show ($BaseRevision + ':' + $path)) -join "`n"
        if ($LASTEXITCODE -ne 0) { $full = $true; break }
        $after = [IO.File]::ReadAllText((Join-Path $root $path)).Replace("`r`n", "`n").TrimEnd("`n")
        if ($path -ceq 'GeurtsTechniques/GeurtsBrickCatalogue.json') { continue }
        if ($path -cin @('GeurtsTechniques/GeurtsFolderStructureDefinition.json',
            'GeurtsTechniques/GeurtsCommandmentsCompanionContract.json', 'GeurtsTechniques/GeurtsForgeSetupContract.json')) {
            $old = [regex]::Replace($before, '"packageVersion":\s*"[0-9.]+"', '"packageVersion": "VERSION"')
            $new = [regex]::Replace($after, '"packageVersion":\s*"[0-9.]+"', '"packageVersion": "VERSION"')
            if ($old -cne $new) { $full = $true; break }
            continue
        }
        if ($path -ceq 'GeurtsTechniques/GeurtsDocumentationRegistry.json') {
            # Permit version synchronization only, never inventory/section/role changes.
            $old = [regex]::Replace($before, '"(?:packageVersion|version)":\s*"[0-9.]+"', '"version": "VERSION"')
            $new = [regex]::Replace($after, '"(?:packageVersion|version)":\s*"[0-9.]+"', '"version": "VERSION"')
            if ($old -cne $new) { $full = $true; break }
            continue
        }
        if ($path -cin @('AGENTS.md', 'AI_READ_FIRST.md', 'GeurtsTechniqueManifest.md')) {
            $old = [regex]::Replace($before, '(?m)^\*\*Version:\*\* [0-9.]+$', '**Version:** VERSION')
            $new = [regex]::Replace($after, '(?m)^\*\*Version:\*\* [0-9.]+$', '**Version:** VERSION')
            if ($old -cne $new) { $full = $true; break }
            continue
        }
        if ($path -ceq 'GeurtsTechniques/GeurtsBrickUsageGuide.md') {
            # Brick evidence may change; shared instructions before the first brick may not.
            $old = ($before -split '(?m)^## ', 3)[0..1] -join '## '
            $new = ($after -split '(?m)^## ', 3)[0..1] -join '## '
            $old = [regex]::Replace($old, '(?m)^\*\*Version:\*\* [0-9.]+$', '**Version:** VERSION')
            $new = [regex]::Replace($new, '(?m)^\*\*Version:\*\* [0-9.]+$', '**Version:** VERSION')
            if ($old -cne $new) { $full = $true; break }
            continue
        }
        if ($path -ceq 'README.md' -or $path.StartsWith('History/', [StringComparison]::Ordinal) -or
            ($path.StartsWith('GeurtsTechniques/', [StringComparison]::Ordinal) -and $path.EndsWith('.md') -and
            (Split-Path -Leaf $path) -cnotin $sharedOwners)) { continue }
        $full = $true
        break
    }
    if (-not $full) {
        $scope = 'Content'
        $reason = 'Known content/catalogue changes: full static validation on both supported PowerShell hosts; no unchanged tool regressions.'
    } else { $reason = 'Shared policy, tools, workflow, contract, inventory or unknown change: full regressions.' }
} catch { $reason = 'Full fallback: ' + $_.Exception.Message }
$result = [pscustomobject]@{scope=$scope; reason=$reason; base=$BaseRevision; changedPaths=$paths}
if ($OutputFormat -eq 'Json') { $result | ConvertTo-Json -Depth 4 } else { $result }
