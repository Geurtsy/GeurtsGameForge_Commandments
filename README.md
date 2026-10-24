<!-- GEURTS-AUDIENCE: HUMAN-ONLY -->
# Geurts Game Forge Commandments

Development standards and contracts for humans and AI agents. Start at [AI_READ_FIRST.md](AI_READ_FIRST.md), then the [manifest](GeurtsTechniqueManifest.md). Source contributors also follow [CONTRIBUTING.md](CONTRIBUTING.md). Current brick versions and immutable Git sources belong only in the [catalogue](GeurtsTechniques/GeurtsBrickCatalogue.json).

## Clarified runtime rules and efficient reading in 0.62.19

The [Unity topic](GeurtsTechniques/GeurtsUnityTechnique.md#collider-movement-and-trigger-based-detection) defines live-collider movement versus initial/Editor placement, targeted-query exceptions and coroutine defaults with documented API/performance exceptions. [Automation](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#zero-warning-compilation-gate) now owns the shared strict compilation gate. ScriptableObject and FPS guidance is shorter with its requirements intact; consumer adoption remains manual.

## Runtime and compilation rules in 0.62.18

The [Unity topic](GeurtsTechniques/GeurtsUnityTechnique.md#collider-movement-and-trigger-based-detection) now owns physics-based collider movement, trigger-driven detection, coroutine scheduling and the zero-warning main gate. The [Code topic](GeurtsTechniques/GeurtsCodeTechnique.md#scriptableobjects-and-object-references) makes the ScriptableObject architecture explicit; the [Technical core](GeurtsTechniques/GeurtsTechnicalTechnique.md#performance-trade-off-guidance-under-efficiency) retains measured FPS priority over memory, storage and load-time savings. This is a documentation policy update; consumers adopt it manually.

## AI reading efficiency in 0.62.17

The catalogue now leads with package purpose and limits. Each package's AI entry routes tasks to exact current guides; repeated Angels and BigBang instructions have one complete owner. The [practical integration contract](GeurtsTechniques/GeurtsBrickContract.md#current-installation-and-practical-game-integration) requires reproducible disposable tests and current setup defaults. See the coordinated release for the exact updated owner pins and validation. Consumer package and Commandments updates remain separate manual actions.

## Standards without GameForge

Explicitly select **StandardsOnly** to apply the general standards without installing Forge packages. Follow the [Standards-Only Technique](GeurtsTechniques/GeurtsStandardsOnlyTechnique.md); Steam, Odin Inspector and Quantum Console remain optional in that profile. The [offline Windows installer](Tools/StandardsOnlyInstaller/README.md) retains its separately versioned, pinned documentation snapshot and preservation rules.

## Windows Steam preparation policy

Steam on **Windows x64** is the primary release target, with Steam Deck, Proton, SteamOS and other operating systems outside the current scope. The [Steam Integration Technique](GeurtsTechniques/GeurtsSteamIntegrationTechnique.md) defines account-free optional services and preview-only distribution drafts before AppID/store/depot setup, the local Steamworks.NET prerequisite for BigBang, compile independence, optional native-service ownership and separate evidence for preparation, integration and release.

The catalogue now publishes the optional Steam preparation brick, neutral God contracts and independent BigBang prerequisite gate. Graphics-backed Editor checks, recorded interactive UI checks and native-free Windows development artifacts establish their stated preparation scope. Real native Steam integration, overlay and customer distribution remain unverified. God remains the only mandatory shared Geurts brick, and unconfigured local development keeps native Steam off. See [the manual adoption guide](Migrations/v0.52.0.md); content updates retain schema 3.0.0 and the same four confirmed targets.

## Steam option C preparation

God supplies optional achievement/stat and cloud-data contracts without a platform SDK dependency. Steam supplies guarded customer-player launch, authored achievement/stat/cloud-text triggers, bounded account-qualified Remote Storage and reviewed preview-only SteamPipe drafts. Before Steamworks onboarding, partner IDs stay zero and native services stay off. Real Steam launch, overlay, server/cloud behavior and depot delivery remain unverified. General cloud transfers do not automatically synchronize Save and Load slots. Follow the [manual adoption and pending acceptance guide](Migrations/v0.60.0.md) and owning release evidence.

## Core requirement: clear Editor appearance and authoring feedback

Editor appearance is a first-class quality requirement for Forge-owned tools and inspectors. The [Editor Appearance Technique](GeurtsTechniques/GeurtsEditorAppearanceTechnique.md) requires meaningful Odin use, appropriate tabs, labelled collapsible sections, useful information/warning/error callouts and inline authoring findings. Warnings and errors remain discoverable in collapsed sections and inactive tabs; routine invalid configuration must not spam the Console. Genuine failures keep the established Diagnostics route. The [Editor UI Theme Technique](GeurtsTechniques/GeurtsEditorUIThemeTechnique.md) retains the shared dark/green palette, styling APIs, geometry and accessibility foundation.

Both standards apply within the existing technical priorities and framework/dependency rules. BigBang uses supported Unity/UI Toolkit equivalents before God/Odin are installed. This content release does not retrofit released bricks or certify native UI; see [the 0.44.0 adoption note](Migrations/v0.44.0.md) and update local Commandments manually through the existing confirmed action.

## Core requirement: use modules without code, extend them with code

Follow the [Technical Technique's no-code use and code-extension standard](GeurtsTechniques/GeurtsTechnicalTechnique.md#no-code-module-use-and-code-extensions) for every module. The Brick Contract applies it to brick integration; neither this summary nor a catalogue entry certifies an unreviewed release.

## Geurts Game Forge God brick contract

The manifest-selected [brick contract](GeurtsTechniques/GeurtsBrickContract.md) and [catalogue](GeurtsTechniques/GeurtsBrickCatalogue.json) require reuse of suitable Geurts bricks. God 0.29.0 owns the Commandments Editor service, along with its existing package management, lifecycle and shared contracts. See the Brick Contract for dependencies and the [Commandments Companion Technique](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md) for the service and passive-adapter transition. Local Markdown remains readable without God.

God is maintained in its own [com.geurts.gameforge.god repository](https://github.com/Geurtsy/com.geurts.gameforge.god). The catalogue supplies immutable Git sources for the published packages across independently maintained repositories. All brick installations, including isolated candidate validation, use Git. Develop in separate source checkouts, publish and validate a strictly newer release on its repository's main branch, and retain the consuming project's previous Git version until the user updates through God. A local commit or an unpublished branch does not complete a release.

[Settings System0.6](https://github.com/Geurtsy/com.geurts.gameforge.settings) provides Your Settings, Connections and Auto Settings Menu with reviewed native creation/connection and retained shared source feedback. Authored defaults stay intact while owned runtime copies signal actual readiness. [UI Foundations0.12](https://github.com/Geurtsy/com.geurts.gameforge.userinterface) supplies reviewed generated menus, optional catalogue/preview cooperation and retained Panel Renderer/UIDocument support. Both require minimum God0.33.1 and remain independent; unrelated callbacks/routes are preserved. Exact native/Windows/optional-peer evidence is in each owning package; full rendered/physical/device acceptance remains unverified.

The guided path is **Create Setting → choose type/default → Connect Target and consumers → Create and Connect → configure Auto Settings Menu → Refresh Preview → Connect to My Menu → check in the game**. Use the package's [authoring guide](https://github.com/Geurtsy/com.geurts.gameforge.settings/blob/v0.6.0/Documentation~/Authoring.md) for supported fields, consumer ownership and independent public APIs. Update packages manually through God; catalogue publication does not install them.

[Audio0.8.2](https://github.com/Geurtsy/com.geurts.gameforge.audio) owns shared playback, reusable sound identities, music/ambience/dialogue, category controls and setup. New configurations use Unity clips. Optional Audio-owned FMOD0.2.2 lives at Integrations~/FMOD, with no independent brick/catalogue entry. Installation/selection/Studio actions remain explicit and assignments separate. The installer uses exact frozen source 61c3201e593dd6be5020211fbda5e1154bce74ad. Existing native IDs/GUIDs and legacy destinations remain supported; no consumer update is performed by publication.

[Object Pooling0.6.2](https://github.com/Geurtsy/com.geurts.gameforge.objectpooling) remains independent and cooperates through neutral God lifecycle and completion contracts. Audio's shared completion component supports the selected backend; its optional FMOD package retains the legacy native completion component and original script GUID. Enable native FMOD pooling explicitly inside Audio only when that backend and Object Pooling are available. Keep the retired `com.geurts.gameforge.objectpooling.fmod` package removed to avoid duplicate script identities. [Scene Loading and Bootstrap0.6](https://github.com/Geurtsy/com.geurts.gameforge.sceneloading) retains independent neutral cooperation.

Audio0.8.2 and optionalFMOD0.2.2 require God0.33.1 and Windows Unity6000.6.3f1. [Settings0.6](https://github.com/Geurtsy/com.geurts.gameforge.settings) retains its neutral optional provider contract. Licensed Odin Inspector/Quantum Console and declared Unity dependencies apply; FMOD remains optional and its supported vendor source stays separately licensed. Catalogue publication installs nothing; users update manually through God.

[Save and Load 0.2.0](https://github.com/Geurtsy/com.geurts.gameforge.saveload) remains an informational starter with no runtime saving system. The compatibility adapter and Diagnostics target Unity 6000.6.3f1. The private repositories require Git access. Open **Game Forge God**, select **Refresh Catalogue**, then **Check for Updates** and the desired **Update** actions. Catalogue publication makes the newer packages available; it does not update the project's installed packages.

God0.33.4 and Diagnostics0.9.3 retain shared scoped logging/session contracts governed by the [Diagnostics Technique](GeurtsTechniques/GeurtsDiagnosticsTechnique.md). Diagnostics owns its configurable overlay and commands; its Editor authoring uses the God theme and pure shared rules. The current patches compact wrapped section headers and adapt preference label width. Editor92/92 and embedded12/12 pass at 480/1000px; [layout evidence](https://github.com/Geurtsy/com.geurts.gameforge.diagnostics/blob/v0.9.3/Documentation~/PreferencesLayoutValidation.md) keeps native/API geometry and unverified rendered/physical acceptance separate.

Angels owns selected game design imports and explicit primary selection. Follow the [GDD Technique](GeurtsTechniques/GeurtsGameDesignDocumentationTechnique.md) for bounded reads, preserved bytes, reviewed overwrite consent and manifest sections. God supplies navigation or compatibility forwarding.

God **0.29.0** includes a complete Commandments view inside God and under **Tools > Geurts Game Forge > Commandments**. Read local guidance, check versions explicitly, and update after the existing four-target confirmation. Opening the view is offline. The [Brick Contract](GeurtsTechniques/GeurtsBrickContract.md#installed-brick-menus) retains embedded-view lifetime and navigation rules for other bricks.

[Scene Loading and Bootstrap 0.6.0](https://github.com/Geurtsy/com.geurts.gameforge.sceneloading) provides ordinary retained-bootstrap startup, scene groups, unload-before-replacement and additive operations, configurable transitions and loading screens, scene-readiness hooks, and retry/safe-scene recovery. Editor Play loads bootstrap before gameplay scenes; temporary copies preserve dirty or untitled originals, and stopping Play restores the original Editor scene arrangement. Copies use different runtime paths, so path-sensitive code should use the brick's logical scene identity. Multiplayer integration points are framework-independent; a concrete networking adapter is not included. Install God 0.33.0 first, then use this brick's exact catalogue source. The repository is private, so Git access to it is required.

Scene Loading's authoring checks every selected object and actual scene/resource/Build Profile context, with inline findings and severity text/icons on closed boxed sections. The retained draft workflow keeps Save, Reload, Validate and results reachable, and preserves existing GUIDs and destination identifiers. Complete native Editor135/0/1, embedded10/10 and Editor Play/Windows Mono/IL2CPP34/34 checks passed. Full rendered appearance and physical-input acceptance remain unverified; see [the scoped authoring report](https://github.com/Geurtsy/com.geurts.gameforge.sceneloading/blob/v0.6.0/Documentation~/AuthoringValidation.md). Users install manually.

Scene Loading and Bootstrap 0.1.2 adds Odin file pickers filtered to Unity scene files for the bootstrap scene, destination scene lists and main scene, and per-scene presentation overrides. Selections retain project-relative paths with forward slashes and the `.unity` extension; existing saved paths remain compatible.

Scene Loading 0.4.0 adds **Scene Load Action** and reusable **Loading Presentation** ScriptableObjects for scene changes after startup. The action owns its scene/group; the presentation selects fade/custom transitions, loading screen and input policy. UI Foundations can call `SceneLoadAction.Invoke()` through a `UiAction` asset's Game callbacks, then use that action in a button's Invoke Action binding. Neither brick gains a required peer dependency. Follow the [asset-to-button guide](https://github.com/Geurtsy/com.geurts.gameforge.sceneloading/blob/main/Documentation~/GettingStarted.md#load-another-scene-from-ui-foundations) after manually updating the package through God.

Diagnostics 0.6.0 separates runtime Quantum Console **Channel** (Player/Developer), **Window controls** (Fullscreen/Restore), **Views** and **Logs** actions, with dark surfaces and green interaction accents. Views are Logs, Filters, Health, Inspect, Metrics, History and Session; the renamed Filters and Metrics controls retain their existing topic/severity and overlay behavior. Fullscreen keeps native zoom available, and Restore returns to the previous window layout within the current display. Audience classification, command permissions and the separate Editor-only theme standard remain unchanged.

Diagnostics 0.6.0 includes **Background transparency** in Metrics and the same saved preference in Odin settings: 0% is solid, 100% is clear, and the 12% default preserves the previous appearance. Only the overlay background fades; text and movement/resize handles retain their opacity. Layout reset leaves transparency unchanged.

Diagnostics 0.6.0 adds **Select text** / **Exit selection** to runtime and Editor Logs. Select and copy across the current loaded page with pointer/Shift selection and Ctrl+A/C while capture continues; the snapshot is read-only and clears when its display scope changes. Ctrl+V remains in the existing runtime command input without automatically executing pasted text. Runtime selection refuses pages exceeding 12,000 rendered visual lines and explains how to reduce the loaded page or collapse details; this renderer guard does not limit Editor selection or retained history.

Game Forge God distinguishes **Planned**, **Available** and **Installed** independently of update status. `released: false` marks an unreleased catalogue entry; `released: true` marks a published release. Installed is determined from the actual Unity project. Unreleased entries carry no installation actions or update checks. Their package identifiers reserve catalogue identities; release versions, sources and verified compatibility are selected when the packages are implemented and published.

**Version:** 0.62.19
**Unity minimum:** Unity 6.6 (6000.6.3f1) or newer
**Status:** Draft technique package
**Primary audience:** Human developers
**Secondary audience:** AI maintaining the documentation source
**Documentation source repository:** `Geurtsy/GeurtsGameForge_Commandments`

## Installing Forge: BigBang or manual

Use Windows, Unity **6000.6.3f1 or newer**, and the [current catalogue](GeurtsTechniques/GeurtsBrickCatalogue.json) for published package versions and exact Git installation sources. Do not install floating branches, duplicate vendor imports or the passive Companion adapter in a fresh project.

### BigBang installation

1. In Unity Package Manager, choose **Add package from Git URL** and paste the catalogue's exact BigBang `source`. Open **Tools > Geurts Game Forge > BigBang**.
2. **Install required libraries:** acquire licensed Odin Inspector and Quantum Console through their supported distributions and import them. Package presence does not prove licence ownership.
3. **Install required Steam API:** use BigBang's explicit Steamworks.NET acquisition action. Preserve an existing supported wrapper; resolve incompatible or duplicate imports before continuing.
4. **Verify all prerequisites:** run the local check and resolve its findings. Steam need not be running; no login, AppID or native initialization is required for this check.
5. **Get latest God source**, then **Install and verify God**. Wait for UPM resolution and successful compilation. A downloaded package or completed UPM request alone does not establish readiness.
6. **Continue with God** using the explicit handoff. Opening God can apply the user's existing layout/opening preferences. Installation does not acquire Commandments or create scenes.

### Manual installation

1. Import licensed Odin Inspector and Quantum Console into the same Unity project. Follow each vendor's supported installation, avoiding duplicate imports.
2. Install **Steamworks.NET** through UPM using the official package subpath and immutable wrapper reference verified by the current BigBang release. Follow [Steam prerequisite installation](GeurtsTechniques/GeurtsSteamIntegrationTechnique.md#package-prerequisite-and-installation) and the pinned BigBang owner's `Documentation~/SteamPreparation.md` for its tested reference and local API/native-plugin checks. Do not add Git URLs to a package's `package.json.dependencies`.
3. In Package Manager, choose **Add package from Git URL** and paste God's exact `source` from the catalogue. God is at its repository root; do not add `?path=/Packages/...`. Wait for resolution and successful compilation, then verify the resolved identity, version and commit.
4. Open **Tools > Geurts Game Forge > Game Forge God**. Inspect local prerequisite/setup findings and address unresolved errors before continuing.

### Continue after either route

1. Open **View Commandments** in God. Explicitly choose **Update Geurts Game Forge Commandments** and review its cancel-default confirmation: it replaces the complete managed Commandments folder and exactly three AI routes. Preserve any wanted edits outside those targets before accepting. Package Update and Update All do not acquire content.
2. In **Build Forge**, inspect local foundation readiness, then explicitly run the bootstrap setup when ready. God owns the retained bootstrap scenes. Install optional Angels project tools or Diagnostics console tools only when needed; FMOD remains optional.
3. For an existing Companion installation, update it to the passive adapter's exact current catalogue source, alongside a compatible God update. Either order is supported with the service's competition guards. Keep the adapter while custom Editor assemblies reference its legacy APIs; migrate those references manually before removing it. See the [service transition](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#existing-installation-transition). No installation or package update rewrites custom code, guides or game design.

## God dashboard

Standalone brick menus open their own larger Editor windows, including Game Forge God, Build Forge, God-owned Commandments, Diagnostics, Scene Loading and User Interface Foundations. New floating windows target 1000 × 760 Editor points, reduced to fit the main Editor area where space permits, and remain resizable and dockable. Each supported minimum stays in force, so a smaller main Editor area may not fully contain the window. Opening an existing window preserves its size, position and docking layout. God's Commandments view reuses its canonical theme; the adapter owns no dashboard.

All catalogue entries and the main **Dependencies** section start collapsed. Click a catalogue heading or arrow to expand or collapse that card independently. Collapsed cards keep the package name, installation/lifecycle state and update status visible; expand a card to view its details and package actions. Each window retains its expansion choices through searches, filters, catalogue refreshes and script reloads.

The larger forge icon retains its clean silhouette without a decorative outline. It puffs smoke and bounces gently during active work, then rests when work ends. The pinned Activity panel shows a concise current phase or result on the left. **Details** reveals the full current-operation information, while **Recent results (N)** reveals up to the latest eight completed operation results; both start collapsed on opening and after a script reload. Available operation actions and clear current success, cancellation or failure status remain visible outside the foldouts. The animation is an activity indicator rather than a completion percentage; phases and percentages are shown only when supplied by the underlying operation.

Existing immutable pins to God in `Geurtsy/GeurtsGameForge` remain valid in that repository's history. Existing clients check the Git repository from which they were installed and do not automatically cross repository boundaries; refreshing the catalogue alone does not switch that source. Switch an existing installation once through Unity Package Manager using the verified exact catalogue source, then verify the resolved identity, version and commit from `Geurtsy/com.geurts.gameforge.god`. God 0.7.1 and earlier retain their historical Documentation dependency until upgraded.

God 0.14.2 keeps a requested refresh pending until Unity can complete the catalogue refresh and package checks; repeated check requests share that work. A deferred Update that cannot start shows the reason and asks the user to select it again when ready. Cards distinguish the catalogue release from the verified update target and the installed version; source verification, compatibility checks and confirmation still apply. Publishing a catalogue entry does not install that release into an existing project.

## Optional FMOD line-ending setup

FMOD is completely optional. Angels owns **Install FMOD .gitattributes**, using the unchanged [Git Attributes template](GeurtsTechniques/GeurtsGitAttributesTechnique.md) and the [Forge Setup ownership rules](GeurtsTechniques/GeurtsForgeSetupTechnique.md). It preserves existing bytes and appends only the approved rules when applicable. The pinned template's God step numbering is historical; content Update only copies reference material.

## Audience tags

Documentation now labels material as **AI-READ**, **HUMAN-ONLY**, or **FORGE-DEVELOPMENT-ONLY**. AI reads shared rules, skips human walkthroughs and history, and includes Forge implementation details only when developing Forge itself. Making a game with Forge stays in GameUse mode. The manifest defines the tags and the bundled read-only section reader; no AI tool is assumed to obey tags automatically. Humans can read every section normally.

## Start Here

Begin with `AI_READ_FIRST.md`, then `GeurtsTechniqueManifest.md`. Do not start implementation from this README.

The manifest is the single resolver for package-file selection, versions, subject ownership, applicability, post-entry order, and cross-document conflicts. It selects every required technique from one validated source checkout or project-local fetched copy. When it selects the GDD Technique, that technique uses the project-authored `Docs/GameDesign/GameDesignManifest.md` to identify relevant design facts.

## Unity Target

Develop, test and build **on Windows for Windows, using Unity and Codex**, with **CRLF** line endings in authored text. The [Windows workflow](GeurtsTechniques/GeurtsTechnicalTechnique.md#windows-development-and-build-workflow) defines build validation and file-preservation boundaries. This repository's `.gitattributes` enforces CRLF in text checkouts; normalized Git/archive content and exact managed copies retain their own representation. The comprehensive approved `.gitignore` remains intact, including defensive exclusions for other tools and platforms.

Use **Unity 6.6 (6000.6.3f1) or newer**. The [Unity Technique](GeurtsTechniques/GeurtsUnityTechnique.md#unity-600063f1-compatibility-baseline) owns the minimum, dependency selection, language/API limits, migration and validation. Preserve a newer existing Editor; validate reusable code at the minimum and affected behavior in the selected newer Editor. Eligibility does not certify an untested dependency graph.

God and its Commandments service retain required separately licensed Odin Inspector and Quantum Console assemblies. The passive adapter has no vendor references; the source repository contains no commercial assets.

**FMOD is completely optional**. Audio uses Unity clips by default and isolates any explicitly selected FMOD backend. Follow the [Audio standard](GeurtsTechniques/GeurtsAudioTechnique.md) and the catalogue-selected owner's validation records for SDK and lifetime limits; do not patch licensed source or infer full acceptance from package readiness.

This repository contains documentation, C# fragments, and host-side PowerShell utilities. It contains no Unity project or companion implementation. Its checks validate the documentation package and tools; actual Unity compilation and player compatibility must be verified in the consuming project. The package is v0.47.0; the Technical Technique is v0.17.0.

## Path Length for Codex Projects and GameForge

Keep full absolute file and folder paths **below 260 characters (259 maximum)** in both Codex projects and Geurts Game Forge. Use short project roots and shallow folders, with room for dependency, cache, temporary and generated paths. Check those foreseeable destinations before creating or moving content. If a path reaches the limit, report the exact path and length and choose a shorter location for new work; never silently rename or move existing user content. Follow the [Technical requirement](GeurtsTechniques/GeurtsTechnicalTechnique.md#absolute-path-length-and-workspace-roots), [Codex preflight](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#codex-project-and-gameforge-path-preflight) and [folder guidance](GeurtsTechniques/GeurtsFolderStructureTechnique.md#short-roots-and-path-length-headroom).

## Asset and Scene Object Naming

The manifest-selected [Naming Technique](GeurtsTechniques/GeurtsNamingTechnique.md) defines `TYPE_Category_Description` for first-party assets and scene GameObjects, with 18 scene roles and 58 project asset kinds. Prefab filenames follow their authored root names; script filenames and associated classes use CapitalCamelCase. Read the technique for role classification, variants, the restrained `MISC` fallback and fixed-name exceptions. Folder names, code symbols and machine-readable IDs retain their own selected rules.

Apply the policy to new applicable content and explicitly authorized naming work. Publishing this documentation does not rename existing assets or objects, change GUIDs, install an enforcement tool or update a consumer.

## ID Naming

All freely authored ID names use **lowercase words separated by underscores**, including UI Foundations element IDs: `Main Menu Button` becomes `main_menu_button`, never `main-menu-button`. The [Technical Technique's ID standard](GeurtsTechniques/GeurtsTechnicalTechnique.md#id-names) defines validation, identity boundaries and safe migrations of existing IDs.

## Bootstrap Scene Persistence

Use bootstrap scenes for persistent runtime objects; first-party game code and Geurts bricks must not use `DontDestroyOnLoad`. Keep `SCN_BigBang` loaded while content scenes load additively and unload separately. The [Technical Technique's bootstrap lifetime rules](GeurtsTechniques/GeurtsTechnicalTechnique.md#bootstrap-scenes-and-runtime-persistence) cover service ownership, initialization, teardown, vendor compatibility, and validation. This documentation policy does not itself migrate installed packages or project scenes.

## Unity CLI and Editor validation

Use the [combined Unity CLI and Editor workflow](GeurtsTechniques/GeurtsTechnicalTechnique.md#combined-unity-cli-and-editor-workflow): prefer background CLI runs for repeatable imports, compilation checks, automated tests, builds and scripted validation; use Editor/player inspection for the visual, interaction and gameplay evidence that requires it. Preserve the open Unity session through isolated validation when needed, retain logs and test results, and report unavailable checks. Interactive testing on the user's computer follows the Automation Technique's explicit-authorization rule. CLI improves repeatability; any claimed time saving must be measured.

## Mandatory Forge Editor theme

The [Editor UI Theme Technique](GeurtsTechniques/GeurtsEditorUIThemeTechnique.md) makes the dark sci-fi theme with green accents mandatory for every existing and future Forge brick's Editor UI. It covers Game Forge God, Build Forge, Diagnostics, God-owned Commandments, settings and custom inspector presentation. Shared surfaces, typography, spacing, focus states and readable status messages keep the interface consistent; warnings stay yellow, errors stay red, and disabled actions explain the reason and next step.

God owns the shared `ForgeEditorTheme` API and USS. Dependent bricks reuse them; God's Commandments view uses the canonical implementation directly. New custom Editor UI retains the UI Toolkit standard and existing Odin configuration remains supported. Runtime and project-authored game UI are outside this Editor-only theme. Source validators check the documented standard and its routes; actual visual review and behavior checks remain required before publication.

## Source and Ownership Boundary

This repository is the sole generic Commandments authority. God consumes a detached archive; it does not own or bundle this content. Later compatible content releases do not require a God release. Local files remain readable without any Unity package.

The relevant locations have different owners:

| Location | Meaning and owner |
|---|---|
| `Geurtsy/GeurtsGameForge_Commandments` | Authoritative source for all Geurts Game Forge documentation. |
| `<ProjectRoot>/GeurtsGameForgeCommandments/` | Detached, archive-sourced project-local snapshot managed as logically read-only content. A confirmed God Commandments Update replaces it completely. |
| `Geurtsy/com.geurts.gameforge.god` | Owns the Commandments Editor implementation and its package-specific integration and migration guidance. No generic content authority moves into God. |
| `Geurtsy/com.geurts.gameforge.commandments` | Owns only the passive compatibility adapter for existing installations. The retained UPM identity is `com.geurts.gameforge.documentation`; it has no updater or menu registrations. |
| The three project AI-route targets declared in `GeurtsCommandmentsCompanionContract.json` | Whole files managed by God's Commandments service. One confirmation explicitly authorizes replacement from the three documentation-owned templates. |
| `<ProjectRoot>/Docs/GameDesign/` | Project-authored game-design authority. The companion must not inspect or change it. |
| Game Forge Intelligence | A separate optional product with a frozen v2 compatibility technique. Its historical documentation updater is superseded and it is not required by the companion. |

The project-local fetched copy contains the complete supported Git-tracked source tree from one selected `main` commit:

```text
<ProjectRoot>/GeurtsGameForgeCommandments/
|-- .gitattributes
|-- .github/workflows/
|-- AI_READ_FIRST.md
|-- CONTRIBUTING.md
|-- GeurtsTechniqueManifest.md
|-- GeurtsTechniques/
|-- History/
|-- Ideas/
|-- Migrations/
|-- README.md
`-- Tools/
```

Those are the current tracked top-level entries, not an installation allowlist. The selected Git tree defines the complete content set. The managed copy contains no `.git` metadata or continuing repository, worktree, branch, remote, or synchronization connection. Logical read-only status is an ownership rule rather than a Windows file-attribute requirement: local edits are unsupported and the next confirmed Update discards them without drift inspection or preservation.

## God-owned Commandments tools

God 0.29.0 includes the Windows Editor service; install it from its immutable release after importing licensed prerequisites. Use **Tools > Geurts Game Forge > Commandments** or **View Commandments** in God. Local reading, status and window restoration are offline. Explicit checks and confirmed updates share one controller. The public Editor API supports custom tools and future Angels integrations; BigBang retains its independent menu handoff.

Existing Companion users update to the passive adapter selected by the current catalogue, retaining the old package/assembly/API identities. Either update order is supported without competing content owners. Migrate custom Editor assembly references before removing the adapter. See [migration instructions](Migrations/v0.41.0.md). Package migration never overwrites custom code, guides or project content.

The retained Companion Technique/contract filenames describe the same schema-3 content lifecycle now owned by God. In the following compatibility description, companion means that God-owned service.

The UI exposes one action labelled `Update Geurts Game Forge Commandments`. Selecting it immediately shows one confirmation dialog, with Cancel as the initially focused default. There is no earlier preview or dry run and no second confirmation. Cancelling or dismissing the dialog causes no network or filesystem change from the Update action.

The confirmation lists all four destructive targets: the complete `GeurtsGameForgeCommandments/` folder and these three whole files:

```text
.github/copilot-instructions.md
.github/instructions/geurts-unity.instructions.md
.github/instructions/geurts-game-design.instructions.md
```

It states that every local change in those four targets will be overwritten and lost, there is no backup or rollback, and `Docs/GameDesign/` plus every unlisted project path will not be accessed or changed. Approval applies only to that closed set; the companion does not scan for other AI configuration.

After confirmation, the companion resolves the exact current `main` head commit, downloads an archive pinned to that commit outside the Unity project, and performs the basic validation required by `GeurtsTechniques/GeurtsCommandmentsCompanionContract.json`. Only a complete valid candidate may proceed. It then replaces the complete documentation destination and writes each AI route from its exact mapped source template in that same archive. It may create only `.github/` and `.github/instructions/` when needed as parents for the listed routes. It never runs a repository or project script.

Update succeeds only when the complete documentation folder and all three route files are present and complete. The per-project comparison commit is then written on a best-effort basis; a storage failure produces a warning and may make the same Update appear available again, but it does not undo or reclassify the successful four-target replacement. A managed-target failure may leave a partial result and must be reported plainly; the user may retry only through another explicit Update and the same confirmation. There is no preview, dry run, backup, rollback, journal, recovery, migration, drift-preservation, or setup-plan engine.

All three route files tell agents to read `GeurtsGameForgeCommandments/AI_READ_FIRST.md` before any Geurts Game Forge project work and to treat the installed, manifest-selected documentation as the source of truth for that work. They help only AI tools that support those native instruction surfaces or have been explicitly told to read and follow `AI_READ_FIRST.md`; neither the documentation nor the companion can force every AI product to discover or obey them automatically.

The manifest-selected `GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md` owns this lifecycle, and `GeurtsTechniques/GeurtsCommandmentsCompanionContract.json` owns its exact machine-readable source, destination, validation entries, confirmation targets, and route mappings. The implementation lives only in God's owning package repository; the Companion repository retains the passive compatibility adapter.

## Package Map

- `AI_READ_FIRST.md` - first-entry local-copy and session boundary; routes to the manifest.
- `GeurtsTechniqueManifest.md` - package registry and sole resolver.
- `GeurtsTechniques/GeurtsTechnicalTechnique.md` - technical implementation and the package's sole technical-priority owner.
- `GeurtsTechniques/GeurtsEditorUIThemeTechnique.md` - mandatory dark sci-fi and green-accent presentation for every existing and future Forge Editor UI, shared implementation and visual conformance.
- `GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md` - generic AI-assisted automation behaviour.
- `GeurtsTechniques/GeurtsFolderStructureTechnique.md` and `GeurtsTechniques/GeurtsFolderStructureDefinition.json` - folder meaning and exact creation registry.
- `GeurtsTechniques/GeurtsAIAgentSetupTechnique.md` - exact companion AI routes and whole-file replacement exception, plus separate preservation-based manual tooling.
- `GeurtsTechniques/GeurtsGameDesignDocumentationTechnique.md` - GDD discovery, maintenance, and companion no-access boundary.
- `GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md` and `GeurtsTechniques/GeurtsCommandmentsCompanionContract.json` - God-owned Windows Editor content lifecycle, passive adapter transition and the unchanged closed machine-readable contract.
- `GeurtsTechniques/GeurtsGameForgeIntelligenceTechnique.md` - frozen compatibility contract for released v2 consumers; not a current documentation updater.
- `GeurtsTechniques/GeurtsGitIgnoreTechnique.md` - approved, hash-validated project-root `.gitignore` payload.
- `GeurtsTechniques/GeurtsAIResponseControlTechnique_V1.1.md` - chat-only response behaviour, never a coding standard.

The former `GeurtsGameForgeIntelligenceIntegrationContract.md` is only a non-normative compatibility redirect for a released consumer. The manifest may select the renamed technique only for that bounded compatibility work; neither file owns current documentation setup or Update.

## Reusable Game Folder Template

The registered Folder Structure Technique and Definition provide a genre-independent 76-folder project profile. They keep required scene paths, use general data and prefab categories, and separate imported assets from editable originals, tests, configuration, and host tooling. Read [the folder guide](GeurtsTechniques/GeurtsFolderStructureTechnique.md#use-existing-folders-and-add-new-ones) before adding content: reuse existing owners and create game-specific children only when needed.

Update the whole documentation snapshot, then use Angels' **Create project folders**. Existing project directories and assets are preserved; the revised template does not migrate older layouts or install optional features.

## Legacy Manual Utilities (Not Companion Setup)

Package scripts remain available under `GeurtsGameForgeCommandments/Tools/` for legacy or separately authorized generic maintenance. They are not a supported alternative for provisioning or updating companion-managed documentation or AI routes in a companion project. Such a project installs God through Unity Package Manager and uses its confirmed in-Editor Commandments Update for those four targets. The scripts are inert documentation-package content, are not duplicated into project-root `Tools/`, and are not part of companion installation, setup, or Update. The companion must not scan for or execute `.bat`, `.cmd`, `.ps1`, or any other script. Always pass the Unity project root explicitly when deliberately invoking a project-mutating legacy utility outside that lifecycle.

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "<ProjectRoot>/GeurtsGameForgeCommandments/Tools/ManageGeurtsAgentInstructions.ps1" -ProjectRoot "<ProjectRoot>"
powershell -NoProfile -ExecutionPolicy Bypass -File "<ProjectRoot>/GeurtsGameForgeCommandments/Tools/CreateGeurtsFolderStructure.ps1" -ProjectRoot "<ProjectRoot>"
powershell -NoProfile -ExecutionPolicy Bypass -File "<ProjectRoot>/GeurtsGameForgeCommandments/Tools/UpdateGameDesignManifest.ps1" -ProjectRoot "<ProjectRoot>"
```

PowerShell 7 may use `pwsh` with the same paths and arguments. Retained batch files are legacy compatibility launchers for separately chosen manual operations; they are not external installers or bootstraps.

These utilities run independently from the companion and from Game Forge Intelligence. `Update Geurts Game Forge Commandments` does not invoke them. The legacy manager preserves supported managed regions; unlike the companion's confirmed whole-file route replacement, it does not silently replace arbitrary user content. It does not implicitly create or update `Docs/GameDesign/`. GDD scaffolding and GDD manifest maintenance remain separate positive manual opt-ins outside the companion lifecycle:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "<ProjectRoot>/GeurtsGameForgeCommandments/Tools/ManageGeurtsAgentInstructions.ps1" -ProjectRoot "<ProjectRoot>" -IncludeGameDesignScaffolding
powershell -NoProfile -ExecutionPolicy Bypass -File "<ProjectRoot>/GeurtsGameForgeCommandments/Tools/ManageGeurtsAgentInstructions.ps1" -ProjectRoot "<ProjectRoot>" -UpdateGameDesignManifest
```

Each manual tool's permissions and preservation boundary are owned by its manifest-selected subject technique. Generic tools must not invent project design facts, overwrite project-authored GDD, automatically delete project folders, or alter a differing project-root `.gitignore`. The separately authorized GDD maintainer may update only its bounded managed manifest index. These manual rules do not reduce the companion's separately confirmed authority to replace its three exact whole-file routes.

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

## Supporting Documents

- `Migrations/v0.11.0.md` - non-normative transition guide for the independent companion and closed whole-file AI-route contract.
- `Migrations/v0.9.0.md`, `Migrations/v0.8.0.md`, and `Migrations/v0.7.0.md` - superseded historical notes; they do not define an executable current workflow.
- `Ideas/GameForgeIntelligenceIdeas.md` - non-normative historical product pointer.
- [GeurtsGameForgeGitFlow milestones](Ideas/GeurtsGameForgeGitFlowPlan.md) - read-only Editor viewer published; submission, publishing and recovery remain planned. Native presentation limits and manual adoption are explicit.

## Codex guide installation

Angels owns **Install Codex guide**; God navigates to it and compatibility APIs forward to the same owner. Follow the [AGENTS.md Technique](GeurtsTechniques/GeurtsAgentTechnique.md) for an explicitly selected existing folder, including the project root, and the separate cancel-default replacement confirmation. Content/package updates never install or rewrite guides.

## Changelog

### 0.62.17 — 19 October 2026

- Publish the first [GitFlow source milestone](https://github.com/Geurtsy/com.geurts.gameforge.gitflow/releases/tag/v0.1.1) in the authoritative catalogue: one read-only queue/processor/lease/receipt service, public API and no-code Editor view using God. Explicit bounded refresh preserves dated observations and actionable unknown/failure states.
- Unity 6000.6.3f1: eight owning disposable-Git/Editor acceptance fixtures passed, zero failed/skipped; exact source, receipts and report hashes are pinned in owning evidence. Native rendered layout, docking, skins/scaling and transient window visibility remain unverified; observed PID presence never certifies ownership. No publisher, submission, retry, configuration write or recovery capability is released.
- Consumer installation stays manual. No live Unity consumer, Dreadvault processor/runner, other brick pin, schema or frozen payload is changed. The GitFlow plan now distinguishes implemented inspection from later planned milestones.

### 0.62.14 — 19 October 2026

- Automation Technique 0.12.0 extends the existing [shared integration owner](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#shared-integration-queue) with portable source-bound evidence, safe bounded repair/whitespace, native merged compatibility identities and committed-runner upgrades/recovery. Preserve project-owned strict/advisory acceptance, original IDs/receipts/versions, required gates, non-force fencing and actual pulls.
- Require complete native raw-input/order proofs after restoration, versioning, gameplay and final commit; silence from startup; hidden non-interactive children; compatible time budgets and inspection that cannot corrupt a concurrent pull's fetch state. Missing evidence and genuine ownership/access/native failures remain actionable.
- Add the small [GeurtsGameForgeGitFlow plan](Ideas/GeurtsGameForgeGitFlowPlan.md), explicitly PLANNED with shared Editor/API controller milestones. Documentation only: no brick implementation, package pin, installed consumer, game processor, frozen payload, schema or offline installer is changed.


### 0.62.13 — 18 October 2026

- Automation Technique 0.11.9 requires [renewable leases and automatic abandoned-owner recovery](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#automated-publisher-leases-and-recovery) for automated cross-machine game publishers, including future games and StandardsOnly projects; manual named-integrator pull-request queues remain valid.
- Require persistent fast-forward ownership history, monotonic expiry observations, heartbeats during long checks, atomic fencing of code/results/checkpoints, exact control-ref verification and confirmed-stopped legacy migration. Preserve existing roots/settings during explicit runner upgrades and keep real access, dirty-work, validation and pull failures visible.
- Documentation-only requirements; no game implementation, installed consumer, brick pin, schema, frozen payload or offline installer is changed. Each adopting game must implement and validate its own compatible policy; one healthy configured processor is still needed.

### 0.62.12 — 17 October 2026

- Automation Technique 0.11.8 requires background game automation and every subprocess to preserve desktop input and focus, including future games and StandardsOnly projects.
- Require launch-time console suppression, non-interactive authentication, supported GUI/headless isolation and detached-parent validation. Document Windows flag incompatibilities; retain explicit blockers and unverified helper paths instead of opening prompts or taking over the desktop.
- Documentation-only guidance; no installed consumer copy, launcher, dependency, frozen payload or schema is changed.
### 0.62.11 — 17 October 2026

- For games using Commandments as technical documentation, worker chats submit once and end their turn with a pending queue ID; one background processor owns versioning, validation, main publication and post-push pulls.
- Prohibit worker polling, competing processors, automatic requeues and replacement-checkout loops. Require processor preflight, exclusive ownership, retained failure evidence and one actionable alert before explicit recovery.
- Keep queued work distinct from verified delivery and later task handoff; preserve Forge package/documentation contribution workflows and manual consumer updates.

### 0.62.10 — 17 October 2026

- For games we work on using Commandments as their technical documentation, require one shared contributor integration queue per game repository, with isolated task work and serialized final version assignment, validation and publication to main.
- Reuse valid evidence and avoid repeated worker rebases for unrelated changes; require post-publication pulls and verified completion records.
- Preserve Forge package and Commandments source contribution workflows; install no queue tools, change no GitHub enforcement and update no consumer copies.

### 0.62.9 — 16 October 2026

- Require Git as the only source-control system for first-party games, packages, tools, documentation and authored assets; Git clients and Git LFS remain Git workflows.
- Block alternative/parallel VCS use while preserving explicit initialization/migration scope, detached snapshots, offline installers and frozen ignore payloads.

### 0.62.8 — 16 October 2026

- Prohibit writing, expanding or running unit tests unless absolutely necessary; prefer adequate lower-cost evidence to reduce AI tool compute.
- Require a concrete necessity reason and the smallest useful test/subset for exceptions; retain required publication gates.

### 0.62.7 — 16 October 2026

- Limit new tests to distinct behaviours and credible regression risks; reuse existing coverage and valid evidence instead of repeating unchanged successful checks.
- Require efficient AI tool use through scoped reads, batched independent operations, concise output and bounded polling, while retaining required validation and publication gates.

### 0.62.6 — 16 October 2026

- Make ScriptableObjects the default for reusable authored definitions, configuration, actions and event channels.
- Prefer typed Editor-assigned object references over string IDs and lookups, with explicit boundary exceptions, validation and state ownership.

### 0.62.5 — 16 October 2026

- Place code-security hardening last in the technical priority order, below every other Core Principle.
- Preserve required authorization, secret handling, validation, server authority and the multiplayer latency-first, bandwidth-second override.

### 0.62.4 — 16 October 2026

- Make multiplayer latency the highest code priority, followed by bandwidth efficiency before the normal code priorities.
- Keep batching, update frequency and measured network trade-offs subordinate to latency; retain the existing FPS preference within Efficiency.

### 0.62.3 — 16 October 2026

- Require meaningful XML summaries for every first-party C# class and short XML summaries for every method, regardless of accessibility.
- Require implementation comments explaining complex routines and logic; retain concise comments, partial-class ownership and vendor/generated preservation.
- Prioritise FPS and frame-rate stability over RAM usage, storage footprint and loading time within Efficiency.

### 0.62.2 — 15 October 2026

- Makes delivery to remote `main` explicit for every package source repository and Commandments itself, independently for each owner changed by a task.
- Clarifies the source-contribution route without changing brick pins, schemas, frozen installer payloads or consumer installation.

### 0.62.1 — 15 October 2026

- Adds Windows CI, an offline publication-version gate and isolated release regressions. New approved infrastructure remains inert in copied documentation.
- Corrects current Unity/Steam guidance, separates draft maturity from publication, and adds concise contributor and unchanged-licence guidance.
- Moves older release evidence to [History/Changelog.md](History/Changelog.md). Brick pins, schemas, frozen payloads and the offline installer are unchanged.

<!-- GEURTS-SECTION:BEGIN FORGE-DEVELOPMENT-ONLY -->
## Maintenance

Follow [CONTRIBUTING.md](CONTRIBUTING.md) for the source checklist and publication gate.

When a package file changes, update the manifest registry and affected migrations, schemas, tests, and validator expectations in the same change. Keep native AI entries concise and preserve semantic versions. Human-facing metadata uses `Required package path` or `Required project path`; the JSON `canonicalPath` key remains only as a legacy serialized compatibility field where schema consumers require it.
<!-- GEURTS-SECTION:END -->

<!-- GEURTS-SECTION:BEGIN FORGE-DEVELOPMENT-ONLY -->
God 0.19.0 opening options were validated with 86 passing focused Unity Editor tests and native checkbox interaction in floating, narrow and docked windows. Documentation 0.27.0 passes its full 221-test automation suite. Light host skin and high display scaling were unavailable; see God's package-specific validation report for limits. Publication does not install the new package into a running project.
<!-- GEURTS-SECTION:END -->

God 0.23.0 adds **Apply Forge layout** at the top of its window. **Apply layout when God opens** defaults on and is saved for the project. Turn it off to retain your arrangement on menu openings; you can still apply the layout with the button. Active operations block layout changes until idle. Restored startup windows and script reloads keep the current arrangement.

## Commandments migration

Read [the complete rename and compatibility map](Migrations/v0.40.0.md) before updating an existing installation. Update Companion and God first, then explicitly acquire Commandments and review user-owned Codex guides. The old content folder is preserved.
