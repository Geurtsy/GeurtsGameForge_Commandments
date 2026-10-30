<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Game Forge Commandments

**Version:** 0.66.0
**Unity minimum:** Unity 6.6 (6000.6.3f1) or newer
**Status:** Draft normative package; publication and implementation evidence are separate
**Audience:** AI agents only
**Documentation source repository:** `Geurtsy/GeurtsGameForge_Commandments`

Start at [AI_READ_FIRST.md](AI_READ_FIRST.md), then [GeurtsTechniqueManifest.md](GeurtsTechniqueManifest.md). The manifest is the sole resolver; this optional index does not select additional reading. Source contributions also follow [CONTRIBUTING.md](CONTRIBUTING.md).

Documentation is exclusively for AI agents. AI efficiency is the first documentation-design priority: concise deterministic guidance, one owner per rule, minimum task-relevant context and accurate evidence. Preserve exact constraints and safety/ownership boundaries. The separate runtime technical priorities are unchanged.

## Task index

| Task | Selected owner or index |
|---|---|
| Determine the primary game-platform scope and its exceptions | [Manifest primary game target](GeurtsTechniqueManifest.md#13-primary-game-target) |
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

Multiplayer is planned and unavailable. Its specification always includes Steam networking inside the kit through FishNet, FishySteamworks and Steamworks.NET. The released standalone Steam brick remains available for its separate platform services and release preparation; it is not an optional multiplayer transport kit. See the Multiplayer owner for required dependencies, shared native ownership and outstanding implementation evidence.

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

Angels owns **Install Codex guide**. Documentation Update replaces the complete `GeurtsGameForgeCommandments/` folder and exactly three Copilot routes after one cancel-default confirmation. AGENTS.md remains a separate explicit installation. Every unlisted path stays untouched; content Update must not inspect or modify `Docs/GameDesign/`.

Game Forge integration is the primary supported workflow. The optional [StandardsOnly profile](GeurtsTechniques/GeurtsStandardsOnlyTechnique.md) applies general standards without Forge packages; Steam, Odin Inspector and Quantum Console remain optional in that profile. The [existing offline Windows installer](Tools/StandardsOnlyInstaller/README.md) preserves its immutable 1.0.0 artifact and pinned documentation 0.61.1. It is an initial preservation installer, not the separately approved managed-replacement requirement. Neither standalone route installs additional software or packages. Do not claim the requested replacement implementation is available.

Package tools are inert content. The legacy manual manager does not implicitly create or update `Docs/GameDesign/`. Its separate positive `-IncludeGameDesignScaffolding` and `-UpdateGameDesignManifest` options remain owned by AI Agent Setup; they are not part of content Update. Folder setup and other project tools require their own explicit action and owner checks.

## Reading modes and history

Use the manifest's task selection before its audience/section reader. Read entry and manifest in full. GameUse includes selected shared rules; ForgeDevelopment also includes relevant maintainer sections. The legacy HUMAN-ONLY tag means optional historical/reference content, not a secondary human audience. It and IncludeHuman keep their compatible spelling. Templates and exact contracts retain their payloads.

Historical release records are in [History/Changelog.md](History/Changelog.md) and the [archived 0.62.19 README](History/README-0.62.19.md). History is non-normative and never routine onboarding. Existing migrations apply only when the task selects the corresponding transition.

<!-- GEURTS-SECTION:BEGIN FORGE-DEVELOPMENT-ONLY -->
## Source-Repository Validation

From a source checkout, run the read-only package validator and isolated automation harness; neither command accepts or mutates a real Unity project:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ".\Tools\ValidateGeurtsDocumentation.ps1"
powershell -NoProfile -ExecutionPolicy Bypass -File ".\Tools\Tests\RunAutomationTests.ps1"
```

PowerShell 7 may replace `powershell` with `pwsh`. The validator checks package, registry, authority, lifecycle, schema, template, and payload rules without writing repository content. The automation harness uses guarded temporary fixtures outside the checkout and includes negative lifecycle-boundary regressions. Both commands accept `-OutputFormat Json`; `-RepositoryRoot` is an optional explicit source-checkout override.

**Before catalogue publication**, also supply the owning Git checkouts for every released entry, including BigBang and the compatibility adapter. For example, from PowerShell:

```powershell
$sources = @('C:/src/God', 'C:/src/Audio') # Extend to every released catalogue repository.
& .\Tools\ValidateGeurtsDocumentation.ps1 -SourceRepositories $sources -OutputFormat Json
```

Each checkout's `origin` must match its catalogue source repository. Fetch the pinned commits and their manifest blobs beforehand; stable release tags must already have been verified against the owning immutable release. The publication gate reads `package.json` and `ForgeCapabilities.json` from those exact commits, regardless of working-tree edits. It rejects identity/version drift, missing or extra required Forge dependencies, unequal minimums, and unavailable catalogue providers. Missing evidence is a failure. It does not fetch, execute package code, change checkouts, acquire documentation or update consumers. Run `Tools/Tests/TestGeurtsBrickSources.ps1` for the focused isolated regressions; the full harness includes them. Normal validation without `-SourceRepositories` remains local and offline.

<!-- GEURTS-SECTION:END -->

<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->
## Changelog

### 0.66.0 — 30 October 2026

- Define explicit presence ownership and local-first optional cloud slot cooperation: account-bound opt-in, immutable copy review, separate transfer choice, commit-time preservation, backup and ordinary game-owned Load.
- Record God 0.40.0, Steam 0.4.0 and Save and Load 0.5.0 as pending unavailable candidates. Preserve all published catalogue pins, Multiplayer policy and manual consumer adoption; native acceptance is not inferred.
- Note the newer official wrapper without claiming it is the verified dependency profile. Retain implementation and test details in the owning candidate repositories.

### 0.65.0 — 30 October 2026

- Require Steam networking inside the Multiplayer kit using FishNet, FishySteamworks and Steamworks.NET. Keep Client-Host authority, latency-first priorities, local Tugboat testing and separate real Steam acceptance.
- Add an explicitly planned/unavailable Multiplayer catalogue entry and selective usage section, with no installation source or invented API. Preserve the existing Steam brick and every released package pin; clarify its separate platform-service/release-preparation role.
- Align shared dependency, integration and setup rules with built-in Multiplayer ownership. Require one native session for standalone/combined use and record the outstanding Multiplayer implementation, compatible dependency profile and Steam/God cooperation checks.
- Verify transport selection against primary official references; synchronize versions and add bounded semantic regressions for optional-kit drift, false availability and duplicate native ownership. Documentation validation does not certify runtime or consumer adoption.

### 0.64.1 — 30 October 2026

- Make Steam games built with Unity for Windows x64 PCs the primary documentation target in the manifest's applicability rules. Route the AI entry, Technical and Steam owners and this index to that single authority.
- Preserve StandardsOnly, explicit project exceptions, the Unity minimum, default-off native Steam development, game-design ownership and installation consent. This scope clarification changes no package implementation, published brick pin or consumer project.
- Reuse the Steam target regression against the authoritative manifest; retain source/version/size guidance, frozen payloads and historical evidence.

### 0.64.0 — 30 October 2026

- Supersede saved-consent automatic package/content updates with a current explicit Update action and owning confirmation for every update. Preserve exact mutation targets and separate AGENTS.md installation.
- Retain existing read-only check/catalogue-refresh triggers, source publication and the background game-change integration queue. Keep legacy settings compatible without treating them as mutation authority.
- Record the God APIs, handlers, settings and acceptance work required for implementation adoption. Preserve v0.63.0 and all historical evidence; installed behavior requires its own released implementation and consumer update.
- Advance the passive compatibility adapter to published 0.16.0 with verified source/evidence hashes; retain the published God pin while its 0.40.0 candidate remains blocked and unpublished.
- Reconcile published 0.63.2, preserving Response Control 1.2.0 and consolidated subject-owner links. Route manual-only updates through their current owner sections, supersede the old response-selection audit and retain all owner acceptance/publication holds.
- Identify documentation source/version/revision and honest publication/freshness state at entry. Require separately labelled pre-download transfer and extracted-size evidence for the exact candidate; preserve confirmation, schema, targets and offline startup. God display implementation remains pending.

### 0.63.2 — 30 October 2026

- Replace repeated queue and content-lifecycle summaries in the entry guide with direct, conditional pointers to Automation and the Commandments Companion owner. Keep the local-read, no-write and project-design boundaries explicit.
- Route the Technical core's standards-only dependency explanation to the existing Standards-Only owner. Route copied brick usability, Codex compatibility and content-action rules to their existing Technical, Documentation Maintenance and Companion owners.
- Clarify that full normative rules stay in their selected subject owner, with precise consumer pointers. Preserve concise routing and permission boundaries, exact schemas and payloads, self-contained templates, executable installation steps and historical records.
- Validate all eleven consolidated owner links and their target sections, with two bounded negative regressions for a missing route and a missing owner section. No dependency/profile policy, implementation, installer payload or brick release pin changes.

### 0.63.1 — 30 October 2026

- Select chat Response Control 1.2.0 for all Unity game-development work, including design, C# coding, debugging, Editor tools and related technical work. Keep unrelated topics outside scope.
- Align scope rejection, mixed requests, `!s`, clarification and project awareness. Preserve manifest-selected technical ownership, project design-fact safeguards and downloadable-file reference requirements.
- Require concise everyday language in text and voice replies, explain unfamiliar technical terms when needed and break complex instructions into simple steps. Preserve necessary precision and AI-readable technical documentation requirements.
- Use full words and avoid abbreviations in all replies, including headings and `!s`; replace the abbreviated summary heading with Summary. Preserve exact technical identifiers.
- Synchronize the package registry, metadata, tool version guards and validation expectations. AI-only documentation policy, schemas, frozen payloads and brick release pins remain unchanged; no brick implementation or consumer update is required by this chat-policy change.

### 0.63.0 — 29 October 2026

- Make active documentation exclusively for AI agents, with efficiency first and Game Forge integration primary. Preserve runtime technical priorities and archive the former overview as history.
- Select cross-repository documentation maintenance for every approved Game Forge change, including BigBang. Require synchronized per-brick usage contracts and truthful owner/evidence reporting.
- Add selective usage guidance for all 13 released catalogue entries, grounded in exact package/capability/provider/recipe sources. Correct Angels' missing Quantum Console requirement; preserve every release pin.
- Distinguish the God-owned service, passive adapter, existing offline preservation installer and unimplemented standalone replacement requirement. Retain schema 3.0.0, the folder plus three-file target set, separate Codex guides and all data-loss/GDD boundaries.
- Permit abbreviations only in leading uppercase asset/scene type prefixes for new governed names; use full words in commands, code symbols, identifiers and new folders. Preserve fixed contracts and report existing abbreviated command names as owner compliance gaps. Clarify that compatibility warnings cannot override hard update guards.
- Update source validation and bounded negative regressions. No owning brick source, installer implementation, installed consumer or published release is changed by this documentation work. The chat-only version 1.1 guide remains unchanged; its off-topic rejection still differs from the broader session instructions and needs a separate response-policy update.
<!-- GEURTS-SECTION:END -->
