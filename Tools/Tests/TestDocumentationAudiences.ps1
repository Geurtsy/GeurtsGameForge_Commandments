# Version: 1.1.4
[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Split-Path -Parent (Split-Path -Parent $PSScriptRoot)),
    [ValidateSet('Text', 'Json')][string]$OutputFormat = 'Text'
)
$ErrorActionPreference = 'Stop'
$passed = 0
$failures = New-Object 'System.Collections.Generic.List[string]'
function Assert-Audience([bool]$Condition, [string]$Name) {
    if ($Condition) { $script:passed++ }
    else { $script:failures.Add($Name) }
}
function Assert-Rejected([scriptblock]$Action, [string]$Name) {
    $rejected = $false
    try { & $Action | Out-Null } catch { $rejected = $true }
    Assert-Audience $rejected $Name
}
$fixture = Join-Path ([System.IO.Path]::GetTempPath()) ('ggf-audience-tests-' + [Guid]::NewGuid().ToString('N'))
try {
    Import-Module (Join-Path $RepositoryRoot 'Tools/GeurtsDocumentationAudience.psm1') -Force
    $sample = @'
<!-- GEURTS-AUDIENCE: AI-READ -->
Shared opening.
<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->
Human walkthrough.
<!-- GEURTS-SECTION:END -->
<!-- GEURTS-SECTION:BEGIN FORGE-DEVELOPMENT-ONLY -->
Forge implementation.
<!-- GEURTS-SECTION:END -->
Shared ending.
'@
    $game = ConvertTo-GeurtsAudienceText -Text $sample
    $forge = ConvertTo-GeurtsAudienceText -Text $sample -Mode ForgeDevelopment
    $human = ConvertTo-GeurtsAudienceText -Text $sample -IncludeHuman
    $all = ConvertTo-GeurtsAudienceText -Text $sample -Mode ForgeDevelopment -IncludeHuman
    Assert-Audience ($game.Content.Contains('Shared opening.') -and $game.Content.Contains('Shared ending.') -and -not $game.Content.Contains('walkthrough') -and -not $game.Content.Contains('implementation')) 'GameUse keeps shared rules and excludes both conditional audiences'
    Assert-Audience ($forge.Content.Contains('Forge implementation.') -and -not $forge.Content.Contains('walkthrough')) 'ForgeDevelopment includes implementation and still excludes human content'
    Assert-Audience ($human.Content.Contains('Human walkthrough.') -and -not $human.Content.Contains('implementation')) 'IncludeHuman does not enable Forge development'
    Assert-Audience ($all.Content.Contains('Human walkthrough.') -and $all.Content.Contains('Forge implementation.')) 'Explicit human review during Forge work includes both conditional audiences'
    Assert-Audience ($game.SourceCharacters -eq $sample.Length -and $game.ReturnedCharacters -eq $game.Content.Length -and $game.SkippedLines -eq 2) 'Reported counts describe actual returned content'
    $humanDefault = $sample.Replace('GEURTS-AUDIENCE: AI-READ', 'GEURTS-AUDIENCE: HUMAN-ONLY')
    $override = ConvertTo-GeurtsAudienceText -Text $humanDefault -Mode ForgeDevelopment
    Assert-Audience ($override.Content.Trim() -ceq 'Forge implementation.') 'Explicit section audience overrides a human file default'
    $untagged = "# Older document`r`nKeep every rule.`r`n"
    Assert-Audience ((ConvertTo-GeurtsAudienceText -Text $untagged).Content -ceq $untagged) 'Untagged guidance and CRLF remain unchanged'
    Assert-Audience ((ConvertTo-GeurtsAudienceText -Text '').Content.Length -eq 0) 'Empty document remains empty'
    foreach ($fence in @('```', '~~~~')) {
        $literal = $fence + "markdown`n<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->`nLiteral template data.`n" + $fence + "`n"
        Assert-Audience ((ConvertTo-GeurtsAudienceText -Text $literal).Content -ceq $literal) "Literal audience markers inside $fence fences remain data"
    }
    $longFence = "````````markdown`n`````` `n<!-- GEURTS-AUDIENCE: INVALID -->`n````````"
    Assert-Audience ((ConvertTo-GeurtsAudienceText -Text $longFence).Content -ceq $longFence) 'Shorter fence cannot close a longer literal block'
    foreach ($invalid in @(
        '<!-- GEURTS-AUDIENCE: UNKNOWN -->',
        '<!-- GEURTS-AUDIENCE: ai-read -->',
        '<!-- GEURTS-SECTION:BEGIN UNKNOWN -->',
        '<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->',
        '<!-- GEURTS-SECTION:END -->',
        "<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->`n<!-- GEURTS-SECTION:BEGIN AI-READ -->",
        "<!-- GEURTS-AUDIENCE: AI-READ -->`n<!-- GEURTS-AUDIENCE: AI-READ -->",
        "# Too late`n<!-- GEURTS-AUDIENCE: HUMAN-ONLY -->",
        "<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->`n<!-- GEURTS-SECTION:END-->",
        '```markdown'
    )) {
        Assert-Rejected { ConvertTo-GeurtsAudienceText -Text $invalid } "Malformed tag/fence fails closed: $invalid"
    }

    foreach ($bootstrap in @('AI_READ_FIRST.md', 'GeurtsTechniqueManifest.md')) {
        $raw = [System.IO.File]::ReadAllText((Join-Path $RepositoryRoot $bootstrap))
        foreach ($mode in @('GameUse', 'ForgeDevelopment')) {
            $read = Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document $bootstrap -Mode $mode
            Assert-Audience ($read.SkippedLines -eq 0 -and $read.Content.Contains('GeurtsTechniqueManifest.md')) "$bootstrap remains completely AI-readable in $mode"
        }
    }
    $namingRaw = [System.IO.File]::ReadAllText((Join-Path $RepositoryRoot 'GeurtsTechniques/GeurtsNamingTechnique.md'))
    $namingExpectedContent = [regex]::Replace($namingRaw, '\A<!-- GEURTS-AUDIENCE: AI-READ -->\r?\n', '')
    foreach ($mode in @('GameUse', 'ForgeDevelopment')) {
        $naming = Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document 'GeurtsTechniques/GeurtsNamingTechnique.md' -Mode $mode
        Assert-Audience ($naming.Content -ceq $namingExpectedContent -and $naming.SkippedLines -eq 0 -and $naming.Content.Contains('### 5.1 Scene Objects') -and $naming.Content.Contains('### 5.2 Project Assets') -and $naming.Content.Contains('## 7. Script Exemption')) "Naming is manifest-readable with every registry and exception in $mode"
    }
    $appearanceRaw = [IO.File]::ReadAllText((Join-Path $RepositoryRoot 'GeurtsTechniques/GeurtsEditorAppearanceTechnique.md'))
    $appearanceExpected = [regex]::Replace($appearanceRaw, '\A<!-- GEURTS-AUDIENCE: AI-READ -->\r?\n', '')
    foreach ($mode in @('GameUse', 'ForgeDevelopment')) {
        $appearance = Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document 'GeurtsTechniques/GeurtsEditorAppearanceTechnique.md' -Mode $mode
        Assert-Audience ($appearance.Content -ceq $appearanceExpected -and $appearance.SkippedLines -eq 0 -and
            $appearance.Content.Contains('## 6. Labelled, collapsible content sections') -and
            $appearance.Content.Contains('## 8. Inline authoring findings and logging boundary') -and
            $appearance.Content.Contains('must not introduce God or vendor dependencies into BigBang')) "Appearance policy, findings and prerequisite exceptions remain completely readable in $mode"
    }
    $technical = Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document 'GeurtsTechniques/GeurtsTechnicalTechnique.md'
    foreach ($mode in @('GameUse', 'ForgeDevelopment')) {
        $steam = Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document 'GeurtsTechniques/GeurtsSteamIntegrationTechnique.md' -Mode $mode
        Assert-Audience ($steam.SkippedLines -eq 0 -and $steam.Content.Contains('## BigBang admission and compile independence') -and $steam.Content.Contains('## Evidence and acceptance') -and $steam.Content.Contains('Native Steam integration and overlay remain unverified')) "Steam prerequisite and acceptance boundaries stay visible in $mode"
    }
    $technicalForge = Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document 'GeurtsTechniques/GeurtsTechnicalTechnique.md' -Mode ForgeDevelopment
    Assert-Audience (-not $technical.Content.Contains('## Reusable Framework Compliance Header') -and $technicalForge.Content.Contains('## Reusable Framework Compliance Header') -and $technical.Content.Contains('## Technical Priority Order') -and $technical.Content.Contains('all first-party code Codex creates or materially updates') -and $technical.Content.Contains('ordinary project-specific/game code')) 'Framework header is conditional; shared technical priorities and obligations survive'
    $brick = Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document 'GeurtsTechniques/GeurtsBrickContract.md'
    Assert-Audience ($brick.Content.Contains('## Use existing bricks') -and $brick.Content.Contains('Odin Inspector and Quantum Console') -and $brick.Content.Contains('Only after remote verification') -and $brick.Content.Contains('Never overwrite a brick source folder or offer a downgrade') -and $brick.Content.Contains('Install is explicit.') -and $brick.Content.Contains('Only `released: true` entries') -and -not $brick.Content.Contains('Implement `IBrick`')) 'Game consumers retain reuse, tools, release sources, Git delivery and downgrade guidance'
    $readmeGame = Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document 'README.md'
    $readmeForge = Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document 'README.md' -Mode ForgeDevelopment
    Assert-Audience ($readmeGame.Content.Trim().Length -eq 0 -and $readmeForge.Content.Contains('## Maintenance') -and -not $readmeForge.Content.Contains('## Changelog')) 'README walkthroughs/history skip by default; source maintenance is Forge-only'
    foreach ($payload in @('GeurtsTechniques/GeurtsAgentTechnique.md', 'GeurtsTechniques/GeurtsGitIgnoreTechnique.md')) {
        $raw = [System.IO.File]::ReadAllText((Join-Path $RepositoryRoot $payload))
        $expected = [regex]::Replace($raw, '\A<!-- GEURTS-AUDIENCE: AI-READ -->\r?\n', '')
        Assert-Audience ((Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document $payload).Content -ceq $expected) "$payload preserves its full literal installer payload"
    }

    # Independent fixture proves the reader cannot select project/GDD files or
    # follow a registered junction out of its documentation root.
    [void][System.IO.Directory]::CreateDirectory($fixture)
    [System.IO.File]::WriteAllText((Join-Path $fixture 'GeurtsTechniqueManifest.md'), @'
<!-- GEURTS-PACKAGE-FILES:BEGIN -->
| `allowed.md` | 1.0.0 | Fixture |
| `linked/secret.md` | 1.0.0 | Fixture |
<!-- GEURTS-PACKAGE-FILES:END -->
'@)
    [System.IO.File]::WriteAllText((Join-Path $fixture 'allowed.md'), $sample)
    [System.IO.File]::WriteAllText((Join-Path $fixture 'unregistered.md'), 'Do not load this file.')
    $before = (Get-FileHash -LiteralPath (Join-Path $fixture 'allowed.md')).Hash
    Assert-Audience ((Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'allowed.md').Content -ceq $game.Content) 'Explicit registered file is read without a Git checkout'
    foreach ($path in @('../outside.md', 'Docs/GameDesign/../../allowed.md', 'unregistered.md', 'C:/outside.md', 'allowed.json')) {
        Assert-Rejected { Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document $path } "Reader rejects out-of-scope selection: $path"
    }
    [void][System.IO.Directory]::CreateDirectory((Join-Path $fixture 'outside'))
    [System.IO.File]::WriteAllText((Join-Path $fixture 'outside/secret.md'), 'Do not follow this link.')
    $link = New-Item -ItemType Junction -Path (Join-Path $fixture 'linked') -Target (Join-Path $fixture 'outside')
    try { Assert-Rejected { Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'linked/secret.md' } 'Reader refuses a registered path through a junction' }
    finally { [System.IO.Directory]::Delete($link.FullName) }
    Assert-Audience ((Get-FileHash -LiteralPath (Join-Path $fixture 'allowed.md')).Hash -ceq $before) 'Reads preserve source file bytes'

    # Controlled partial reading must keep all untabled safety rules and literal fences.
    $manifestPath = Join-Path $fixture 'GeurtsTechniqueManifest.md'
    $sectionMap = @'
<!-- GEURTS-READ-SECTIONS:BEGIN -->
| Document | Section ID | Exact heading | When required |
|---|---|---|---|
| `scoped.md` | `audio` | Audio topic | Audio work only. |
| `scoped.md` | `backend` | Maintainer backend | Provider implementation only. |
<!-- GEURTS-READ-SECTIONS:END -->
'@
    $scopedManifest = [IO.File]::ReadAllText($manifestPath).Replace('<!-- GEURTS-PACKAGE-FILES:END -->', "| ``scoped.md`` | 1.0.0 | Fixture |`r`n| ``AI_READ_FIRST.md`` | 1.0.0 | Entry fixture |`r`n<!-- GEURTS-PACKAGE-FILES:END -->") + "`r`n" + $sectionMap
    [IO.File]::WriteAllText($manifestPath, $scopedManifest)
    $scopedText = @'
<!-- GEURTS-AUDIENCE: AI-READ -->
# Fixture
Shared preamble.
## Consent boundary
Never overwrite unrelated user content.
## Audio topic
Optional audio details.
```markdown
## A literal heading is not a section
Literal payload stays complete.
```
<!-- GEURTS-SECTION:BEGIN FORGE-DEVELOPMENT-ONLY -->
## Maintainer backend
Implementation details.
<!-- GEURTS-SECTION:END -->
## New untabled safety rule
Always retain this newly introduced requirement.
'@
    $scopedPath = Join-Path $fixture 'scoped.md'
    [IO.File]::WriteAllText($scopedPath, $scopedText.Replace("`n", "`r`n"))
    [IO.File]::WriteAllText((Join-Path $fixture 'AI_READ_FIRST.md'), $sample)
    $scopedBefore = (Get-FileHash -LiteralPath $scopedPath).Hash
    $whole = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md'
    $core = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core
    $audio = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections audio
    $backend = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Mode ForgeDevelopment -Sections backend
    Assert-Audience ($whole.Content.Contains('Optional audio details.') -and $whole.Content.Contains('New untabled safety rule')) 'Existing whole-document calls retain every audience-readable section'
    Assert-Audience ($core.Content.Contains('Shared preamble.') -and $core.Content.Contains('Consent boundary') -and $core.Content.Contains('New untabled safety rule') -and -not $core.Content.Contains('Optional audio details.')) 'Shared-only reading cannot omit consent, preamble or new untabled rules'
    Assert-Audience ($audio.Content.Contains('Literal payload stays complete.') -and @($audio.Headings).Count -eq 3 -and $audio.Content.Contains('New untabled safety rule')) 'Selected topic preserves complete fenced payload and following shared rules'
    Assert-Audience ($backend.Content.Contains('Implementation details.') -and -not $backend.Content.Contains('Optional audio details.') -and $backend.Content.Contains('Consent boundary')) 'Forge section reads preserve shared boundaries without unrelated topics'
    Assert-Audience ($audio.ReturnedCharacters -eq $audio.Content.Length -and $core.SkippedSections -eq 1 -and $audio.FullAudienceCharacters -eq $whole.Content.Length) 'Partial-read character counts describe exact untruncated output'
    $preview = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections audio -Preview
    Assert-Audience ($preview.PreviewOnly -and $preview.Content.Length -eq 0 -and $preview.ReturnedCharacters -eq 0 -and $preview.ReadingCharacters -eq $audio.Content.Length -and @($preview.Headings).Count -eq 3) 'Preview exposes scope and size without returning document text or claiming a completed read'
    foreach ($ids in @(@('unknown'), @('audio','audio'), @('backend'))) {
        Assert-Rejected { Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections $ids } "Reject unknown, duplicate or audience-hidden selection: $($ids -join ',')"
    }
    Assert-Rejected { Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'AI_READ_FIRST.md' -Sections core } 'Bootstrap cannot be partially read'
    Assert-Rejected { Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document 'GeurtsTechniques/GeurtsGitIgnoreTechnique.md' -Sections core } 'Exact installer payload cannot be partially read'
    foreach ($brokenMap in @(
        $scopedManifest.Replace('| `scoped.md` | `audio` | Audio topic | Audio work only. |', '| `scoped.md` | `audio` | Missing heading | Audio work only. |'),
        $scopedManifest.Replace('<!-- GEURTS-READ-SECTIONS:END -->', ''),
        $scopedManifest.Replace('| `scoped.md` | `backend` | Maintainer backend | Provider implementation only. |', '| `scoped.md` | `audio` | Maintainer backend | Provider implementation only. |'),
        $scopedManifest.Replace('| `scoped.md` | `audio`', '| `unregistered.md` | `audio`'),
        $scopedManifest.Replace('| `scoped.md` | `audio`', '| `AI_READ_FIRST.md` | `audio`'),
        $scopedManifest.Replace('| `scoped.md` | `audio`', '| `scoped.md` | `core`')
    )) {
        [IO.File]::WriteAllText($manifestPath, $brokenMap)
        Assert-Rejected { Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections audio -Preview } 'Malformed map fails before any preview or partial content is returned'
    }
    [IO.File]::WriteAllText($manifestPath, $scopedManifest)
    [IO.File]::WriteAllText($scopedPath, $scopedText + "`n<!-- GEURTS-SECTION:BEGIN UNKNOWN -->")
    Assert-Rejected { Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections audio } 'Malformed unselected audience section cannot be hidden by partial selection'
    [IO.File]::WriteAllText($scopedPath, $scopedText.Replace("`n", "`r`n"))
    Assert-Audience ((Get-FileHash -LiteralPath $scopedPath).Hash -ceq $scopedBefore) 'Reader selection and preview preserve original source bytes'
    $headingFixture = "# Fixture`r`n## Maintainer backend`r`nBackend details.`r`n## Audio topic`r`nOptional audio details.`r`n  ## New required rule`r`nMUST_KEEP_NEW_RULE`r`n"
    [IO.File]::WriteAllText($scopedPath, $headingFixture)
    $indentedCore = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core
    Assert-Audience ($indentedCore.Content.Contains('MUST_KEEP_NEW_RULE') -and -not $indentedCore.Content.Contains('Optional audio details.')) 'An indented new required heading ends an omitted topic'
    foreach ($eol in @("`r`n", "`n", "`r")) {
        foreach ($indent in @('', ' ', '  ', '   ')) {
            $variant = @('# Fixture', '## Maintainer backend', 'Backend details.',
                ($indent + "##`tAudio topic ####`t"), 'Optional audio details.',
                ($indent + "##`tNew required rule ###`t"), 'MUST_KEEP_NEW_RULE') -join $eol
            [IO.File]::WriteAllText($scopedPath, $variant)
            $variantCore = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core
            $variantAudio = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections audio
            $variantWhole = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md'
            Assert-Audience ($variantCore.Content.Contains('MUST_KEEP_NEW_RULE') -and -not $variantCore.Content.Contains('Optional audio details.')) "Core preserves required ATX rules with $($indent.Length) spaces and EOL length $($eol.Length)"
            Assert-Audience ($variantAudio.Content.Contains('Optional audio details.') -and $variantAudio.Content.Contains('MUST_KEEP_NEW_RULE') -and @($variantAudio.Headings | Where-Object { $_.id -ceq 'audio' }).Count -eq 1) "Tabs and closing hashes still resolve the selected topic with $($indent.Length) spaces"
            Assert-Audience ($variantWhole.Content -ceq $variant) 'Whole-document reads preserve every original character across heading variants'
        }
    }
    $topicPrefix = "# Fixture`r`n## Maintainer backend`r`nBackend details.`r`n## Audio topic`r`nOptional audio details.`r`n"
    foreach ($indent in @('', ' ', '  ', '   ')) {
        [IO.File]::WriteAllText($scopedPath, $topicPrefix + $indent + "#`tAudio topic ###`r`nMUST_KEEP_NEW_RULE`r`n")
        $h1Core = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core
        Assert-Audience ($h1Core.Content.Contains('MUST_KEEP_NEW_RULE') -and -not $h1Core.Content.Contains('Optional audio details.') -and @($h1Core.Headings | Where-Object { $_.id -ceq 'audio' }).Count -eq 1) 'A required H1 ends the topic even when its name matches a controlled H2'
    }
    foreach ($emptyHeading in @('##', " ## ###`t")) {
        [IO.File]::WriteAllText($scopedPath, $topicPrefix + $emptyHeading + "`r`nMUST_KEEP_NEW_RULE`r`n")
        Assert-Audience ((Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core).Content.Contains('MUST_KEEP_NEW_RULE')) 'An empty H2 is a required boundary'
    }
    foreach ($underline in @('===', '---')) {
        $requiredSetext = "  New required`r`n  multiline rule`r`n  $underline`r`nMUST_KEEP_NEW_RULE`r`n"
        [IO.File]::WriteAllText($scopedPath, $topicPrefix + "`r`n" + $requiredSetext)
        $setextCore = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core
        Assert-Audience ($setextCore.Content.Contains($requiredSetext) -and -not $setextCore.Content.Contains('Optional audio details.')) 'Required underline headings preserve their full text and following rules'
    }
    $controlledSetext = "# Fixture`r`n## Maintainer backend`r`nBackend details.`r`n`r`n  Audio topic`r`n  ---`r`nOptional audio details.`r`n## Shared rule`r`nMUST_KEEP_NEW_RULE`r`n"
    [IO.File]::WriteAllText($scopedPath, $controlledSetext)
    $setextAudio = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections audio
    $setextCore = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core
    Assert-Audience ($setextAudio.Content.Contains('Optional audio details.') -and $setextCore.Content.Contains('MUST_KEEP_NEW_RULE') -and -not $setextCore.Content.Contains('Optional audio details.')) 'A controlled single-line underline H2 resolves by its exact heading text'
    foreach ($level in 3..6) {
        $childText = (('#' * $level) + " Child detail`r`nOPTIONAL_CHILD_RULE`r`n")
        [IO.File]::WriteAllText($scopedPath, $topicPrefix + $childText + "## Shared rule`r`nMUST_KEEP_NEW_RULE`r`n")
        $childCore = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core
        $childAudio = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections audio
        Assert-Audience (-not $childCore.Content.Contains('OPTIONAL_CHILD_RULE') -and $childAudio.Content.Contains($childText) -and $childCore.Content.Contains('MUST_KEEP_NEW_RULE')) "H$level remains inside its optional parent"
    }
    $literalText = "`r`n    ## Indented code`r`n`t# Tab-indented code`r`n\## Escaped hash`r`n##Not a heading`r`n####### Too many hashes`r`nOPTIONAL_LITERAL_RULE`r`n"
    [IO.File]::WriteAllText($scopedPath, $topicPrefix + $literalText + "## Shared rule`r`nMUST_KEEP_NEW_RULE`r`n")
    $literalCore = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core
    $literalAudio = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections audio
    Assert-Audience (-not $literalCore.Content.Contains('OPTIONAL_LITERAL_RULE') -and $literalAudio.Content.Contains($literalText)) 'Indented code, escaped hashes and non-heading hash text cannot become section boundaries'
    foreach ($fence in @('````', '~~~~')) {
        $fencedText = $fence + "markdown`r`n  # Literal title`r`n   ## New required rule ###`r`nLiteral underline`r`n---`r`nOPTIONAL_FENCED_RULE`r`n" + $fence + "`r`n"
        [IO.File]::WriteAllText($scopedPath, $topicPrefix + $fencedText + "## Shared rule`r`nMUST_KEEP_NEW_RULE`r`n")
        $fencedCore = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core
        $fencedAudio = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections audio
        Assert-Audience (-not $fencedCore.Content.Contains('OPTIONAL_FENCED_RULE') -and $fencedCore.Content.Contains('MUST_KEEP_NEW_RULE') -and $fencedAudio.Content.Contains($fencedText)) 'Fenced ATX and underline examples remain one complete literal payload'
    }
    $repeatLines = @('<!-- GEURTS-AUDIENCE: AI-READ -->', '# Fixture', '## Maintainer backend', 'Backend details.',
        '## Audio topic', 'Optional audio details.', '<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->',
        '## Repeated shared rule', 'Hidden walkthrough.', '<!-- GEURTS-SECTION:END -->',
        '## Repeated shared rule', 'FIRST_SHARED_RULE', '## Repeated shared rule', 'SECOND_SHARED_RULE')
    $repeatText = $repeatLines -join "`r`n"
    [IO.File]::WriteAllText($scopedPath, $repeatText)
    $repeatBefore = (Get-FileHash -LiteralPath $scopedPath).Hash
    $repeatCore = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core
    $repeatPreview = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core -Preview
    $repeated = @($repeatPreview.Headings | Where-Object { $_.heading -ceq 'Repeated shared rule' })
    Assert-Audience ($repeated.Count -eq 2 -and $repeated[0].sourceLine -eq 11 -and $repeated[1].sourceLine -eq 13 -and $repeated[0].required -and $repeated[1].required) 'Repeated visible headings report their own original lines after hidden same-name headings'
    Assert-Audience ($repeatCore.Content.Contains('FIRST_SHARED_RULE') -and $repeatCore.Content.Contains('SECOND_SHARED_RULE') -and -not $repeatCore.Content.Contains('Hidden walkthrough.')) 'Repeated required sections remain readable without exposing hidden audience content'
    Assert-Audience ($repeatPreview.Content.Length -eq 0 -and $repeatPreview.ReadingCharacters -eq $repeatCore.Content.Length -and (Get-FileHash -LiteralPath $scopedPath).Hash -ceq $repeatBefore) 'Heading preview reports exact planned size and preserves source bytes'
    foreach ($hiddenHeading in @('# Hidden title', '## Hidden shared rule')) {
        $hiddenBoundary = "<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->`r`n$hiddenHeading`r`nHidden walkthrough.`r`n<!-- GEURTS-SECTION:END -->`r`nMUST_KEEP_NEW_RULE`r`n"
        [IO.File]::WriteAllText($scopedPath, $topicPrefix + $hiddenBoundary)
        $hiddenCore = Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections core
        Assert-Audience ($hiddenCore.Content.Contains('MUST_KEEP_NEW_RULE') -and -not $hiddenCore.Content.Contains('Hidden walkthrough.') -and -not $hiddenCore.Content.Contains('Optional audio details.')) 'An audience-hidden required heading still ends the preceding optional topic'
    }
    foreach ($duplicateHeading in @("   ##`tAudio topic ###", "Audio topic`r`n---")) {
        [IO.File]::WriteAllText($scopedPath, $topicPrefix + "`r`n" + $duplicateHeading + "`r`nDuplicate controlled topic.`r`n")
        Assert-Rejected { Read-GeurtsAudienceDocument -RepositoryRoot $fixture -Document 'scoped.md' -Sections audio -Preview } 'Controlled heading duplicates fail across indentation, closing hashes and underline syntax'
    }
    [IO.File]::WriteAllText($scopedPath, $scopedText)
    $diagnosticsCore = Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document 'GeurtsTechniques/GeurtsDiagnosticsTechnique.md' -Sections core
    Assert-Audience ($diagnosticsCore.Content.Contains('ordinary Forge logs') -or $diagnosticsCore.Content.Contains('Ordinary Forge logs')) 'Real logging-only read retains unavailable-provider policy'
    Assert-Audience ($diagnosticsCore.Content.Contains('FORGE_AUDIENCE.PLAYER') -and $diagnosticsCore.Content.Contains('never evidence of success') -and -not $diagnosticsCore.Content.Contains('Background transparency')) 'Real Diagnostics core keeps audience/failure safeguards and skips overlay details'
    foreach ($history in @('README.md', 'Migrations/v0.47.0.md', 'GeurtsTechniques/GeurtsGameForgeIntelligenceTechnique.md')) {
        Assert-Audience ((Read-GeurtsAudienceDocument -RepositoryRoot $RepositoryRoot -Document $history).Content.Trim().Length -eq 0) "Routine GameUse skips history: $history"
    }
    $jsonPreview = & (Join-Path $RepositoryRoot 'Tools/ReadGeurtsDocumentation.ps1') -RepositoryRoot $RepositoryRoot -Document 'GeurtsTechniques/GeurtsDiagnosticsTechnique.md' -Sections core -Preview -OutputFormat Json | ConvertFrom-Json
    Assert-Audience ($null -eq $jsonPreview.PSObject.Properties['content'] -and $jsonPreview.previewOnly -and $jsonPreview.readingCharacters -eq $diagnosticsCore.Content.Length) 'CLI JSON preview contains metadata only with exact planned size'
}
catch { $failures.Add("Harness error at line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)") }
finally {
    $resolved = [System.IO.Path]::GetFullPath($fixture)
    $temporaryRoot = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath()).TrimEnd([char[]]'\/') + [System.IO.Path]::DirectorySeparatorChar
    if ($resolved.StartsWith($temporaryRoot, [System.StringComparison]::OrdinalIgnoreCase) -and (Split-Path -Leaf $resolved) -like 'ggf-audience-tests-*') {
        if (Test-Path -LiteralPath $resolved) { Remove-Item -LiteralPath $resolved -Recurse -Force }
    }
    else { $failures.Add('Refused unsafe fixture cleanup path.') }
}
$result = [pscustomobject]@{ passed = $passed; failed = $failures.Count; failures = $failures.ToArray() }
if ($OutputFormat -eq 'Json') { $result | ConvertTo-Json -Depth 3 }
else { $result | Format-List }
if ($failures.Count -gt 0) { exit 1 }
exit 0
