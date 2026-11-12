<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Game Forge Commandments

**Version:** 0.74.7
**Unity minimum:** Unity 6.6 (6000.6.3f1) or newer
**Status:** Draft normative package; publication and implementation evidence are separate
**Audience:** AI agents only
**Documentation source repository:** `Geurtsy/GeurtsGameForge_Commandments`

Start at [AGENTS.md](AGENTS.md), the sole startup and package resolver; this optional index does not select additional reading. Source contributions also follow [CONTRIBUTING.md](CONTRIBUTING.md).

Documentation is exclusively for AI agents. AI efficiency is the first documentation-design priority: concise deterministic guidance, one owner per rule, minimum task-relevant context and accurate evidence. Preserve exact constraints and safety/ownership boundaries. The separate runtime technical priorities are unchanged.

## Task index

| Task | Selected owner or index |
|---|---|
| Determine the primary game-platform scope and its exceptions | [Manifest primary game target](AGENTS.md#13-primary-game-target) |
| Select a supported render pipeline or resolve Unity rendering dependencies | [Unity owner](GeurtsTechniques/GeurtsUnityTechnique.md#supported-render-pipeline-and-official-unity-packages) |
| Apply any approved Game Forge change, including BigBang | [Documentation Maintenance Technique](GeurtsTechniques/GeurtsDocumentationMaintenanceTechnique.md) |
| Select and use a brick | [Brick AI Usage Guide](GeurtsTechniques/GeurtsBrickUsageGuide.md), [Brick Contract](GeurtsTechniques/GeurtsBrickContract.md), [Catalogue](GeurtsTechniques/GeurtsBrickCatalogue.json) |
| Plan Multiplayer with Steam built in | [Multiplayer owner](GeurtsTechniques/GeurtsMultiplayerTechnique.md#multiplayer-kit-and-built-in-steam-support), [planned availability and setup](GeurtsTechniques/GeurtsMultiplayerTechnique.md#availability-setup-and-owner-handoff) |
| Apply the current-action update requirement | [Brick Contract](GeurtsTechniques/GeurtsBrickContract.md#explicit-updates-only), [Companion consent](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#current-action-confirmation-and-legacy-automatic-callers), [owner adoption](Migrations/v0.64.0.md) |
| Install or update managed Commandments | [God-owned service and secondary standalone requirements](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md) |
| Native routing or separately selected Codex guide | [AI Agent Setup](GeurtsTechniques/GeurtsAIAgentSetupTechnique.md), [AGENTS.md Technique](GeurtsTechniques/GeurtsAgentTechnique.md) |
| Forge-owned Editor presentation | [Editor UI Theme Technique](GeurtsTechniques/GeurtsEditorUIThemeTechnique.md), [Editor Appearance Technique](GeurtsTechniques/GeurtsEditorAppearanceTechnique.md) |
| Naming, code symbols or commands | [Naming](GeurtsTechniques/GeurtsNamingTechnique.md), [Code](GeurtsTechniques/GeurtsCodeTechnique.md), [Commands](GeurtsTechniques/GeurtsCommandsTechnique.md) |
| Source validation and publication | [CONTRIBUTING.md](CONTRIBUTING.md) and the validation section below |

The folder definition JSON `canonicalPath` property remains a legacy serialized compatibility key; documentation uses `Required package path`.

Installed Forge packages/bricks and managed Commandments/documentation must never update automatically. Every update requires a current explicit user Update action and the owning confirmation. Saved consent and deliberate God menu openings are not exceptions. Existing read-only checks retain their trigger/consent boundaries; this does not stop authorized background game-change integration/publication. Documentation publication does not patch older installed God behavior.

Current brick versions and immutable installation sources belong only in the Catalogue. The usage guide records pinned source evidence, not alternative installation targets. Planned features are unavailable. Documentation validation does not certify Unity compilation, native services, rendered interfaces or gameplay.

Multiplayer is released. Its installation includes the newest verified compatible FishNet and Steamworks.NET dependencies plus bundled FishySteamworks. The released standalone Steam brick remains available for its separate platform services and release preparation; it is not an optional multiplayer transport kit. See the Multiplayer owner for required dependencies, shared native ownership and outstanding implementation evidence.

## Installing Forge: BigBang or manual

Use Windows, Unity **6000.6.3f1 or newer**, and the [current catalogue](GeurtsTechniques/GeurtsBrickCatalogue.json) for published package versions and exact Git installation sources. Do not install floating branches, duplicate vendor imports or the passive Companion adapter in a fresh project.

### BigBang installation

1. In Unity Package Manager, choose **Add package from Git URL** and paste the catalogue's exact BigBang `source`. Open **Tools > Geurts Game Forge > BigBang**.
2. **Install required libraries:** acquire licensed Odin Inspector and Quantum Console through their supported distributions and import them. Package presence does not prove licence ownership.
3. **Install required Steam API:** use BigBang's explicit Steamworks.NET acquisition action. Preserve an existing supported wrapper; resolve incompatible or duplicate imports before continuing.
4. **Verify all prerequisites:** run the local check and resolve its findings. Steam need not be running; no login, AppID or native initialization is required for this check.
5. **Get latest God source**, then **Install and verify God**. Wait for UPM resolution and successful compilation. A downloaded package or completed UPM request alone does not establish readiness.
6. **Continue with God** using the explicit handoff. The new manual-only update requirement needs a matching God implementation; verify the installed version against the owner adoption record. Layout preferences remain a separate subject. Installation does not acquire Commandments or create scenes.

### Manual installation

1. Import licensed Odin Inspector and Quantum Console into the same Unity project. Follow each vendor's supported installation, avoiding duplicate imports.
2. Install **Steamworks.NET** through UPM using the official package subpath and immutable wrapper reference verified by the current BigBang release. Follow [Steam prerequisite installation](GeurtsTechniques/GeurtsSteamIntegrationTechnique.md#package-prerequisite-and-installation) and the pinned BigBang owner's `Documentation~/SteamPreparation.md` for its tested reference and local API/native-plugin checks. Do not add Git URLs to a package's `package.json.dependencies`.
3. In Package Manager, choose **Add package from Git URL** and paste God's exact `source` from the catalogue. God is at its repository root; do not add `?path=/Packages/...`. Wait for resolution and successful compilation, then verify the resolved identity, version and commit.
4. Open **Tools > Geurts Game Forge > Game Forge God**. Inspect local prerequisite/setup findings and address unresolved errors before continuing.

### Continue after either route

1. Open **View Commandments** in God. Explicitly choose **Update Geurts Game Forge Commandments** and review its cancel-default confirmation: it replaces the complete managed Commandments folder and exactly three AI routes. Preserve any wanted edits outside those targets before accepting. Package Update and Update All do not acquire content.
2. In **Build Forge**, inspect local foundation readiness, then explicitly run the bootstrap setup when ready. God owns the retained bootstrap scenes. Install optional Angels project tools or Diagnostics console tools only when needed; FMOD remains optional.
3. For an existing Companion installation, update it to the passive adapter's exact current catalogue source, alongside a compatible God update. Either order is supported with the service's competition guards. Keep the adapter while custom Editor assemblies reference its legacy APIs; migrate those references manually before removing it. See the [service transition](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#existing-installation-transition). No installation or package update rewrites custom code, guides or game design.


## Separate actions and secondary routes

Angels owns **Install Codex guide**. Documentation Update replaces the complete `GeurtsGameForgeCommandments/` folder and exactly three Copilot routes and the portable root AGENTS.md managed block after one cancel-default confirmation. Existing project instructions outside the root block are preserved. Every unlisted path stays untouched; content Update must not inspect or modify `Docs/GameDesign/`.

Game Forge integration is the primary supported workflow. The optional [StandardsOnly profile](GeurtsTechniques/GeurtsStandardsOnlyTechnique.md) applies general standards without Forge packages; Steam, Odin Inspector and Quantum Console remain optional in that profile. The [existing offline Windows installer](Tools/StandardsOnlyInstaller/README.md) preserves its immutable 1.0.0 artifact and pinned documentation 0.61.1. It is an initial preservation installer, not the separately approved managed-replacement requirement. Neither standalone route installs additional software or packages. Do not claim the requested replacement implementation is available.

Package tools are inert content. The legacy manual manager does not implicitly create or update `Docs/GameDesign/`. Its separate positive `-IncludeGameDesignScaffolding` and `-UpdateGameDesignManifest` options remain owned by AI Agent Setup; they are not part of content Update. Folder setup and other project tools require their own explicit action and owner checks.

## Reading modes and history

Use the AGENTS.md task selection before its audience/section reader. Read AGENTS.md in full. Retrieve only relevant file/version and section-condition records from the AGENTS-owned GeurtsTechniques/GeurtsDocumentationRegistry.json, preferably through the local reader Preview. Preview is metadata, not rule reading. Without PowerShell, apply the AGENTS.md plain-file fallback. GameUse includes selected shared rules; ForgeDevelopment also includes relevant maintainer sections. The legacy HUMAN-ONLY tag means optional historical/reference content, not a secondary human audience. It and IncludeHuman keep their compatible spelling. Templates and exact contracts retain their payloads.

Historical release records are in [History/Changelog.md](History/Changelog.md) and the [archived 0.62.19 README](History/README-0.62.19.md). History is non-normative and never routine onboarding. Existing migrations apply only when the task selects the corresponding transition.

<!-- GEURTS-SECTION:BEGIN FORGE-DEVELOPMENT-ONLY -->
## Source-Repository Validation

From a source checkout, run the read-only package validator; select the isolated regression harness through [CONTRIBUTING.md](CONTRIBUTING.md) only when required; neither command accepts or mutates a real Unity project:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ".\Tools\ValidateGeurtsDocumentation.ps1"
```

PowerShell 7 may replace `powershell` with `pwsh`. The validator checks package, registry, authority, lifecycle, schema, template, and payload rules without writing repository content. The automation harness uses guarded temporary fixtures outside the checkout and includes negative lifecycle-boundary regressions. Both commands accept `-OutputFormat Json`; `-RepositoryRoot` is an optional explicit source-checkout override.

**Before catalogue publication**, also supply the owning Git checkouts for every released entry, including BigBang and the compatibility adapter. For example, from PowerShell:

```powershell
$sources = @('C:/src/God', 'C:/src/Audio') # Extend to every released catalogue repository.
& .\Tools\ValidateGeurtsDocumentation.ps1 -SourceRepositories $sources -OutputFormat Json
```

Each checkout's `origin` must match its catalogue source repository. Fetch the pinned commits and their manifest blobs beforehand; stable release tags must already have been verified against the owning immutable release. The publication gate reads `package.json` and `ForgeCapabilities.json` from those exact commits, regardless of working-tree edits. It rejects identity/version drift, missing or extra required Forge dependencies, unequal minimums, and unavailable catalogue providers. Missing evidence is a failure. Every pinned package also passes the [Brick Contract metadata gate](GeurtsTechniques/GeurtsBrickContract.md#unity-package-metadata-release-gate); use its standalone candidate command for a new brick before catalogue registration. It does not fetch, execute package code, change checkouts, acquire documentation or update consumers. Run `Tools/Tests/TestGeurtsBrickSources.ps1` only when its source-validator behavior changes or a concrete risk requires it; the full harness includes it. Normal validation without `-SourceRepositories` remains local and offline.

<!-- GEURTS-SECTION:END -->

<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->
## Changelog

### 0.74.7

- Catalogue UI Foundations 0.15.0 shared Inspector-authored Sprite skin for button states, panels/frames and native scrollbar artwork. Synchronize the usage guide with typed assignments, fallbacks, ownership and focused nonvisual evidence. No consumer installation.

### 0.74.6

- Catalogue published God 0.47.3 shared Editor UI caching and bounded embedded repainting, Audio 0.9.8 change-driven navigation summaries, and Object Pooling 0.8.6 cached browser inventory. Review covers all 17 owners at their recorded revisions. Ten focused nonvisual checks pass; the recorded 111-assembly test graph has zero default-policy diagnostics. Preserve concurrent GitFlow 0.5.4 and its independent evidence. Consumer updates remain explicit.

### 0.74.5

- Catalogue GitFlow 0.5.4 with explicit preserved publisher deployment, native-helper lifetime, package-cache removal recovery and same-PID CLI startup. Include complete native failure diagnostics for guarded repair. Retain manual package Update and stopped-owner adoption.

### 0.74.4

- Catalogue immutable GitFlow 0.5.3 with labelled read-only queue fields, grouped source/dependency/validation details and retained nested expansion. Preserve private HTTPS access, larger repair context and manual consumer updates. Record the focused native and zero-diagnostic compiler evidence. Other brick pins and contracts remain unchanged.

### 0.74.2

- Catalogue released GitFlow 0.5.1 and its saved-credential private HTTPS queue viewing. Record focused native/host acceptance and retain manual consumer installation. Also catalogue Compatibility 0.4.1 for the qualified Unity Pipeline Player-only declaration repair. Other brick pins and contracts remain unchanged.

### 0.74.1

- Catalogue God 0.47.2, Multiplayer 0.5.0 and Compatibility 0.4.0 for reviewed dependency installation with the newest verified compatible stable SDK sources. Preserve the published schema-4 root-onboarding and Angels updates. Consumer updates remain explicit.

### 0.74.0

- Include the portable root AGENTS.md route in the schema-4 confirmed Commandments installation and Update; retain project instructions outside the block and start at the normal installed AGENTS.md authority. Older schema-3 consumers reject the expanded contract before mutation.

### 0.73.3

- Publish the immutable GitFlow 0.5.0 catalogue pin and usage guidance for automatic publisher setup and the full Queue Panel.
- Retain scoped nonvisual acceptance and the user's visual-check waiver. Consumer updates remain manual; unrelated pins, schemas and tool versions stay unchanged.

### 0.73.2

- Publish Angels 0.12.0 catalogue and usage evidence for multi-file Markdown selection in Game design context, retaining explicit batch import, primary selection and overwrite review.
- Consumer package updates remain separate explicit actions.

### 0.73.1

- Publish Settings 0.9.1 and UI Foundations 0.14.1 catalogue pins and mapping guidance: additional independent controls, complete collision validation and stacked editable conflict dialogs.
- Existing consumer updates remain explicit; no live game installation is included.


### 0.73.0

- Remove content-hash gates for Compatibility source/preparation, release evidence and software/archive downloads. Retain identity/version/Git selection, bounded patch contexts, safe paths, file observations and actual zero-warning/functional acceptance. - 11 November 2026

- Allows exact reviewed URP/Core and required Shader Graph repairs through Compatibility with retained originals, unchanged GUIDs and the complete zero-warning/native acceptance gates.

- Separates native Steam/account/device acceptance from Multiplayer implementation and catalogue publication. Unperformed checks stay explicitly unverified; other validation gates remain mandatory.
- Publishes the exact-source Multiplayer catalogue entry and owner usage route after implementation qualification.

### 0.72.2

- Pin released Settings 0.8.0 and document automatic Unity setup, explicit UI ownership, source-repair qualification and nonvisual evidence limits.


### 0.72.1 - 11 November 2026

- Pin the published optional cloud-saving cohort: Save and Load 0.6.0, Steam 0.6.0 and God 0.45.0 at their verified immutable source commits.
- Route account/copy review, guarded transfer and protected local import to Save and Load; Steam supplies account-pinned bytes through God. Local saving works without Steam.
- Record focused passing checks and the explicit user authorization to publish without real Steam-server/second-device checks. No visual checks or live consumer/account changes.
- Preserve the merged minimal-testing/no-visual/drag-and-drop policy, its scoped CI and every unrelated brick pin. No tool or regression-script changes.

### 0.72.0 - 11 November 2026

- Make minimal, proportionate nonvisual validation the shared default for every Forge project's technical design and work; remove automatic multi-Editor/full-suite and visual acceptance requirements.
- Require actual typed serialized drag-and-drop asset references on ScriptableObjects/components instead of path strings; preserve legitimate I/O and necessary content-delivery boundaries.
- Scope CI, including verified release-tag ranges, to known content changes while retaining complete static checks on both PowerShell hosts and fail-closed full regressions for shared tooling/policy or unknown inputs.
- Reuse successful registry structural validation only for identical authority text, with fresh safe-path checks and independent returned objects; remove duplicate positive static text validation and implementation-mirroring check-name inventories.
- Preserve existing catalogue pins, immutable payloads, account/data/consent checks and manual consumer adoption.

### 0.71.2 - 11 November 2026

- Publish the GitFlow 0.3.0 catalogue pin and current owning usage/evidence links after its immutable release. Synchronize God minimum and Python prerequisites; preserve manual consumer updates.
- Record the release-specific user removal of visual acceptance as a requirement without changing generic appearance standards. Compiler and functional evidence remain required and source-bound.
- Preserve the concurrent published 0.71.1 Diagnostics/Angels updates and all unrelated brick pins, schemas, frozen payloads and projects.

### 0.71.1 - 11 November 2026

- Pin published Angels 0.11.2 and Diagnostics 0.11.8 confirmation-focus fixes.
- Record nine native checks in both supported validation Editors, zero focus/compiler diagnostics, and the exact unchanged-runtime evidence reuse boundary.
- Preserve independent confirmations, current explicit updates, existing dependencies and frozen installer payloads.

### 0.71.0 - 11 November 2026

- Require Unity-generated committed metadata for all existing and future UPM bricks, with a reusable candidate release gate and automatic checks for every released Catalogue entry.
- Reject missing file/folder sidecars, invalid/duplicate GUIDs and mismatched/orphan metadata; preserve Unity-ignored paths, existing identities and explicit consumer updates.
- Pin compatibility adapter 0.16.1 with its missing instruction sidecar; all sixteen released packages now pass the committed-tree metadata check.
- Extend isolated Git regressions for metadata failures and exact candidate/prefix behavior. No Unity implementation or consumer installation changes.

### 0.70.2 - 11 November 2026

- Pin eleven package patch releases that include Unity-generated instruction metadata and reject absent/invalid sidecars at release validation.
- Record bounded immutable Git import checks, fresh C# compilation and unchanged-behavior evidence reuse; preserve explicit consumer updates and existing native/player limits.

### 0.70.1 — 11 November 2026

- Publish Automatic Git LFS through the Catalogue with its standalone Git source, current God prerequisite and source-matched usage evidence. Consumer installation remains explicit.

### 0.70.0 â€” 10 November 2026

- Pin published Compatibility 0.2.0 and its exact owning source/evidence. Authorize bounded automatic local Compatibility repairs on Unity startup and package changes, with exact admission, private originals, native project-relative package adoption, status, pause and interrupted-operation guards.
- Preserve manual Forge release/content updates, official Unity rendering packages, independent first-load bootstrap limits and full compilation/runtime verification boundaries.

### 0.69.0 - 10 November 2026

- Restrict Forge support to URP. HDRP remains deferred until explicit adoption and support work; Built-in is unsupported. This pre-1.0 support-scope change advances the minor version.
- Require official Unity URP and shared Render Pipelines Core releases; exclude custom compatibility forks and patched copies without weakening the zero-warning gate.
- Route pipeline and provenance work to the Unity owner. Documentation publication does not install/update consumers, migrate settings or certify runtime enforcement.

### 0.68.2 - 10 November 2026

- Pin the repaired God 0.44.3 release: independent Compatibility catalogue admission, separate catalogue/selected/bulk checks, bounded cancellation and rejection of stale late results.
- Synchronize pinned usage evidence and documentation metadata; existing update confirmations and consumer installation remain explicit.

### 0.68.1 - 10 November 2026

- Publish God 0.44.2 in the source catalogue at its existing immutable release commit, together with required Compatibility 0.1.1 and the exact dependency minimum.
- Synchronize pinned usage evidence and package metadata. No package implementation, update consent or consumer installation changes.

### 0.68.0 â€” 9 November 2026

- Consolidated session, version, task routing, applicability and conflict rules in AGENTS.md; specialists stay separate. Legacy entry/manifest filenames are compatibility redirects only.
- Updated current routes, local reader, validation and regression checks; schema-3 target/confirmation boundaries and historical Codex payloads and standalone artifacts remain intact; new explicit guide installations route directly to AGENTS.md. God/Angels consumer adoption must be verified before compatible publication.

### 0.67.5 â€” 7 November 2026

- Publish Diagnostics native PanelRenderer foreground coverage and exact release evidence, retaining legacy UI Document and canvas behavior.

### 0.67.4 â€” 7 November 2026

- Require the open bootstrap Diagnostics console to remain above game screen UI, including later-created canvases and UI Toolkit panels, with temporary ordering restored on close or stop.
- Advance the Diagnostics catalogue/usage evidence to the foreground release and its explicit Geurts-maintained QC Unity 6.6 compatibility repair. Source publication and consumer adoption remain separate.

### 0.67.3 â€” 6 November 2026

- Pin published Scene Loading 0.7.5 and its source-matched owner/native and unfiltered compilation evidence; record caller-owned runtime-scene preservation and explicit caller cleanup during authored content replacement. Multiplayer remains planned and unavailable.
- Synchronize documentation package metadata and exact-version checks; retain unchanged technique and schema versions, other brick pins, frozen installer payloads and explicit consumer-update boundaries.

### 0.67.2 â€” 4 November 2026

- Pin the validated God 0.43.0 and Steam 0.4.0 source releases and describe shared native lifetime ownership.
- Record managed and local-socket acceptance separately from unverified native Steam, overlay and distribution. Multiplayer remains a planned catalogue entry; its implementation candidate is not advertised as a released install.
- Preserve all subject rules, schema identities, frozen installer payloads and consumer update/confirmation boundaries.

### 0.67.1 - 3 November 2026

- Pin Angels 0.10.1 with the older-Codex connection fix and source-matched Unity evidence. Its licensed Quantum Console dependency uses the separately published private Unity 6.6 repair; vendor source is not included in Forge releases. Consumer updates remain explicit.

### 0.67.0 - 3 November 2026

- Extract the exact 87-file inventory and all 34 controlled sections into one manifest-owned JSON registry; add the registry and optional evidence records to complete package membership. Preserve task-owner selection, reading order, conditions, consent and payloads.
- Compact the mandatory entry chain and expose targeted document/version/role and when-required metadata in the existing read-only reader. Retain complete reads, required/unmapped sections, original boundaries and both PowerShell hosts; reject missing/unsafe/ambiguous data without legacy fallback.
- Synchronize package metadata and source checks; migrate existing audience regressions and add bounded format-failure cases. Reading measurements and obligation/consumer evidence are in History/ReadingEfficiency-0.67.0.md and its JSON companion.
- Pin published registry-compatible God 0.42.0 and Angels 0.10.0 and refresh their Usage Guide evidence. Owner acceptance used the recorded private Quantum Console validation profile; supported-stock compatibility is not claimed. Schema-3 completeness includes the registry; target/confirmation semantics and immutable installer payloads remain unchanged. Consumer adoption remains explicit.

### 0.65.2 â€” 3 November 2026

- Pins Angels 0.9.8 with streamed complete-file hashing for naming and move review, removing the artificial 64 MiB source rejection while retaining full source/meta drift checks and bounded AI evidence.
- Synchronizes the owning usage/evidence links and package metadata. Consumer adoption remains a separate explicit Update action.

### 0.65.0 â€” 30 October 2026

- Require Steam networking inside the Multiplayer kit using FishNet, FishySteamworks and Steamworks.NET. Keep Client-Host authority, latency-first priorities, local Tugboat testing and separate real Steam acceptance.
- Add an explicitly planned/unavailable Multiplayer catalogue entry and selective usage section, with no installation source or invented API. Preserve the existing Steam brick and every released package pin; clarify its separate platform-service/release-preparation role.
- Align shared dependency, integration and setup rules with built-in Multiplayer ownership. Require one native session for standalone/combined use and record the outstanding Multiplayer implementation, compatible dependency profile and Steam/God cooperation checks.
- Verify transport selection against primary official references; synchronize versions and add bounded semantic regressions for optional-kit drift, false availability and duplicate native ownership. Documentation validation does not certify runtime or consumer adoption.

### 0.64.1 â€” 30 October 2026

- Make Steam games built with Unity for Windows x64 PCs the primary documentation target in the manifest's applicability rules. Route the AI entry, Technical and Steam owners and this index to that single authority.
- Preserve StandardsOnly, explicit project exceptions, the Unity minimum, default-off native Steam development, game-design ownership and installation consent. This scope clarification changes no package implementation, published brick pin or consumer project.
- Reuse the Steam target regression against the authoritative manifest; retain source/version/size guidance, frozen payloads and historical evidence.

### 0.64.0 â€” 30 October 2026

- Supersede saved-consent automatic package/content updates with a current explicit Update action and owning confirmation for every update. Preserve exact mutation targets and separate AGENTS.md installation.
- Retain existing read-only check/catalogue-refresh triggers, source publication and the background game-change integration queue. Keep legacy settings compatible without treating them as mutation authority.
- Record the God APIs, handlers, settings and acceptance work required for implementation adoption. Preserve v0.63.0 and all historical evidence; installed behavior requires its own released implementation and consumer update.
- Advance the passive compatibility adapter to published 0.16.0 with verified source/evidence hashes; retain the published God pin while its 0.40.0 candidate remains blocked and unpublished.
- Reconcile published 0.63.2, preserving Response Control 1.2.0 and consolidated subject-owner links. Route manual-only updates through their current owner sections, supersede the old response-selection audit and retain all owner acceptance/publication holds.
- Identify documentation source/version/revision and honest publication/freshness state at entry. Require separately labelled pre-download transfer and extracted-size evidence for the exact candidate; preserve confirmation, schema, targets and offline startup. God display implementation remains pending.

### 0.63.2 â€” 30 October 2026

- Replace repeated queue and content-lifecycle summaries in the entry guide with direct, conditional pointers to Automation and the Commandments Companion owner. Keep the local-read, no-write and project-design boundaries explicit.
- Route the Technical core's standards-only dependency explanation to the existing Standards-Only owner. Route copied brick usability, Codex compatibility and content-action rules to their existing Technical, Documentation Maintenance and Companion owners.
- Clarify that full normative rules stay in their selected subject owner, with precise consumer pointers. Preserve concise routing and permission boundaries, exact schemas and payloads, self-contained templates, executable installation steps and historical records.
- Validate all eleven consolidated owner links and their target sections, with two bounded negative regressions for a missing route and a missing owner section. No dependency/profile policy, implementation, installer payload or brick release pin changes.

### 0.63.1 â€” 30 October 2026

- Select chat Response Control 1.2.0 for all Unity game-development work, including design, C# coding, debugging, Editor tools and related technical work. Keep unrelated topics outside scope.
- Align scope rejection, mixed requests, `!s`, clarification and project awareness. Preserve manifest-selected technical ownership, project design-fact safeguards and downloadable-file reference requirements.
- Require concise everyday language in text and voice replies, explain unfamiliar technical terms when needed and break complex instructions into simple steps. Preserve necessary precision and AI-readable technical documentation requirements.
- Use full words and avoid abbreviations in all replies, including headings and `!s`; replace the abbreviated summary heading with Summary. Preserve exact technical identifiers.
- Synchronize the package registry, metadata, tool version guards and validation expectations. AI-only documentation policy, schemas, frozen payloads and brick release pins remain unchanged; no brick implementation or consumer update is required by this chat-policy change.

### 0.63.0 â€” 29 October 2026

- Make active documentation exclusively for AI agents, with efficiency first and Game Forge integration primary. Preserve runtime technical priorities and archive the former overview as history.
- Select cross-repository documentation maintenance for every approved Game Forge change, including BigBang. Require synchronized per-brick usage contracts and truthful owner/evidence reporting.
- Add selective usage guidance for all 13 released catalogue entries, grounded in exact package/capability/provider/recipe sources. Correct Angels' missing Quantum Console requirement; preserve every release pin.
- Distinguish the God-owned service, passive adapter, existing offline preservation installer and unimplemented standalone replacement requirement. Retain schema 3.0.0, the folder plus three-file target set, separate Codex guides and all data-loss/GDD boundaries.
- Permit abbreviations only in leading uppercase asset/scene type prefixes for new governed names; use full words in commands, code symbols, identifiers and new folders. Preserve fixed contracts and report existing abbreviated command names as owner compliance gaps. Clarify that compatibility warnings cannot override hard update guards.
- Update source validation and bounded negative regressions. No owning brick source, installer implementation, installed consumer or published release is changed by this documentation work. The chat-only version 1.1 guide remains unchanged; its off-topic rejection still differs from the broader session instructions and needs a separate response-policy update.
<!-- GEURTS-SECTION:END -->
