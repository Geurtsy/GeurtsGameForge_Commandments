<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Technique Package Manifest

**Version:** 0.67.2
**Unity minimum:** Unity 6.6 (6000.6.3f1) or newer
**Status:** Draft normative package manifest
**Publication policy:** Validated main is the content feed; immutable versioned releases. Draft describes specification maturity, not whether a Git release exists.
**Required package path:** `GeurtsTechniqueManifest.md`

## 1. Manifest Resolver

This manifest alone resolves package-file selection, versions, subject ownership, applicability, post-entry reading order and cross-document conflicts. Use one package's validated commit, including supporting data; never mix copies. The content contract selects authoritative main's exact commit archive, not a version string.

**Geurts Game Forge must follow every applicable rule in the full Commandments package**, including shared technical, code, naming, folder, authoring, UI, automation and validation requirements. Bricks, runtime, Editor tools, tests and automation share these rules; document names and ForgeDevelopment grant no exemption.

Use this normative file read sequence; omit unselected subjects:


1. Read `AI_READ_FIRST.md` first.
2. Read this manifest in full. For source-repository contributions, read `CONTRIBUTING.md` next.
3. Select the usage profile below; read the Standards-Only Technique first when StandardsOnly applies. Read the Documentation Maintenance Technique for every approved Game Forge change or documentation review. Then read the selected Commandments Companion Technique and its Contract for the God-owned service/transition.
4. Read frozen Game Forge Intelligence compatibility only for the historical/migration task selected below; it never owns current checking, setup or Update.
5. Read selected generic subject techniques in this order: Technical; Unity; Steam Integration; Code; Authoring; Bootstrap; Audio; GameAI; Commands; Multiplayer; Naming; Brick Contract and then its Catalogue; Forge Setup Technique and its Contract; BigBang installation and BigCrunch removal; Editor UI Theme; Editor Appearance; Diagnostics; Game Forge Automation; Folder Structure and then its Definition; AI Agent Setup; AGENTS.md Technique; Game Design Documentation; Git Ignore; Git Attributes; chat-only Response Control.
6. When Brick Contract/Catalogue apply, read the shared Brick AI Usage Guide and only its task-relevant brick sections, then the pinned owning guides. Read selected project-specific game-design facts before player-facing implementation; the GDD manifest's declared primary document is the primary source of context about the game; technical design and implementation guidance still come from the selected Forge techniques.
7. Apply relevant product- or plugin-owned conditional policy last, subordinate within Forge subjects.

Installed copies live at `<ProjectRoot>/GeurtsGameForgeCommandments/`; native routes start at AI_READ_FIRST. Session initialization stays local/offline. Installed updates require the Brick/Companion owners' current explicit Update action and confirmation, never saved automatic consent. Read-only checks and authorized source-publication queues remain separate. See Migrations/v0.64.0.md only for implementation adoption. Codex-guide installation is separate and excluded from content Update.

### 1.1 Audience tags and efficient reading

Documentation is exclusively for AI agents. Documentation Maintenance owns efficiency first, exact constraints and ownership; Forge integration is primary and standalone use secondary/explicit. Technical owns runtime priorities. Select subjects before filtering; read entry and manifest fully. Tags change reading scope, never authority or permissions.

| Tag | AI reading rule |
|---|---|
| `AI-READ` | Read when selected, in either mode. Untagged text defaults here. |
| `HUMAN-ONLY` | Legacy optional history/reference; include only when explicitly needed. |
| `FORGE-DEVELOPMENT-ONLY` | Include only for maintenance of the affected Forge component. |

Use GameUse for games using/installing/configuring bricks and ForgeDevelopment for Forge maintenance; mixed work includes maintainer material only for affected components. Changelogs and historical release summaries are never mandatory routine reading. Current setup, checking, and Update belong exclusively to the God-owned Commandments service. Current guidance targets published Catalogue packages, not assumed installed capabilities. Verify installed capabilities; reading grants no install/upgrade/downgrade/rewrite authority. Minimum APIs, fixed schemas and compatibility contracts remain binding.

The first nonblank standalone audience comment sets file scope; a section overrides until END, without nesting. Markers outside fences use:

```markdown
<!-- GEURTS-AUDIENCE: AI-READ -->
<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->
Explicitly requested history/reference.
<!-- GEURTS-SECTION:END -->
```

Use the local read-only helper with a manifest-selected relative Markdown path:

```powershell
(& '<DocumentationRoot>/Tools/ReadGeurtsDocumentation.ps1' -Document 'GeurtsTechniques/GeurtsDiagnosticsTechnique.md' -Mode GameUse -Preview -OutputFormat Json | ConvertFrom-Json).documentMetadata | ConvertTo-Json -Depth 5
& '<DocumentationRoot>/Tools/ReadGeurtsDocumentation.ps1' -Document 'GeurtsTechniques/GeurtsDiagnosticsTechnique.md' -Mode GameUse -Sections 'commands'
```

Preview returns only document/version/role, conditional section IDs, exact headings, when-required conditions, source lines and planned character counts. It never counts as reading the rules. Select every applicable conditional section; `core` selects shared rules alone. Omit Sections for a full audience-filtered read; uncertainty requires that full read. There is no output cap or silent truncation. Counts are characters, not tokens. IncludeHuman includes explicitly needed history/reference/migration, never Forge sections.

The reader accesses only this package's registered Markdown and local supporting registry: no project/GDD discovery, writes, Git/network checks, installation or automatic repair. God never executes copied scripts. Entry files, exact installer techniques, templates, JSON and code cannot be partially selected; payloads remain intact. Malformed audience tags/fences/maps and missing, unsafe, malformed, duplicate, unsupported or mismatched registry data fail visibly. A new unlisted section is required by default. Dependency/version/consent/project-design ownership/failure rules stay shared. Audience-only annotations bump the package, not unchanged subject/payload versions. Validate using Tools/ValidateGeurtsDocumentation.ps1 -RunAutomationTests.

Without PowerShell: read entry/manifest fully, retrieve only selected documents' file/version and controlled-section records from the declared same-copy JSON, apply the same audience/source-boundary rules, then read every required section. Metadata is not a rule read. If applicability is uncertain, read the whole selected document. Do not load the full inventory routinely or fetch another copy to repair missing data.

### 1.2 Usage Profiles

Select before generic subjects, independently of audience mode:

| Usage profile | Select for | Boundary |
|---|---|---|
| **StandardsOnly** | Explicit standards without Forge packages. | Read Standards-Only first, then general subjects. Framework/catalogue/service/integration requirements apply only to explicit Forge adoption/maintenance. Steam, Odin Inspector and Quantum Console are optional unless explicitly selected. |
| **ForgeUse** | Games using/installing/configuring Forge packages. | All relevant shared/framework owners; GameUse. |
| **ForgeDevelopment** | Forge package/tool/contract/documentation maintenance. | All relevant shared/framework owners and affected maintainer sections; ForgeDevelopment. |

StandardsOnly uses GameUse, not a new Mode; its owner defines framework/dependency and standalone-folder exceptions. General standards stay binding. No profile grants install/removal, payload changes or broader service permissions. Explicit Forge integration in a standalone project selects framework owners only for that integration. Never infer profile changes from folder names or absent packages; ordinary package work retains the table below.

### 1.3 Primary game target

The Commandments primarily target **Steam games built with Unity for Windows x64 PCs**. Use this focus for game-platform guidance; it does not restrict conversation topics or remove explicitly selected StandardsOnly or user-approved project exceptions. Preserve the Unity minimum above and apply each selected owner's requirements.

The [Technical owner](GeurtsTechniques/GeurtsTechnicalTechnique.md#windows-development-and-build-workflow) owns host/build scope changes; the [Steam owner](GeurtsTechniques/GeurtsSteamIntegrationTechnique.md#runtime-ownership-and-native-activation) retains optional-service and default-off native activation boundaries. This focus grants no installation or migration authority. Project-specific game requirements remain with the [GDD owner](GeurtsTechniques/GeurtsGameDesignDocumentationTechnique.md#primary-game-context).

## 2. Subject Ownership and Applicability

| Subject | Manifest-selected owner | When selected |
|---|---|---|
| Documentation design and cross-repository maintenance | `GeurtsTechniques/GeurtsDocumentationMaintenanceTechnique.md` | For every approved Game Forge change and documentation review across all Game Forge repositories, including BigBang; before edits and again before delivery. |
| Per-brick AI usage and evidence routing | `GeurtsTechniques/GeurtsBrickUsageGuide.md` | With Brick Contract/Catalogue for brick selection, use, integration or maintenance; read shared guidance and only relevant brick sections. |
| Source-repository contributions and publication | `CONTRIBUTING.md` | Before changing or delivering this documentation source; retains each selected subject owner. |
| Standards-only adoption without Geurts Game Forge packages | `GeurtsTechniques/GeurtsStandardsOnlyTechnique.md` | Before selecting other subjects when the explicit StandardsOnly usage profile applies; owns framework and third-party dependency exceptions, not generic technical policy. |
| Technical implementation and technical trade-offs | `GeurtsTechniques/GeurtsTechnicalTechnique.md` | Before implementation or technical planning. Short shared core; sole package owner of the six technical priorities and multiplayer override. |
| First-party asset, scene object, prefab root and script names | `GeurtsTechniques/GeurtsNamingTechnique.md` | When creating, naming, renaming or reviewing first-party assets, GameObjects, prefab roots or script filenames/classes. Fixed contracts and IDs retain their owners. |
| Existing-brick reuse, module usability integration, Codex-compatible brick design, shared lifecycle/settings contracts and machine-readable catalogue | `GeurtsTechniques/GeurtsBrickContract.md` and `GeurtsTechniques/GeurtsBrickCatalogue.json` | Before planning/implementing Geurts Unity functionality, brick design/validation, or package installation/update. Inspect current Catalogue and installed capability. |
| Independent prerequisite preparation, initial God installation, verified handoff and explicit BigCrunch uninstall | `GeurtsTechniques/GeurtsBigBangTechnique.md` | Before implementing, maintaining, installing, removing or validating BigBang or BigCrunch. This narrow dependency exception does not own runtime bootstrap, scenes, content acquisition or ongoing package management. |
| Shared visual foundation for all existing and future Forge Editor UI | `GeurtsTechniques/GeurtsEditorUIThemeTechnique.md` | Before creating, changing, reviewing or validating Forge-owned Editor UI. Runtime and player-facing game UI are excluded. |
| Forge-owned Editor workflow presentation, tabs, collapsible sections, callouts and inline authoring validation | `GeurtsTechniques/GeurtsEditorAppearanceTechnique.md` | Before creating, changing, reviewing or validating Forge Editor UI, including standalone/God-embedded views. Excludes runtime and player-facing game UI. Apply Theme then Appearance; preserve BigBang equivalents. |
| Git-only source control and AI-assisted automation | `GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md` | Before choosing, configuring or using source control, or when an agent plans, changes, validates or reports project work; owns Git-only source control, the generic zero-warning main gate, proportionate testing, unit-test necessity and efficient AI tool use. |
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
| Chat-only response style and scope | `GeurtsTechniques/GeurtsAIResponseControlTechnique_V1.2.0.md` | Only when a compatible chat interface explicitly selects it. It is never a coding or architecture standard. |
| Technical topic: Unity | `GeurtsTechniques/GeurtsUnityTechnique.md` | When planning, changing or validating Unity code, physics, scheduling, dependencies, builds, APIs or Editor compatibility; owns collider movement, triggers, coroutines and Unity-specific compilation; Automation owns the generic compilation gate. Read migration material only for a requested migration. |
| Steam preparation, platform services and Windows release evidence | `GeurtsTechniques/GeurtsSteamIntegrationTechnique.md` | When planning, implementing, configuring or validating Steam preparation, Steamworks.NET dependencies, BigBang prerequisite admission, platform-service contracts, bootstrap/native lifecycle, or Steam Windows build/distribution artifacts. Read the whole selected technique in either audience mode. |
| Technical topic: Code | `GeurtsTechniques/GeurtsCodeTechnique.md` | Before planning, creating or modifying C# code, ScriptableObject data models, object references, IDs, XML descriptions or component Help; owns reference-first design and identity-boundary exceptions. |
| Technical topic: Authoring | `GeurtsTechniques/GeurtsAuthoringTechnique.md` | For component/ScriptableObject authoring, Odin, UXML or new custom UI; Editor Theme/Appearance additionally apply to Forge Editor surfaces. |
| Technical topic: Bootstrap | `GeurtsTechniques/GeurtsBootstrapTechnique.md` | For project scene setup, persistent runtime objects, service placement or scene transitions. |
| Technical topic: Audio | `GeurtsTechniques/GeurtsAudioTechnique.md` | For sound design, playback, Audio or its explicitly opted-in FMOD integration. |
| Technical topic: GameAI | `GeurtsTechniques/GeurtsGameAITechnique.md` | For game-agent decision logic and authored AI configuration; not for Codex itself. |
| Technical topic: Commands | `GeurtsTechniques/GeurtsCommandsTechnique.md` | For optional runtime consoles, QC commands, help or command classification. |
| Technical topic: Multiplayer | `GeurtsTechniques/GeurtsMultiplayerTechnique.md` | For Multiplayer brick/kit selection, networking, replicated state or multiplayer implementation; selects FishNet, required built-in FishySteamworks/Steamworks.NET support and Client-Host while retaining the core latency-first, bandwidth-second override. Select Steam Integration too for prerequisites, native ownership and evidence. |

### 2.1 Conflict resolution

- Apply the current user's explicit instruction in scope; it is task authority, not an alternate package resolver.
- Use the selected subject owner. Surface and ask about an unresolved material conflict instead of inventing precedence.
- Use GDD authority/precedence for design facts; ask before establishing missing or conflicting design intent. Reversible technical assumptions must not create design facts.
- Preserve user-authored instructions at every unlisted path. The content Update exception replaces only its three exact routes after their cancel-default confirmation; the separate guide installer replaces only the explicitly chosen guide. Surface any conflict outside that authority.
- Product/plugin policy cannot replace a selected Forge owner. Technical trade-offs use the Technical core's priorities without copying another list.

## 3. Package File Registry

<!-- GEURTS-REGISTRY: GeurtsTechniques/GeurtsDocumentationRegistry.json -->

This manifest owns the schema-1.0.0 supporting registry above: `packageVersion`, `files` (exact path/version/role) and `controlledSections` (document/ID/exact heading/whenRequired). It is data, not a second resolver or routing policy. Retrieve only relevant records, preferably through Preview; tools may parse it internally without dumping the inventory. Every registered file must exist and inventory must equal Git-tracked package membership exactly. Roles add no reading or lifecycle authority. README, Ideas, History and migrations are outside routine reading; history is non-normative and selected only for requested history/migration evidence. Do not retain a second Markdown inventory.

### 3.1 Current versions and compatibility

Use the Catalogue as the single source for current published brick versions and immutable install targets; avoid parallel lists. Label minimum/introduced APIs and historical evidence. Registry versions are document versions, never installed brick identities. Preserve frozen AGENTS.md, Git Ignore and Git Attributes payload bytes/markers; marked payload versions are separate. Changing installer contracts requires coordinated compatible owner releases. Historical God step numbers do not transfer optional-tool ownership from Angels. User-selected project roots remain valid guide destinations.

**Publication boundary:** registry-format content requires the compatible published God 0.42.0 / Angels 0.10.0 cohort pinned in the Catalogue. God validates archive/readiness/status; Angels uses the shared reader for naming and guide/Git setup. Malformed new data never falls back. See the Usage Guide for exact owner evidence and its private dependency-profile limit. Existing consumers require their explicit package/content updates; target/consent semantics and frozen payloads are unchanged.

## 4. Controlled section reading

Only registry-listed H2 sections may be omitted, and each must be read when its condition applies. Preamble and every unmapped H1/H2 section remain required in the chosen audience mode, in original order. Invalid/duplicate IDs, missing/ambiguous headings and malformed data fail visibly. Section selection never changes selected-owner obligations.

H1 or the next H2 terminates a topic; H3-H6 belongs to its parent. Accept ATX headings with 0-3 leading spaces, tabs after hashes and optional closing hashes, plus underline-style H1/H2. Preserve original source boundaries/line numbers including audience-hidden headings, and keep fenced examples literal. The former inventory and section-table anchors remain here as pointers to their single supporting data source.
