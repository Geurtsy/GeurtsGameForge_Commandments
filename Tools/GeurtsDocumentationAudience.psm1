# Version: 2.0.0
Set-StrictMode -Version Latest

# Registry parsing is shared by the reader and source validator. No legacy fallback:
# released God table consumers need a coordinated owner release before publication.
function Get-GeurtsLocalPackageFile {
    param([string]$Root, [string]$Relative)
    if ($Relative -cnotmatch '^(?:[A-Za-z0-9_.-]+/)*[A-Za-z0-9_.-]+$') { throw "Unsafe package path: $Relative" }
    foreach ($segment in $Relative.Split('/')) {
        if ($segment -in @('.', '..') -or $segment.EndsWith('.') -or
            $segment -match '^(?i:con|prn|aux|nul|com[1-9]|lpt[1-9])(?:\.|$)') { throw "Unsafe package path: $Relative" }
    }
    $current = Get-Item -LiteralPath ([IO.Path]::GetFullPath($Root)) -Force -ErrorAction Stop
    if (($current.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw 'Linked documentation roots are not supported.' }
    foreach ($segment in $Relative.Split('/')) {
        $current = Get-Item -LiteralPath (Join-Path $current.FullName $segment) -Force -ErrorAction Stop
        if (($current.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw 'Linked documentation paths are not supported.' }
    }
    if ($current.PSIsContainer) { throw 'A documentation file was expected.' }
    return $current.FullName
}

function Assert-GeurtsRegistryProperties {
    param($Value, [string[]]$Names)
    if ($null -eq $Value -or $Value -isnot [pscustomobject]) { throw 'Registry object expected.' }
    $actual = @($Value.PSObject.Properties.Name | Sort-Object)
    $expected = @($Names | Sort-Object)
    if (($actual -join '|') -cne ($expected -join '|')) { throw 'Missing or unsupported registry fields.' }
}

function Read-GeurtsDocumentationRegistry {
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$RepositoryRoot)
    $relative = 'GeurtsTechniques/GeurtsDocumentationRegistry.json'
    $manifest = [IO.File]::ReadAllText((Get-GeurtsLocalPackageFile $RepositoryRoot 'GeurtsTechniqueManifest.md'))
    $declaration = '<!-- GEURTS-REGISTRY: ' + $relative + ' -->'
    if ([regex]::Matches($manifest, [regex]::Escape($declaration)).Count -ne 1 -or
        [regex]::Matches($manifest, 'GEURTS-REGISTRY:').Count -ne 1 -or
        $manifest -match 'GEURTS-(?:PACKAGE-FILES|READ-SECTIONS):') { throw 'Missing, duplicate or conflicting registry format declaration.' }
    $version = [regex]::Matches($manifest, '(?m)^\*\*Version:\*\*[ \t]+((?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*))[ \t]*\r?$')
    if ($version.Count -ne 1) { throw 'Manifest must declare exactly one package version.' }
    $json = [IO.File]::ReadAllText((Get-GeurtsLocalPackageFile $RepositoryRoot $relative))
    # ConvertFrom-Json in Windows PowerShell silently accepts duplicate properties.
    # Inspect decoded object keys first, including escaped and case-variant aliases.
    $objects = New-Object 'System.Collections.Generic.Stack[object]'
    foreach ($token in [regex]::Matches($json, '"(?:[^"\\]|\\.)*"|[{}\[\]]')) {
        if ($token.Value -ceq '{') {
            $objects.Push((New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::OrdinalIgnoreCase)))
        }
        elseif ($token.Value -ceq '[') { $objects.Push($null) }
        elseif ($token.Value -in @('}', ']')) {
            if ($objects.Count -eq 0) { throw 'Malformed registry JSON.' }
            [void]$objects.Pop()
        }
        elseif ($json.Substring($token.Index + $token.Length) -match '^\s*:') {
            if ($objects.Count -eq 0 -or $null -eq $objects.Peek()) { throw 'Malformed registry object.' }
            $key = @(('[' + $token.Value + ']') | ConvertFrom-Json)[0]
            if (-not $objects.Peek().Add([string]$key)) { throw "Duplicate registry JSON property: $key" }
        }
    }
    if ($objects.Count -ne 0) { throw 'Malformed registry JSON.' }
    $registry = $json | ConvertFrom-Json -ErrorAction Stop
    Assert-GeurtsRegistryProperties $registry @('schemaVersion', 'packageVersion', 'files', 'controlledSections')
    if ($registry.schemaVersion -isnot [string] -or $registry.schemaVersion -cne '1.0.0') { throw 'Unsupported documentation registry schema.' }
    if ($registry.packageVersion -isnot [string] -or $registry.packageVersion -cne $version[0].Groups[1].Value) { throw 'Registry package version differs from the same-copy manifest.' }
    if ($registry.files -isnot [array] -or $registry.files.Count -eq 0 -or $registry.controlledSections -isnot [array]) { throw 'Registry files and controlledSections must be arrays.' }
    $paths = New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::OrdinalIgnoreCase)
    foreach ($file in $registry.files) {
        Assert-GeurtsRegistryProperties $file @('path', 'version', 'role')
        if ($file.path -isnot [string] -or $file.path -cnotmatch '^(?:[A-Za-z0-9_.-]+/)*[A-Za-z0-9_.-]+$') { throw 'Unsafe registry file path.' }
        foreach ($segment in $file.path.Split('/')) {
            if ($segment -in @('.', '..') -or $segment.EndsWith('.') -or
                $segment -match '^(?i:con|prn|aux|nul|com[1-9]|lpt[1-9])(?:\.|$)') { throw 'Unsafe registry file path.' }
        }
        if (-not $paths.Add($file.path)) { throw "Duplicate registry path: $($file.path)" }
        if ($file.version -isnot [string] -or $file.version -cnotmatch '^(?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*)(?:\.(?:0|[1-9][0-9]*))?$' -or
            $file.role -isnot [string] -or [string]::IsNullOrWhiteSpace($file.role)) { throw 'Invalid registry file version or role.' }
    }
    foreach ($required in @('AI_READ_FIRST.md', 'GeurtsTechniqueManifest.md', $relative)) {
        $record = @($registry.files | Where-Object { $_.path -ceq $required })
        if ($record.Count -ne 1 -or $record[0].version -cne $registry.packageVersion) { throw "Missing or mismatched registry bootstrap record: $required" }
    }
    $keys = New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::OrdinalIgnoreCase)
    $headings = New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal)
    $protected = @('AI_READ_FIRST.md', 'GeurtsTechniqueManifest.md', 'GeurtsTechniques/GeurtsAgentTechnique.md', 'GeurtsTechniques/GeurtsGitIgnoreTechnique.md', 'GeurtsTechniques/GeurtsGitAttributesTechnique.md')
    foreach ($section in $registry.controlledSections) {
        Assert-GeurtsRegistryProperties $section @('document', 'id', 'heading', 'whenRequired')
        if ($section.document -isnot [string] -or $section.document -cnotin @($registry.files.path) -or
            -not $section.document.EndsWith('.md', [StringComparison]::Ordinal) -or $section.document -cin $protected -or
            $section.document.StartsWith('Tools/AIAgentInstructionTemplates/', [StringComparison]::Ordinal)) { throw 'Controlled section must belong to registered, non-protected Markdown.' }
        if ($section.id -isnot [string] -or $section.id -cnotmatch '^[a-z][a-z0-9]*(?:_[a-z0-9]+)*$' -or $section.id -ceq 'core' -or
            -not $keys.Add($section.document + '|' + $section.id)) { throw 'Invalid or duplicate controlled-section ID.' }
        if ($section.heading -isnot [string] -or [string]::IsNullOrWhiteSpace($section.heading) -or
            $section.whenRequired -isnot [string] -or [string]::IsNullOrWhiteSpace($section.whenRequired) -or
            -not $headings.Add($section.document + '|' + $section.heading)) { throw 'Empty condition or ambiguous controlled heading.' }
    }
    return $registry
}

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
    $registry = Read-GeurtsDocumentationRegistry -RepositoryRoot $root
    $record = @($registry.files | Where-Object { $_.path -ceq $relative })
    if ($record.Count -ne 1) { throw "Document is not registered in this package: $relative" }
    $text = [System.IO.File]::ReadAllText((Get-GeurtsLocalPackageFile $root $relative))
    $audienceRead = ConvertTo-GeurtsAudienceText -Text $text -Mode $Mode -IncludeHuman:$IncludeHuman
    $sectionRead = Select-GeurtsDocumentSections -SectionRecords @($registry.controlledSections) -Document $relative -Source $text -Content $audienceRead.Content -SourceLines $audienceRead.SourceLines -Sections $Sections
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
        DocumentMetadata = [pscustomobject]@{ path = $record[0].path; version = $record[0].version; role = $record[0].role;
            controlledSections = @($registry.controlledSections | Where-Object { $_.document -ceq $relative }) }
        PackageVersion = $registry.packageVersion
        RegistrySchemaVersion = $registry.schemaVersion
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
    param([object[]]$SectionRecords, [string]$Document, [string]$Source, [AllowEmptyString()][string]$Content, [int[]]$SourceLines, [string[]]$Sections)
    $protectedPaths = @('AI_READ_FIRST.md', 'GeurtsTechniqueManifest.md',
        'GeurtsTechniques/GeurtsAgentTechnique.md', 'GeurtsTechniques/GeurtsGitIgnoreTechnique.md',
        'GeurtsTechniques/GeurtsGitAttributesTechnique.md')
    $protected = $Document -cin $protectedPaths -or $Document.StartsWith('Tools/AIAgentInstructionTemplates/', [System.StringComparison]::Ordinal)
    if ($Sections -and $protected) { throw 'Bootstrap files and exact installer payloads do not support partial reading.' }
    $idToHeading = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([System.StringComparer]::Ordinal)
    $headingToId = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([System.StringComparer]::Ordinal)
    $conditions = @{}
    foreach ($record in $SectionRecords) {
        if ($record.document -ceq $Document) {
            $idToHeading.Add($record.id, $record.heading)
            $headingToId.Add($record.heading, $record.id)
            $conditions[$record.id] = $record.whenRequired
        }
    }
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
                required = -not $optional; selected = $include; characters = $length;
                whenRequired = if ($optional) { $conditions[$id] } else { 'Always in the selected audience mode.' } })
        }
        if ($include) { [void]$output.Append($Content.Substring($part.Start, $length)) }
        elseif ($part.Visible) { $skipped++ }
    }
    [pscustomobject]@{ Content = $output.ToString(); Headings = $index.ToArray(); SkippedSections = $skipped }
}

Export-ModuleMember -Function ConvertTo-GeurtsAudienceText, Read-GeurtsAudienceDocument, Read-GeurtsDocumentationRegistry
