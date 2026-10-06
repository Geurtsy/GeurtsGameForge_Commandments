# Version: 1.1.0
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Document,
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot),
    [ValidateSet('GameUse', 'ForgeDevelopment')][string]$Mode = 'GameUse',
    [switch]$IncludeHuman,
    [string[]]$Sections,
    [switch]$Preview,
    [ValidateSet('Text', 'Json')][string]$OutputFormat = 'Text'
)
$ErrorActionPreference = 'Stop'
try {
    Import-Module (Join-Path $PSScriptRoot 'GeurtsDocumentationAudience.psm1') -Force
    $result = Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document $Document -Mode $Mode -IncludeHuman:$IncludeHuman -Sections $Sections -Preview:$Preview
    if ($OutputFormat -eq 'Json') {
        $metadata = [ordered]@{
            document = $Document
            mode = $Mode
            includeHuman = [bool]$IncludeHuman
            fileAudience = $result.FileAudience
            sourceCharacters = $result.SourceCharacters
            returnedCharacters = $result.ReturnedCharacters
            skippedLines = $result.SkippedLines
            fullAudienceCharacters = $result.FullAudienceCharacters
            readingCharacters = $result.ReadingCharacters
            skippedSections = $result.SkippedSections
            previewOnly = $result.PreviewOnly
            headings = $result.Headings
        }
        if (-not $Preview) { $metadata['content'] = $result.Content }
        [pscustomobject]$metadata | ConvertTo-Json -Depth 4
    }
    elseif ($Preview) {
        "Preview only; required rules have not been read. Planned reading: $($result.ReadingCharacters) characters."
        foreach ($heading in $result.Headings) {
            $id = if ($heading.required) { 'required' } else { $heading.id }
            "[$id] $($heading.heading) | source line $($heading.sourceLine) | $($heading.characters) characters | selected: $($heading.selected)"
        }
    }
    else { $result.Content }
}
catch {
    Write-Error -Message $_.Exception.Message -ErrorAction Continue
    exit 1
}
