<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Technique Package Manifest

**Version:** 0.56.0
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative package manifest
**Required package path:** `GeurtsTechniqueManifest.md`

## 1. Manifest Resolver

This manifest is the single resolver for package-file selection, versions, subject ownership, applicability, post-entry reading order and cross-document conflicts. Use one active package's single validated commit; never mix files from other checkouts or versions. The contract resolves authoritative main's exact commit archive; a version alone does not select Git state.

Use this normative file read sequence; omit unselected subjects:

1. Read `AI_READ_FIRST.md` first.
2. Read this manifest in full.
3. Read the selected Commandments Companion Technique and its Contract for the God-owned service/transition.
4. Read frozen Game Forge Intelligence compatibility only for the historical/migration task selected below; it never owns current checking, setup or Update.
5. Read selected generic subject techniques in this order: Technical; Unity; Steam Integration; Code; Authoring; Bootstrap; Audio; GameAI; Commands; Multiplayer; Naming; Brick Contract and then its Catalogue; Forge Setup Technique and its Contract; BigBang installation and BigCrunch removal; Editor UI Theme; Editor Appearance; Diagnostics; Game Forge Automation; Folder Structure and then its Definition; AI Agent Setup; AGENTS.md Technique; Game Design Documentation; Git Ignore; Git Attributes; chat-only Response Control.
6. Read selected project-specific game-design facts before player-facing implementation; the GDD manifest's declared primary document is the primary source of context about the game; technical design and implementation guidance still come from the selected Forge techniques.
7. Apply relevant product- or plugin-owned conditional policy last, subordinate within Forge subjects.

Use `<ProjectRoot>/GeurtsGameForgeCommandments/` for an installed copy. Normal AI/session initialization reads local content without remote checks. Native routes start at AI_READ_FIRST. Codex-guide installation is a separate explicitly selected action; content Update excludes it.

### 1.1 Audience tags and efficient reading

Select documents here first, then filter before loading them. Tags change reading scope, never authority or permissions. Always read entry and manifest fully.

| Tag | AI reading rule |
|---|---|
| `AI-READ` | Read only when selected, in either mode. |
| `HUMAN-ONLY` | Skip unless the current task requests that history, human content or a migration needing it. |
| `FORGE-DEVELOPMENT-ONLY` | Include only while developing/maintaining the affected Forge brick, API, tool, contract, documentation or automation. |

Use **GameUse** for making a game with existing bricks or installing/configuring them. Use **ForgeDevelopment** for developing Forge itself; mixed tasks include maintainer sections only for the affected component. Changelogs and historical release summaries are never mandatory routine reading in either mode. Current normative guidance targets the current published packages in the Catalogue. Current setup, checking, and Update belong exclusively to the God-owned Commandments service. Verify actual installed capabilities; this rule never installs, upgrades, downgrades or rewrites user content. Minimum API versions, fixed schema tokens and compatibility contracts remain binding, not old recommended targets.

The first nonblank standalone comment sets a file audience. A section overrides it until END; no nesting. Untagged text is AI-READ. Use these markers outside fenced code:

```markdown
<!-- GEURTS-AUDIENCE: AI-READ -->
<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->
Requested human/history content.
<!-- GEURTS-SECTION:END -->
```

Use the local read-only helper:

```powershell
& '<DocumentationRoot>/Tools/ReadGeurtsDocumentation.ps1' -Document 'GeurtsTechniques/GeurtsTechnicalTechnique.md' -Mode GameUse
& '<DocumentationRoot>/Tools/ReadGeurtsDocumentation.ps1' -Document 'GeurtsTechniques/GeurtsDiagnosticsTechnique.md' -Mode GameUse -Preview -OutputFormat Json
& '<DocumentationRoot>/Tools/ReadGeurtsDocumentation.ps1' -Document 'GeurtsTechniques/GeurtsDiagnosticsTechnique.md' -Mode GameUse -Sections 'commands'
```

Preview returns a level-two heading index and planned character counts without document content. It never counts as reading the rules. Sections uses only the controlled IDs below and always includes the preamble and every non-optional section. Use the reserved `core` ID for shared sections alone. With no Sections argument, existing whole-document behavior remains supported. Choose every conditional section relevant to the task; if uncertain, read the whole audience-filtered file. There is no output cap or silent truncation. Json counts characters, not tokens. IncludeHuman is only for explicitly needed human/history/migration content and does not enable Forge sections.

The reader stays inside manifest-listed Markdown in this package. It never discovers project/GDD files, writes, checks Git, uses the network or installs anything; God never executes copied scripts. Bootstrap files, exact installer techniques, templates, JSON and code are not eligible for partial selection; selected data/payloads remain intact. Without PowerShell, use the same marked audience boundaries and controlled sections. Malformed tags, fences or section maps fail closed. A new unlisted section is required by default. Keep dependency, version, consent, project/design ownership and failure rules shared. Audience-only annotations bump the package, not unchanged subject/payload versions. Validate with `Tools/ValidateGeurtsDocumentation.ps1 -RunAutomationTests`.

## 2. Subject Ownership and Applicability

| Subject | Manifest-selected owner | When selected |
|---|---|---|
| Technical implementation and technical trade-offs | `GeurtsTechniques/GeurtsTechnicalTechnique.md` | Before implementation or technical planning. Short shared core; sole package owner of the five technical priorities and multiplayer override. |
| First-party asset, scene object, prefab root and script names | `GeurtsTechniques/GeurtsNamingTechnique.md` | When creating, naming, renaming or reviewing first-party assets, GameObjects, prefab roots or script filenames/classes. Fixed contracts and IDs retain their owners. |
| Existing-brick reuse, module usability integration, Codex-compatible brick design, shared lifecycle/settings contracts and machine-readable catalogue | `GeurtsTechniques/GeurtsBrickContract.md` and `GeurtsTechniques/GeurtsBrickCatalogue.json` | Before planning/implementing Geurts Unity functionality, brick design/validation, or package installation/update. Inspect current Catalogue and installed capability. |
| Independent prerequisite preparation, initial God installation, verified handoff and explicit BigCrunch uninstall | `GeurtsTechniques/GeurtsBigBangTechnique.md` | Before implementing, maintaining, installing, removing or validating BigBang or BigCrunch. This narrow dependency exception does not own runtime bootstrap, scenes, content acquisition or ongoing package management. |
| Shared visual foundation for all existing and future Forge Editor UI | `GeurtsTechniques/GeurtsEditorUIThemeTechnique.md` | Before creating, changing, reviewing or validating Forge-owned Editor UI. Runtime and player-facing game UI are excluded. |
| Forge-owned Editor workflow presentation, tabs, collapsible sections, callouts and inline authoring validation | `GeurtsTechniques/GeurtsEditorAppearanceTechnique.md` | Before creating, changing, reviewing or validating Forge Editor UI, including standalone/God-embedded views. Excludes runtime and player-facing game UI. Apply Theme then Appearance; preserve BigBang equivalents. |
| Generic AI-assisted automation and project-aware operational behaviour | `GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md` | When an agent or automation plans, changes, validates, or reports project work. |
| Diagnostics logging, console classification, history, health/inspection, gameplay cheat-session hooks and Windows metrics | `GeurtsTechniques/GeurtsDiagnosticsTechnique.md` | When implementing, integrating, configuring or validating Diagnostics or the shared God logging/session contracts. |
| Folder meaning, placement, and ownership | `GeurtsTechniques/GeurtsFolderStructureTechnique.md` | When creating, moving, renaming, or placing any file, script, asset, scene, document, or folder, and when inspecting or validating project structure. |
| Initialization ownership, separate readiness, optional setup contributions and project tool safety | `GeurtsTechniques/GeurtsForgeSetupTechnique.md` | When planning, implementing, installing or validating BigBang, Build Forge, Angels, console implantation or shared setup APIs. |
| Exact setup compatibility, owners, statuses and API version | `GeurtsTechniques/GeurtsForgeSetupContract.json` | Whenever Forge Setup Technique is selected or its API/schema is implemented or validated. |
| Exact folder-creation registry | `GeurtsTechniques/GeurtsFolderStructureDefinition.json` | When a tool creates or validates managed folders. |
| Native AI routes, companion whole-file replacement boundary, managed regions, and optional manual setup tooling | `GeurtsTechniques/GeurtsAIAgentSetupTechnique.md` | When creating, replacing, migrating, validating, or explaining native AI route files or GDD scaffolds. |
| Project-specific design-document discovery and maintenance boundary | `GeurtsTechniques/GeurtsGameDesignDocumentationTechnique.md` | Before player-facing work, when design facts are needed, or when GDD import, primary-document routing, discovery or manifest maintenance is requested. The primary document and relevant project GDD files selected by `Docs/GameDesign/GameDesignManifest.md` are mandatory game context and design facts. |
| God-owned Windows Unity Editor Commandments source, metadata check, confirmed replacement, project-boundary, and AI-routing lifecycle | `GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md` | For the God-owned content service, explicit checking/Update, candidate validation, consent, status, integrations or passive-adapter transition. |
| Exact companion source, documentation destination, validation entries, confirmation targets, and template-to-route mappings | `GeurtsTechniques/GeurtsCommandmentsCompanionContract.json` | Whenever the Commandments Companion Technique is selected or its schema is implemented or validated. |
| Frozen Game Forge Intelligence 2.0 integration compatibility | `GeurtsTechniques/GeurtsGameForgeIntelligenceTechnique.md` | Only for a requested historical review or existing-installation migration requiring released legacy compatibility. Not current package guidance; use IncludeHuman. |
| Approved project-root `.gitignore` payload | `GeurtsTechniques/GeurtsGitIgnoreTechnique.md` | When validating or provisioning that exact payload. |
| FMOD project-root `.gitattributes` template and explicit installation | `GeurtsTechniques/GeurtsGitAttributesTechnique.md` | When provisioning or validating FMOD line-ending rules through Angels or another explicitly authorized installer. The pinned template retains historical God step numbering; current ownership belongs to Forge Setup. |
| Codex guide template and user-selected installation | `GeurtsTechniques/GeurtsAgentTechnique.md` | When installing, validating or explaining a Codex guide. |
| Chat-only response style and scope | `GeurtsTechniques/GeurtsAIResponseControlTechnique_V1.1.md` | Only when a compatible chat interface explicitly selects it. It is never a coding or architecture standard. |
| Technical topic: Unity | `GeurtsTechniques/GeurtsUnityTechnique.md` | When changing or validating Unity code, dependencies, builds, APIs or Editor compatibility. Read migration material only for a requested migration. |
| Steam preparation, platform services and Windows release evidence | `GeurtsTechniques/GeurtsSteamIntegrationTechnique.md` | When planning, implementing, configuring or validating Steam preparation, Steamworks.NET dependencies, BigBang prerequisite admission, platform-service contracts, bootstrap/native lifecycle, or Steam Windows build/distribution artifacts. Read the whole selected technique in either audience mode. |
| Technical topic: Code | `GeurtsTechniques/GeurtsCodeTechnique.md` | Before creating or modifying C# code, IDs, XML descriptions or component Help. |
| Technical topic: Authoring | `GeurtsTechniques/GeurtsAuthoringTechnique.md` | For component/ScriptableObject authoring, Odin, UXML or new custom UI; Editor Theme/Appearance additionally apply to Forge Editor surfaces. |
| Technical topic: Bootstrap | `GeurtsTechniques/GeurtsBootstrapTechnique.md` | For project scene setup, persistent runtime objects, service placement or scene transitions. |
| Technical topic: Audio | `GeurtsTechniques/GeurtsAudioTechnique.md` | For sound design, playback, Audio or its explicitly opted-in FMOD integration. |
| Technical topic: GameAI | `GeurtsTechniques/GeurtsGameAITechnique.md` | For game-agent decision logic and authored AI configuration; not for Codex itself. |
| Technical topic: Commands | `GeurtsTechniques/GeurtsCommandsTechnique.md` | For optional runtime consoles, QC commands, help or command classification. |
| Technical topic: Multiplayer | `GeurtsTechniques/GeurtsMultiplayerTechnique.md` | For networking, replicated state or multiplayer implementation; retain the core network-efficiency override. |

### 2.1 Conflict resolution

- Apply the current user's explicit instruction in scope; it is task authority, not an alternate package resolver.
- Use the selected subject owner. Surface and ask about an unresolved material conflict instead of inventing precedence.
- Use GDD authority/precedence for design facts; ask before establishing missing or conflicting design intent. Reversible technical assumptions must not create design facts.
- Preserve user-authored instructions at every unlisted path. The content Update exception replaces only its three exact routes after their cancel-default confirmation; the separate guide installer replaces only the explicitly chosen guide. Surface any conflict outside that authority.
- Product/plugin policy cannot replace a selected Forge owner. Technical trade-offs use the Technical core's priorities without copying another list.

## 3. Package File Registry

Every listed path must exist, with exactly one matching package file. Roles describe membership, not additional mandatory reading or lifecycle authority. README, Ideas and historical/migration content stay outside routine reads. Files under `History/` are non-normative archives selected only for requested history or a migration needing their evidence.

<!-- GEURTS-PACKAGE-FILES:BEGIN -->

| Path | Version | Role |
|---|---:|---|
| `.gitattributes` | 1.0.0 | CRLF working-tree policy for authored text in the Windows documentation source checkout. |
| `AI_READ_FIRST.md` | 0.56.0 | Entry and session boundaries. |
| `GeurtsTechniqueManifest.md` | 0.56.0 | Selection, versions, ownership and reading scope. |
| `README.md` | 0.56.0 | Human overview and changelog; not mandatory reading. |
| `GeurtsTechniques/GeurtsTechnicalTechnique.md` | 0.20.2 | Normative shared technical core and priorities. |
| `GeurtsTechniques/GeurtsSteamIntegrationTechnique.md` | 0.2.0 | Windows x64 Steam preparation, independent prerequisites, optional provider and separate native/release evidence. |
| `GeurtsTechniques/GeurtsNamingTechnique.md` | 0.1.1 | Asset/object names, type registries, script exemptions and preservation. |
| `GeurtsTechniques/GeurtsBrickContract.md` | 1.21.1 | Brick reuse, dependencies, lifecycle, settings and package operations. |
| `GeurtsTechniques/GeurtsForgeSetupTechnique.md` | 1.6.0 | God foundation, optional owner contributions and setup safety. |
| `GeurtsTechniques/GeurtsForgeSetupContract.json` | 0.56.0 | Schema 1.0.0; setup Editor API 1.1 and contribution version 1. |
| `GeurtsTechniques/GeurtsBigBangTechnique.md` | 1.6.0 | Independent initial installer, verified God handoff and confirmed whole-Forge BigCrunch removal. |
| `GeurtsTechniques/GeurtsEditorUIThemeTechnique.md` | 1.5.4 | Shared palette, spacious geometry, accessibility and truthful status. |
| `GeurtsTechniques/GeurtsEditorAppearanceTechnique.md` | 0.1.6 | Editor workflows, Help, tabs, sections, callouts and inline findings. |
| `GeurtsTechniques/GeurtsDiagnosticsTechnique.md` | 0.4.1 | Optional capture, commands, history, health, sessions and metrics. |
| `GeurtsTechniques/GeurtsBrickCatalogue.json` | 0.56.0 | Current published packages and immutable Git targets. |
| `GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md` | 0.11.0 | Project operations, validation, delivery and computer-control boundaries. |
| `GeurtsTechniques/GeurtsFolderStructureTechnique.md` | 0.16.4 | Normative folder meanings, placement, reuse and safe extension. |
| `GeurtsTechniques/GeurtsFolderStructureDefinition.json` | 0.56.0 | Exact folder registry and creation profiles. |
| `GeurtsTechniques/GeurtsAIAgentSetupTechnique.md` | 3.1.2 | Exact routes, consent boundaries and separately invoked manual manager. |
| `GeurtsTechniques/GeurtsGameDesignDocumentationTechnique.md` | 0.16.1 | Normative primary game context, discovery and preserved imports. |
| `GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md` | 3.2.2 | Normative God-owned content service and passive-adapter transition. |
| `GeurtsTechniques/GeurtsCommandmentsCompanionContract.json` | 0.56.0 | Schema 3.0.0; exact acquisition, consent and route mappings. |
| `GeurtsTechniques/GeurtsGameForgeIntelligenceTechnique.md` | 2.0.0 | Historical frozen compatibility guide; no current updater authority. |
| `GeurtsTechniques/GeurtsGameForgeIntelligenceIntegrationContract.md` | 2.0.0 | Historical non-normative compatibility redirect; never selected as an authority. |
| `GeurtsTechniques/GeurtsAgentTechnique.md` | 1.3.0 | Portable preserving root guide plus pinned legacy selected-folder payload. |
| `GeurtsTechniques/GeurtsGitIgnoreTechnique.md` | 1.0.1 | Pinned comprehensive .gitignore payload, including optional FMOD patterns. |
| `GeurtsTechniques/GeurtsGitAttributesTechnique.md` | 1.0.1 | Pinned FMOD attributes payload and explicit installation. |
| `GeurtsTechniques/GeurtsAIResponseControlTechnique_V1.1.md` | 1.1 | Chat-only; not an implementation standard. |
| `Ideas/GameForgeIntelligenceIdeas.md` | 0.11.0 | Historical ideas; not normative. |
| `Migrations/v0.44.0.md` | 0.44.0 | Historical transition; read only for a requested migration/review. |
| `Migrations/v0.41.0.md` | 0.41.0 | Historical transition; read only for a requested migration/review. |
| `Migrations/v0.11.0.md` | 0.11.0 | Historical transition; read only for a requested migration/review. |
| `Migrations/v0.10.0.md` | 0.10.0 | Historical transition; read only for a requested migration/review. |
| `Migrations/v0.9.0.md` | 0.9.0 | Historical transition; read only for a requested migration/review. |
| `Migrations/v0.8.0.md` | 0.8.0 | Historical transition; read only for a requested migration/review. |
| `Migrations/v0.7.0.md` | 0.7.0 | Historical transition; read only for a requested migration/review. |
| `Tools/CreateAIAgentInstructionFiles.bat` | 0.9.0 | Compatibility launcher for managed AI setup. |
| `Tools/ManageGeurtsAgentInstructions.ps1` | 0.56.0 | Optional preservation-based native-route manager. |
| `Tools/CreateGeurtsFolderStructure.bat` | 0.9.0 | Compatibility launcher for definition-driven folder creation. |
| `Tools/CreateGeurtsFolderStructure.ps1` | 0.56.0 | Explicit create-only folder operation. |
| `Tools/UpdateGameDesignManifest.ps1` | 0.10.0 | Deterministic GDD manifest maintainer. |
| `Tools/NativeEntryMigrationCatalog.json` | 2.0.0 | Exact legacy route fingerprints, including v1.2.0. |
| `Tools/ValidateGeurtsDocumentation.ps1` | 0.56.0 | Package and semantic validation. |
| `Tools/ValidateGeurtsBrickSources.ps1` | 1.0.0 | Publication-only exact Git package/capability and dependency validation. |
| `Tools/Tests/TestGeurtsBrickSources.ps1` | 1.0.0 | Isolated dependency and pinned-source regressions. |
| `Tools/AIAgentInstructionTemplates/copilot-instructions.md` | 1.3.0 | Exact installation payload; preserve bytes. |
| `Tools/AIAgentInstructionTemplates/instructions/geurts-unity.instructions.md` | 1.3.0 | Exact installation payload; preserve bytes. |
| `Tools/AIAgentInstructionTemplates/instructions/geurts-game-design.instructions.md` | 1.3.0 | Exact installation payload; preserve bytes. |
| `Tools/AIAgentInstructionTemplates/GameDesign/README.md` | 0.11.0 | Exact installation payload; preserve bytes. |
| `Tools/AIAgentInstructionTemplates/GameDesign/GameDesignManifest.md` | 0.7.0 | Exact installation payload; preserve bytes. |
| `Tools/Tests/RunAutomationTests.ps1` | 0.56.0 | Isolated automation and regression suite. |
| `Tools/GeurtsDocumentationAudience.psm1` | 1.1.1 | Safe audience and manifest-controlled section reader. |
| `Tools/ReadGeurtsDocumentation.ps1` | 1.1.1 | Read, preview or index selected Markdown without mutation. |
| `Tools/Tests/TestDocumentationAudiences.ps1` | 1.1.4 | Audience, section selection, preview and boundary regressions. |
| `Migrations/v0.40.0.md` | 0.40.0 | Historical transition; read only for a requested migration/review. |
| `Migrations/v0.45.0.md` | 0.45.0 | Historical transition; read only for a requested migration/review. |
| `GeurtsTechniques/GeurtsUnityTechnique.md` | 0.3.1 | Normative task-specific technical topic. |
| `GeurtsTechniques/GeurtsCodeTechnique.md` | 0.1.1 | Normative task-specific technical topic. |
| `GeurtsTechniques/GeurtsAuthoringTechnique.md` | 0.1.1 | Normative task-specific technical topic. |
| `GeurtsTechniques/GeurtsBootstrapTechnique.md` | 0.1.1 | Normative task-specific technical topic. |
| `GeurtsTechniques/GeurtsAudioTechnique.md` | 0.1.1 | Normative task-specific technical topic. |
| `GeurtsTechniques/GeurtsGameAITechnique.md` | 0.1.1 | Normative task-specific technical topic. |
| `GeurtsTechniques/GeurtsCommandsTechnique.md` | 0.1.1 | Normative task-specific technical topic. |
| `GeurtsTechniques/GeurtsMultiplayerTechnique.md` | 0.1.1 | Normative task-specific technical topic. |
| `Migrations/v0.46.0.md` | 0.46.0 | Historical transition; read only for a requested migration/review. |
| `Migrations/v0.47.0.md` | 0.47.0 | AI usability transition; full-copy manual update and explicit owner installation. |
| `History/BigBang.md` | 0.1.0 | Optional historical release and incident evidence; never current installer requirements. |
| `History/AISetup.md` | 0.1.0 | Optional historical Companion/schema transition background; not a setup authority. |
| `Migrations/v0.51.0.md` | 0.51.0 | Historical Steam policy delivery before brick enforcement. |
| `Migrations/v0.52.0.md` | 0.52.0 | Manual adoption of released Steam preparation; native and distribution acceptance remain separate. |

<!-- GEURTS-PACKAGE-FILES:END -->

### 3.1 Current versions and compatibility

Use the Catalogue as the single source for current published brick versions and immutable installation targets. Do not copy current-version lists into prose. Clearly label minimum/introduced API versions and historical evidence. Registry versions identify documentation files, not installed bricks.

Installer contracts in the registered AGENTS.md, Git Ignore and Git Attributes techniques are frozen: preserve their exact payload bytes and markers. Use this registry for document versions and the marked blocks for payload versions. Contract changes need a coordinated compatible installer release. Historical God step numbering does not move current optional-tool ownership from Angels. A user-selected project root remains an allowed guide destination.

## 4. Controlled section reading

Only the level-two sections listed below may be omitted from a selected document. Read each when its condition applies. All unmapped H1/H2 sections and the preamble are required in the chosen audience mode. Preserve source order. The reader rejects unknown/duplicate IDs, missing/duplicate headings and malformed maps. Section selection never changes a task's selected-document obligations.

An H1 or the next H2 ends a topic; H3–H6 belongs to its parent. ATX headings accept 0–3 leading spaces, tabs after the opening hashes and optional closing hashes; underline-style H1/H2 boundaries also apply. Use original source boundaries and line numbers, including audience-hidden headings, so filtering cannot swallow later shared rules. Fenced examples remain literal.

<!-- GEURTS-READ-SECTIONS:BEGIN -->
| Document | Section ID | Exact heading | When required |
|---|---|---|---|
| `GeurtsTechniques/GeurtsDiagnosticsTechnique.md` | `console` | Runtime console and filters | Console installation, controls, audience/filter integration or console changes. |
| `GeurtsTechniques/GeurtsDiagnosticsTechnique.md` | `selection` | Console text selection and clipboard | Console text selection, clipboard or renderer changes. |
| `GeurtsTechniques/GeurtsDiagnosticsTechnique.md` | `history` | Application-session history | Retained history, paging, replay or session-history integration. |
| `GeurtsTechniques/GeurtsDiagnosticsTechnique.md` | `commands` | Commands and extensibility | Declaring or invoking QC commands, help or execution policy. |
| `GeurtsTechniques/GeurtsDiagnosticsTechnique.md` | `inspection` | Health and live read-only inspection | Health/inspection providers or live diagnostics. |
| `GeurtsTechniques/GeurtsDiagnosticsTechnique.md` | `sessions` | Gameplay sessions, zones and saves | Cheats, gameplay sessions, zones, saves or authority hooks. |
| `GeurtsTechniques/GeurtsDiagnosticsTechnique.md` | `metrics` | Six independent overlay metrics | Configuring/implementing metrics or the overlay. |
| `GeurtsTechniques/GeurtsDiagnosticsTechnique.md` | `validation` | Validation and migration | Developing/testing Diagnostics; requested existing-installation migration. |
| `GeurtsTechniques/GeurtsFolderStructureTechnique.md` | `roots` | Non-Unity Root Folders | Placing content in Docs, Builds, Tools, SourceAssets or External. |
| `GeurtsTechniques/GeurtsFolderStructureTechnique.md` | `assets` | Assets Folder Rules | Placing first-party/vendor/addressable/generated assets or gizmos. |
| `GeurtsTechniques/GeurtsFolderStructureTechnique.md` | `definitions` | Folder Definitions | Placing non-code project assets or needing detailed type-folder meaning. |
| `GeurtsTechniques/GeurtsFolderStructureTechnique.md` | `scenes` | Required Scene Structure | Creating/validating scenes or scene folders. |
| `GeurtsTechniques/GeurtsFolderStructureTechnique.md` | `definition_contract` | Machine-Readable Definition Contract | Developing/validating a managed-folder consumer or definition. |
| `GeurtsTechniques/GeurtsFolderStructureTechnique.md` | `recommendations` | Recommendations | Selecting an expanded project profile. |
| `GeurtsTechniques/GeurtsFolderStructureTechnique.md` | `minimal` | Minimal Version | Selecting/validating a minimal project profile. |
| `GeurtsTechniques/GeurtsFolderStructureTechnique.md` | `expansion` | Expansion Rule | Adding project-specific organizational categories. |
| `GeurtsTechniques/GeurtsFolderStructureTechnique.md` | `validation` | Definition of Done | Maintaining/testing the reusable folder template. |
| `GeurtsTechniques/GeurtsNamingTechnique.md` | `types` | 5. Type Registry | Naming/reviewing assets or scene objects; ordinary script filenames use the shared Script Exemption. |
| `GeurtsTechniques/GeurtsNamingTechnique.md` | `variants` | 6. Related Content and Variants | Prefab roots, ScriptableObjects, related assets or description variants. |
| `GeurtsTechniques/GeurtsNamingTechnique.md` | `adoption` | 10. Commandments Integration and Adoption | Maintaining/adopting this naming policy or requested existing-content migration. |
<!-- GEURTS-READ-SECTIONS:END -->
