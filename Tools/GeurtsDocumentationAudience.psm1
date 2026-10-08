# Version: 1.1.1
Set-StrictMode -Version Latest

function ConvertTo-GeurtsAudienceText {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][AllowEmptyString()][string]$Text,
        [ValidateSet('GameUse', 'ForgeDevelopment')][string]$Mode = 'GameUse',
        [switch]$IncludeHuman
    )

    $audiences = @('AI-READ', 'HUMAN-ONLY', 'FORGE-DEVELOPMENT-ONLY')
    $fileAudience = 'AI-READ'
    $sectionAudience = $null
    $fileTagSeen = $false
    $contentSeen = $false
    $fenceCharacter = $null
    $fenceLength = 0
    $skippedLines = 0
    $result = New-Object System.Text.StringBuilder
    $sourceLines = New-Object 'System.Collections.Generic.List[int]'
    $lineNumber = 0

    # Keep original line endings and literal fenced payloads. Tags must stand alone.
    foreach ($match in [regex]::Matches($Text, '[^\r\n]*(?:\r\n|\n|\r|$)')) {
        if ($match.Length -eq 0) { continue }
        $lineNumber++
        $line = $match.Value.TrimEnd([char[]]"`r`n")
        if ($null -eq $fenceCharacter) {
            if ($line -cmatch '^<!-- GEURTS-AUDIENCE: ([A-Z-]+) -->$') {
                if ($fileTagSeen -or $contentSeen -or $null -ne $sectionAudience) {
                    throw "Line ${lineNumber}: the file audience tag must occur once, before content."
                }
                $fileAudience = $Matches[1]
                if ($fileAudience -cnotin $audiences) { throw "Line ${lineNumber}: unknown audience '$fileAudience'." }
                $fileTagSeen = $true
                continue
            }
            if ($line -cmatch '^<!-- GEURTS-SECTION:BEGIN ([A-Z-]+) -->$') {
                if ($null -ne $sectionAudience) { throw "Line ${lineNumber}: audience sections cannot nest." }
                $sectionAudience = $Matches[1]
                if ($sectionAudience -cnotin $audiences) { throw "Line ${lineNumber}: unknown audience '$sectionAudience'." }
                $contentSeen = $true
                continue
            }
            if ($line -ceq '<!-- GEURTS-SECTION:END -->') {
                if ($null -eq $sectionAudience) { throw "Line ${lineNumber}: section end has no matching begin." }
                $sectionAudience = $null
                continue
            }
            if ($line -match '<!--\s*GEURTS-(?:AUDIENCE|SECTION)') {
                throw "Line ${lineNumber}: malformed audience tag."
            }
            if ($line -match '^ {0,3}(`{3,}|~{3,})(.*)$') {
                $delimiter = $Matches[1]
                $info = $Matches[2]
                if ($delimiter[0] -ne [char]96 -or -not $info.Contains([string][char]96)) {
                    $fenceCharacter = $delimiter[0]
                    $fenceLength = $delimiter.Length
                }
            }
        }
        elseif ($line -match '^ {0,3}(`{3,}|~{3,})\s*$') {
            $delimiter = $Matches[1]
            if ($delimiter[0] -eq $fenceCharacter -and $delimiter.Length -ge $fenceLength) {
                $fenceCharacter = $null
            }
        }

        if (-not [string]::IsNullOrWhiteSpace($line)) { $contentSeen = $true }
        $audience = if ($null -ne $sectionAudience) { $sectionAudience } else { $fileAudience }
        $include = $audience -ceq 'AI-READ' -or
            ($audience -ceq 'FORGE-DEVELOPMENT-ONLY' -and $Mode -eq 'ForgeDevelopment') -or
            ($audience -ceq 'HUMAN-ONLY' -and $IncludeHuman)
        if ($include) {
            [void]$result.Append($match.Value)
            [void]$sourceLines.Add($lineNumber)
        }
        else { $skippedLines++ }
    }
    if ($null -ne $sectionAudience) { throw 'Unclosed audience section; no filtered content returned.' }
    if ($null -ne $fenceCharacter) { throw 'Unclosed Markdown fence; audience boundaries cannot be verified.' }

    [pscustomobject]@{
        Content = $result.ToString()
        FileAudience = $fileAudience
        HasFileTag = $fileTagSeen
        SourceCharacters = $Text.Length
        ReturnedCharacters = $result.Length
        SkippedLines = $skippedLines
        SourceLines = $sourceLines.ToArray()
    }
}

function Read-GeurtsAudienceDocument {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$RepositoryRoot,
        [Parameter(Mandatory)][string]$Document,
        [ValidateSet('GameUse', 'ForgeDevelopment')][string]$Mode = 'GameUse',
        [switch]$IncludeHuman,
        [string[]]$Sections,
        [switch]$Preview
    )
    # This reader never discovers project files or follows paths outside this package.
    $root = [System.IO.Path]::GetFullPath($RepositoryRoot)
    $relative = $Document.Replace('\', '/')
    if ($relative -notmatch '^(?:[A-Za-z0-9_-]+/)*[A-Za-z0-9_.-]+\.md$' -or
        @($relative.Split('/') | Where-Object { $_ -in @('.', '..') }).Count -gt 0) {
        throw 'Document must be a relative Markdown path listed in the package manifest.'
    }
    foreach ($candidate in @('GeurtsTechniqueManifest.md', $relative)) {
        $current = Get-Item -LiteralPath $root -Force -ErrorAction Stop
        if (($current.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0) { throw 'Linked documentation roots are not supported.' }
        foreach ($segment in $candidate.Split('/')) {
            $current = Get-Item -LiteralPath (Join-Path $current.FullName $segment) -Force -ErrorAction Stop
            if (($current.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0) { throw 'Linked documentation paths are not supported.' }
        }
        if ($current.PSIsContainer) { throw 'A documentation file was expected.' }
    }
    $manifest = [System.IO.File]::ReadAllText((Join-Path $root 'GeurtsTechniqueManifest.md'))
    $registry = [regex]::Match($manifest, '(?s)<!-- GEURTS-PACKAGE-FILES:BEGIN -->(.*?)<!-- GEURTS-PACKAGE-FILES:END -->')
    $registered = @([regex]::Matches($registry.Groups[1].Value, '(?m)^\| `([^`]+)` \|') | ForEach-Object { $_.Groups[1].Value })
    if (-not $registry.Success -or $relative -cnotin $registered) { throw "Document is not registered in this package: $relative" }
    $text = [System.IO.File]::ReadAllText((Join-Path $root $relative))
    $audienceRead = ConvertTo-GeurtsAudienceText -Text $text -Mode $Mode -IncludeHuman:$IncludeHuman
    $sectionRead = Select-GeurtsDocumentSections -Manifest $manifest -RegisteredDocuments $registered -Document $relative -Source $text -Content $audienceRead.Content -SourceLines $audienceRead.SourceLines -Sections $Sections
    [pscustomobject]@{
        Content = if ($Preview) { '' } else { $sectionRead.Content }
        FileAudience = $audienceRead.FileAudience
        HasFileTag = $audienceRead.HasFileTag
        SourceCharacters = $audienceRead.SourceCharacters
        ReturnedCharacters = if ($Preview) { 0 } else { $sectionRead.Content.Length }
        ReadingCharacters = $sectionRead.Content.Length
        FullAudienceCharacters = $audienceRead.ReturnedCharacters
        SkippedLines = $audienceRead.SkippedLines
        SkippedSections = $sectionRead.SkippedSections
        PreviewOnly = [bool]$Preview
        Headings = $sectionRead.Headings
    }
}

# Scan top-level H1/H2 boundaries in the source; H3-H6 remain within their parent.
# Setext candidates are conservative so ambiguous prose cannot hide required rules.
function Get-GeurtsHeadingParts {
    param([AllowEmptyString()][string]$Text)
    $parts = New-Object 'System.Collections.Generic.List[object]'
    $fenceCharacter = $null
    $fenceLength = 0
    $lineNumber = 0
    $paragraph = New-Object 'System.Collections.Generic.List[string]'
    $paragraphStart = 0
    $paragraphLine = 0
    foreach ($lineMatch in [regex]::Matches($Text, '[^\r\n]*(?:\r\n|\n|\r|$)')) {
        if ($lineMatch.Length -eq 0) { continue }
        $lineNumber++
        $line = $lineMatch.Value.TrimEnd([char[]]"`r`n")
        if ($null -eq $fenceCharacter) {
            if ($line -match '^ {0,3}(`{3,}|~{3,})(.*)$') {
                $delimiter = $Matches[1]
                $info = $Matches[2]
                if ($delimiter[0] -ne [char]96 -or -not $info.Contains([string][char]96)) {
                    $fenceCharacter = $delimiter[0]
                    $fenceLength = $delimiter.Length
                    $paragraph.Clear()
                    continue
                }
            }
            if ($line -cmatch '^ {0,3}(#{1,6})([ \t].*|)$') {
                $level = $Matches[1].Length
                $heading = [regex]::Replace($Matches[2], '[ \t]+#+[ \t]*$', '').Trim([char[]]" `t")
                if ($level -le 2) {
                    [void]$parts.Add([pscustomobject]@{ Heading = $heading; Level = $level; Start = $lineMatch.Index; Line = $lineNumber })
                }
                $paragraph.Clear()
            }
            elseif ($paragraph.Count -gt 0 -and $line -cmatch '^ {0,3}(=+|-+)[ \t]*$') {
                $level = if ($Matches[1][0] -eq [char]'=') { 1 } else { 2 }
                [void]$parts.Add([pscustomobject]@{ Heading = ($paragraph.ToArray() -join "`n"); Level = $level; Start = $paragraphStart; Line = $paragraphLine })
                $paragraph.Clear()
            }
            elseif ([string]::IsNullOrWhiteSpace($line) -or
                $line -match '^ {0,3}(?:>|<|[-+*](?:[ \t]|$)|[0-9]{1,9}[.)](?:[ \t]|$)|(?:\*[ \t]*){3,}$|(?:_[ \t]*){3,}$|(?:-[ \t]*){3,}$)') {
                $paragraph.Clear()
            }
            elseif ($paragraph.Count -gt 0 -or $line -notmatch '^(?: {4}| *\t)') {
                if ($paragraph.Count -eq 0) {
                    $paragraphStart = $lineMatch.Index
                    $paragraphLine = $lineNumber
                }
                [void]$paragraph.Add($line.Trim([char[]]" `t"))
            }
        }
        elseif ($line -match '^ {0,3}(`{3,}|~{3,})\s*$') {
            $delimiter = $Matches[1]
            if ($delimiter[0] -eq $fenceCharacter -and $delimiter.Length -ge $fenceLength) { $fenceCharacter = $null }
        }
    }
    $parts.ToArray()
}

# Only the manifest may make a section conditional. Untabled content stays required.
function Select-GeurtsDocumentSections {
    param([string]$Manifest, [string[]]$RegisteredDocuments, [string]$Document, [string]$Source, [AllowEmptyString()][string]$Content, [int[]]$SourceLines, [string[]]$Sections)
    $protectedPaths = @('AI_READ_FIRST.md', 'GeurtsTechniqueManifest.md',
        'GeurtsTechniques/GeurtsAgentTechnique.md', 'GeurtsTechniques/GeurtsGitIgnoreTechnique.md',
        'GeurtsTechniques/GeurtsGitAttributesTechnique.md')
    $protected = $Document -cin $protectedPaths -or $Document.StartsWith('Tools/AIAgentInstructionTemplates/', [System.StringComparison]::Ordinal)
    if ($Sections -and $protected) { throw 'Bootstrap files and exact installer payloads do not support partial reading.' }
    $maps = @([regex]::Matches($Manifest, '(?s)<!-- GEURTS-READ-SECTIONS:BEGIN -->(.*?)<!-- GEURTS-READ-SECTIONS:END -->'))
    $hasMapMarker = $Manifest.Contains('GEURTS-READ-SECTIONS:')
    $idToHeading = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([System.StringComparer]::Ordinal)
    $headingToId = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([System.StringComparer]::Ordinal)
    if ($hasMapMarker) {
        if ($maps.Count -ne 1 -or ([regex]::Matches($Manifest, '<!-- GEURTS-READ-SECTIONS:BEGIN -->')).Count -ne 1 -or
            ([regex]::Matches($Manifest, '<!-- GEURTS-READ-SECTIONS:END -->')).Count -ne 1) { throw 'Malformed controlled-section registry.' }
        $seenKeys = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
        foreach ($row in $maps[0].Groups[1].Value -split '\r?\n') {
            if ([string]::IsNullOrWhiteSpace($row) -or $row -ceq '| Document | Section ID | Exact heading | When required |' -or $row -ceq '|---|---|---|---|') { continue }
            if ($row -cnotmatch '^\| `(?<Document>(?:[A-Za-z0-9_-]+/)*[A-Za-z0-9_.-]+\.md)` \| `(?<Id>[a-z][a-z0-9]*(?:_[a-z0-9]+)*)` \| (?<Heading>[^|]+) \| (?<When>[^|]+) \|$') { throw 'Malformed controlled-section row.' }
            $mappedDocument, $id, $heading = $Matches.Document, $Matches.Id, $Matches.Heading
            if ($mappedDocument -cnotin $RegisteredDocuments -or $mappedDocument -cin $protectedPaths -or
                $mappedDocument.StartsWith('Tools/AIAgentInstructionTemplates/', [System.StringComparison]::Ordinal)) {
                throw 'Controlled sections must belong to registered, non-protected Markdown documents.'
            }
            if ($id -ceq 'core' -or [string]::IsNullOrWhiteSpace($Matches.When) -or [string]::IsNullOrWhiteSpace($heading) -or
                -not $seenKeys.Add($mappedDocument + '|' + $id)) { throw 'Empty condition or duplicate controlled-section ID.' }
            if ($mappedDocument -ceq $Document) {
                if ($protected -or $headingToId.ContainsKey($heading)) { throw 'Protected payload or duplicate controlled heading in section registry.' }
                $idToHeading.Add($id, $heading)
                $headingToId.Add($heading, $id)
            }
        }
    }
    elseif ($Sections) { throw 'This package has no controlled-section registry; read the whole document.' }
    $rawParts = @(Get-GeurtsHeadingParts -Text $Source)
    foreach ($heading in $headingToId.Keys) {
        if (@($rawParts | Where-Object { $_.Level -eq 2 -and $_.Heading -ceq $heading }).Count -ne 1) { throw "Missing or duplicate controlled heading: $heading" }
    }
    $selected = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
    foreach ($id in $Sections) {
        if ([string]::IsNullOrWhiteSpace($id) -or ($id -cne 'core' -and -not $idToHeading.ContainsKey($id))) { throw "Unknown controlled section '$id' for $Document." }
        if (-not $selected.Add($id)) { throw "Duplicate requested section '$id'." }
    }
    # Translate original boundaries through audience filtering instead of reparsing
    # concatenated text. Hidden headings still end preceding optional topics.
    $contentLines = @([regex]::Matches($Content, '[^\r\n]*(?:\r\n|\n|\r|$)') | Where-Object { $_.Length -gt 0 })
    if ($contentLines.Count -ne $SourceLines.Count) { throw 'Audience source-line mapping is inconsistent; no partial content returned.' }
    $parts = New-Object 'System.Collections.Generic.List[object]'
    $cursor = 0
    foreach ($rawPart in $rawParts) {
        while ($cursor -lt $SourceLines.Count -and $SourceLines[$cursor] -lt $rawPart.Line) { $cursor++ }
        $start = if ($cursor -lt $contentLines.Count) { $contentLines[$cursor].Index } else { $Content.Length }
        $visible = $cursor -lt $SourceLines.Count -and $SourceLines[$cursor] -eq $rawPart.Line
        [void]$parts.Add([pscustomobject]@{ Heading = $rawPart.Heading; Level = $rawPart.Level; Line = $rawPart.Line; Start = $start; Visible = $visible })
    }
    foreach ($id in $selected) {
        if ($id -ceq 'core') { continue }
        if (@($parts | Where-Object { $_.Level -eq 2 -and $_.Visible -and $_.Heading -ceq $idToHeading[$id] }).Count -ne 1) { throw "Section '$id' is not readable in the chosen audience mode." }
    }
    $output = New-Object System.Text.StringBuilder
    $index = New-Object 'System.Collections.Generic.List[object]'
    $skipped = 0
    $firstStart = if ($parts.Count) { $parts[0].Start } else { $Content.Length }
    [void]$output.Append($Content.Substring(0, $firstStart))
    for ($position = 0; $position -lt $parts.Count; $position++) {
        $part = $parts[$position]
        $end = if ($position + 1 -lt $parts.Count) { $parts[$position + 1].Start } else { $Content.Length }
        $length = $end - $part.Start
        $optional = $part.Level -eq 2 -and $headingToId.ContainsKey($part.Heading)
        $id = if ($optional) { $headingToId[$part.Heading] } else { $null }
        $include = -not $Sections -or -not $optional -or $selected.Contains($id)
        if ($part.Level -eq 2 -and $part.Visible) {
            [void]$index.Add([pscustomobject]@{ id = $id; heading = $part.Heading; sourceLine = $part.Line;
                required = -not $optional; selected = $include; characters = $length })
        }
        if ($include) { [void]$output.Append($Content.Substring($part.Start, $length)) }
        elseif ($part.Visible) { $skipped++ }
    }
    [pscustomobject]@{ Content = $output.ToString(); Headings = $index.ToArray(); SkippedSections = $skipped }
}

Export-ModuleMember -Function ConvertTo-GeurtsAudienceText, Read-GeurtsAudienceDocument
