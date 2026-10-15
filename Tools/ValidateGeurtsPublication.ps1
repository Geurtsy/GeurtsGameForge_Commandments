# Version: 1.0.0
<#
.SYNOPSIS
Checks committed documentation against the newest locally available stable release tag.
.DESCRIPTION
Read-only and offline. Fetch the complete official history and tags separately first.
An unchanged tagged tree may be revalidated; changed content needs a higher version.
This gate does not publish, fetch, validate brick sources or execute package code.
#>
[CmdletBinding()]
param(
    [string]$RepositoryRoot,
    [string]$CandidateRef = 'HEAD',
    [string]$ExpectedTag,
    [ValidateSet('Text', 'Json')][string]$OutputFormat = 'Text'
)
if ([string]::IsNullOrWhiteSpace($RepositoryRoot)) { $RepositoryRoot = Split-Path -Parent $PSScriptRoot }

function Invoke-GeurtsPublicationGit([string]$Root, [string[]]$Arguments) {
    $previousPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $output = @(& git -C $Root @Arguments 2>&1)
        $code = $LASTEXITCODE
    }
    finally { $ErrorActionPreference = $previousPreference }
    if ($code -ne 0) { throw "Git publication inspection failed: $($output -join ' ')" }
    return $output -join "`n"
}

function Get-GeurtsPublicationVersion([string]$Root, [string]$Commit) {
    $manifest = Invoke-GeurtsPublicationGit $Root @('show', ($Commit + ':GeurtsTechniqueManifest.md'))
    $versions = [regex]::Matches($manifest, '(?m)^\*\*Version:\*\*\s*((?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*))\s*$')
    if ($versions.Count -ne 1) { throw "Commit $Commit must declare exactly one stable documentation version." }
    return [version]$versions[0].Groups[1].Value
}

function Get-GeurtsPublicationResult {
    [CmdletBinding()]
    param([string]$Root, [string]$Ref = 'HEAD', [string]$Tag)
    $rootPath = [IO.Path]::GetFullPath($Root)
    if ($rootPath.Length -ge 260) { throw "Repository path is $($rootPath.Length) characters (maximum 259): $rootPath" }
    if ((Invoke-GeurtsPublicationGit $rootPath @('rev-parse', '--is-shallow-repository')) -cne 'false') {
        throw 'Publication requires complete Git history and fetched release tags; shallow history is not supported.'
    }
    if (-not [string]::IsNullOrWhiteSpace((Invoke-GeurtsPublicationGit $rootPath @('status', '--porcelain', '--untracked-files=normal')))) {
        throw 'Commit or remove task-owned uncommitted changes before validating publication.'
    }
    $candidate = Invoke-GeurtsPublicationGit $rootPath @('rev-parse', '--verify', '--end-of-options', ($Ref + '^{commit}'))
    $candidateVersion = Get-GeurtsPublicationVersion $rootPath $candidate
    $releases = @(foreach ($name in ((Invoke-GeurtsPublicationGit $rootPath @('for-each-ref', '--format=%(refname:short)', 'refs/tags')) -split "`n")) {
        if ($name -cmatch '^v(?<Version>(?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*))$') {
            [pscustomobject]@{ name = $name; version = [version]$Matches.Version }
        }
    })
    if (-not $releases.Count) { throw 'No stable vMAJOR.MINOR.PATCH release tag is available. Fetch the official release tags first.' }
    $latest = $releases | Sort-Object version -Descending | Select-Object -First 1
    $baseline = Invoke-GeurtsPublicationGit $rootPath @('rev-parse', '--verify', ($latest.name + '^{commit}'))
    if ((Get-GeurtsPublicationVersion $rootPath $baseline) -ne $latest.version) {
        throw "Release tag $($latest.name) differs from its committed documentation version."
    }
    $null = Invoke-GeurtsPublicationGit $rootPath @('merge-base', '--is-ancestor', $baseline, $candidate)
    if ($Tag) {
        if ($Tag -cne ('v' + $candidateVersion.ToString())) { throw "Tag $Tag differs from candidate version $candidateVersion." }
        $tagCommit = Invoke-GeurtsPublicationGit $rootPath @('rev-parse', '--verify', '--end-of-options', ($Tag + '^{commit}'))
        if ($tagCommit -cne $candidate) { throw "Tag $Tag does not identify the candidate commit." }
    }
    $baselineTree = Invoke-GeurtsPublicationGit $rootPath @('rev-parse', ($baseline + '^{tree}'))
    $candidateTree = Invoke-GeurtsPublicationGit $rootPath @('rev-parse', ($candidate + '^{tree}'))
    $changed = $baselineTree -cne $candidateTree
    if ($candidateVersion -lt $latest.version -or ($changed -and $candidateVersion -eq $latest.version)) {
        throw "Changed content requires a documentation version higher than published $($latest.version); candidate declares $candidateVersion."
    }
    [pscustomobject]@{
        status = 'VALID'
        candidateCommit = $candidate
        candidateVersion = $candidateVersion.ToString()
        baselineTag = $latest.name
        baselineCommit = $baseline
        baselineVersion = $latest.version.ToString()
        changed = $changed
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    $ErrorActionPreference = 'Stop'
    try {
        $result = Get-GeurtsPublicationResult -Root $RepositoryRoot -Ref $CandidateRef -Tag $ExpectedTag
        if ($OutputFormat -eq 'Json') { $result | ConvertTo-Json -Depth 3 }
        else { "Publication version VALID: $($result.candidateVersion), baseline $($result.baselineTag), changed=$($result.changed)." }
    }
    catch {
        if ($OutputFormat -eq 'Json') { [pscustomobject]@{ status = 'FAILED'; message = $_.Exception.Message } | ConvertTo-Json }
        else { Write-Error -Message $_.Exception.Message -ErrorAction Continue }
        exit 1
    }
}
