<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Folder Structure Technique

**Unity Project Structure - AI-First Automation and Human Developer Reference**
**Version:** 0.15.0
**Status:** Draft normative technique
**Primary audience:** AI coding agents and automated development systems
**Secondary audience:** Human developers
**Required package path:** `GeurtsTechniques/GeurtsFolderStructureTechnique.md`

> `GeurtsTechniqueManifest.md` selects this file and version from one validated package commit. This technique defines folder meaning and placement only.

---

## Purpose

This document defines a stable, scalable Unity project structure for Geurts Game Forge. Its language is intentionally literal and deterministic so automated systems can make consistent placement decisions without sacrificing human readability.

The structure is optimised for:

- AI readability.
- Automation.
- Long-term team consistency.
- Fast asset discovery.
- Safe refactoring.
- Clear separation between first-party, third-party, generated, and external content.

This Markdown document is the **explanatory authority** for folder meaning, placement, and constraints. `GeurtsTechniques/GeurtsFolderStructureDefinition.json` is the **automation authority** for the literal managed-folder registry and folder creation. Neither authority may contradict the other.

The manifest resolves cross-document selection, applicability, and conflicts. This document and the JSON definition do not establish an alternate document order.

If the Markdown and JSON disagree, validation must fail. An agent or tool must not guess which path to create.

---

## Design Goals

- Minimise ambiguity.
- Keep each folder's purpose singular and obvious.
- Separate source, generated, and external content.
- Support solo development and team scaling.
- Make assets easy to locate, validate, and refactor.
- Use the same ownership and asset-type roots for every game, without assuming combat, inventory, characters, or progression.
- Add game-domain children only when real content needs them; an empty template is not a list of features to implement.

---

## Automation

The full project-structure profile is generated from:

```text
GeurtsTechniques/GeurtsFolderStructureDefinition.json
```

using:

```text
Tools/CreateGeurtsFolderStructure.ps1
```

`Tools/CreateGeurtsFolderStructure.bat` is retained only as a compatibility launcher for a separately invoked manual folder operation. It must delegate folder selection to the PowerShell tool and must not contain an independent complete path list. It is not an external installer or bootstrap for the Commandments Companion.

The definition has three creation profiles:

| Profile | Owner | Exact scope |
|---|---|---|
| `full-project-structure` | `folder-structure-tool` | The 76 reusable project-structure paths declared by definition v0.12.0. |
| `native-entry` | `native-entry-manager` | `.github` and `.github/instructions` only. |
| `gdd-scaffolding` | `native-entry-manager` | `Docs` and `Docs/GameDesign` only, as an explicit delegation from their primary folder-structure owner. |

An automation tool may create a registry entry only when all of these conditions are true:

1. The entry's `automation.mayCreate` value is `true`.
2. The requested creation profile appears in `automation.creationProfiles`.
3. The calling tool is the declared `automation.owner`, or the entry's `automation.delegatedOwners` object explicitly authorizes that profile's owner.
4. Every declared parent is already present or is created first from the same authorized profile.

Every definition v0.12.0 entry has `automation.mayRemove` set to `false`. No folder may be automatically deleted merely because it is absent from a later definition. Missing folders may be created; existing folders and their contents must be preserved.

`required` means the folder is part of the applicable Geurts project or integration baseline. `optional` means content may not need the folder, although the full creation profile may still create the empty organizational path. Requirement status never grants deletion authority.

All definition paths are relative to `<ProjectRoot>`, use `/` as their required separator, preserve declared letter case, contain no `.` or `..` segments, and have no leading or trailing slash.

The folder tool must report created, existing, skipped, invalid, and conflicted paths. Re-running it with the same definition and project state must be idempotent.

The Unity project root itself must not be a junction, symbolic link, or other reparse point. Immediately before accepting an existing managed directory or creating a missing one, the tool must re-resolve containment below the validated project root and recheck the complete path chain for newly introduced reparse points; a failed recheck is a conflict and must not create a descendant outside the project.

In a Unity project with a project-local fetched documentation copy, invoke the copied folder tool with the Unity root explicitly:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "<ProjectRoot>/GeurtsGameForgeCommandments/Tools/CreateGeurtsFolderStructure.ps1" -ProjectRoot "<ProjectRoot>"
```

From a documentation source checkout, the distinct maintainer invocation is:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ".\Tools\CreateGeurtsFolderStructure.ps1" -ProjectRoot "<ProjectRoot>"
```

The tool prefers the project-local fetched definition when one exists. Update the complete managed documentation snapshot before using a newer tool; do not mix a newer script with an older definition. A maintainer testing a complete source package against an isolated project may deliberately pass `-DefinitionPath` for that source package. Without that override, the source-checkout path uses the script-adjacent definition only after checking for a project-local fetched definition. It never discovers an unselected `<ProjectRoot>/GeurtsTechniques/` definition implicitly; a deliberate alternative requires an explicit `-DefinitionPath`.

The retained compatibility launcher at `GeurtsGameForgeCommandments/Tools/CreateGeurtsFolderStructure.bat` likewise requires `-ProjectRoot <UnityProjectRoot>` as its first argument when a user deliberately invokes that manual operation. Documentation acquisition and replacement are outside the folder-definition contract, and optional manual native-entry setup is a separate AI Agent Setup responsibility. No copied tool may infer the Unity root from its documentation-container parent.

The independent Editor-only Commandments Companion never invokes either folder tool. Installing it through Unity Package Manager is the only companion installation route. Its confirmed Update may create only `.github/` and `.github/instructions/` when a missing parent is required for one of the contract's exact AI-route targets; it does not run a general setup or folder-structure plan.

---

## Root Structure

```text
ProjectRoot/
├── Assets/
├── Packages/
├── ProjectSettings/
├── UserSettings/
├── Docs/
├── GeurtsGameForgeCommandments/
├── Builds/
├── Tools/
├── SourceAssets/
└── External/
```

---

## Supporting and Placement-Only Folders

These paths are documented here but are not members of the `full-project-structure` creation profile:

```text
ProjectRoot/
├── .github/
│   └── instructions/
└── GeurtsGameForgeCommandments/
```

- `.github/` and `.github/instructions/` may be created by the optional manual native-entry manager or by the Commandments Companion only as missing parents for its exact contract-listed AI routes. They also may hold unrelated GitHub-native repository configuration. The folder-structure tool must not create them as part of the 76-path project profile.
- `GeurtsGameForgeCommandments/` is the placement boundary for a detached project-local snapshot managed as logically read-only content, not a machine-readable managed folder. The folder-structure tool has no creation, replacement, or lifecycle authority for it. The manifest-selected Commandments Companion Technique and Contract own their explicit confirmed Update boundary.
- Directories below `GeurtsGameForgeCommandments/` are deliberately absent from the folder definition, so a new tracked source directory does not require a folder-schema change.
- The native-entry manager may create its assigned `.github` paths but may never delete existing directories or user content through the folder-definition contract. A confirmed companion Update separately authorizes whole-file replacement of only its three contract-listed AI routes; every unlisted path inside `.github/` remains uninspected and untouched.
- `Docs/` and `Docs/GameDesign/` remain members of the full project profile and additionally delegate the closed `gdd-scaffolding` profile to the native-entry manager, so missing GDD scaffolding can be created without granting that manager access to unrelated folders.

### Explicit Game Design Document import

As a separate narrow operation, a user-selected Build Forge **Import selected documents** or legacy **Import primary Game Design Document** action may create only missing `Docs/` and `Docs/GameDesign/` parents for its explicitly selected Markdown documents and project manifest. This exception is owned by the Game Design Documentation Technique and does not invoke a generic folder-creation profile, expand the native-entry manager, or grant the Commandments Companion any project-design access. Preserve every existing directory and every file outside the explicitly confirmed import targets. Only the Game Design Documentation Technique's manual overwrite warning can authorize replacing selected document files. Validate containment and the complete path chain for reparse points before accepting or creating either parent. Build Forge owns its setup checklist and completion criteria; this folder permission does not define them.

---

## Non-Unity Root Folders

### Docs/

Project documentation.

Examples:

- Project-specific design docs.
- Naming conventions.
- Onboarding notes.
- Game design documentation under `Docs/GameDesign/`.

Geurts source implementation techniques do not belong here. They are copied into `GeurtsGameForgeCommandments/` as package content.

### GeurtsGameForgeCommandments/

Top-level placement for the detached, archive-sourced project-local snapshot of authoritative Geurts Game Forge documentation fetched from `Geurtsy/GeurtsGameForge_Commandments`.

Rules:

- Treat this directory as logically read-only managed reference content. This is an ownership rule, not a requirement to set Windows read-only attributes. A confirmed companion Update discards and replaces its complete contents without inspecting or preserving local drift.
- The folder-definition tool must not create, populate, update, replace, or remove it.
- The manifest-selected Commandments Companion Technique and Contract own the companion's explicit fetch-and-replace operation. Normal Unity launch/open performs no remote metadata check or catalogue refresh; AI/session initialization receives no lifecycle authority from this folder technique.
- This path is outside the companion's UPM package. The package's own `Documentation~` may contain only companion-specific documentation and is not a Geurts source. The companion is independent of Geurts Game Forge God and Game Forge Intelligence, with no God or other Unity Package Manager package dependency. Its separately installed licensed Odin Inspector and Quantum Console assemblies remain required.
- Do not store project-specific GDD files here.
- Keep project-specific game design documentation under `Docs/GameDesign/`.
- Do not substitute a hidden, nested, or `Assets/` path for this required top-level placement.

### Builds/

Generated playable builds only.

Rules:

- Do not store source assets here.
- This folder should be safe to delete and regenerate.

### Tools/

Host-side project tooling, outside Unity's imported assets.

```text
Tools/
├── Build/
└── Validation/
```

Use `Build/` for build and packaging scripts and `Validation/` for project checks. Other stable tool responsibilities may receive named children when needed. Unity Editor C# tools belong in `Assets/_Project/Scripts/Editor/`; runtime-safe C# helpers belong in `Assets/_Project/Scripts/Tools/`. Installed documentation utilities remain inside their managed documentation snapshot.

### SourceAssets/

Tracked, first-party editable originals that Unity does not need to import: DCC project files, layered art, audio sessions, raw recordings, and export inputs.

```text
SourceAssets/
├── Art/
└── Audio/
```

Export game-ready assets to the appropriate `Assets/_Project/` owner. Keep a clear source-to-export relationship; exported runtime assets and their editable originals serve different purposes. Do not put generated playable builds here. Optional FMOD authoring material may use a purposeful child under `SourceAssets/Audio/` when adopted; folder creation does not require FMOD.

The definition's `unity-project` category identifies first-party project ownership, including these source files. It does not imply AssetDatabase import: `SourceAssets/` stays outside Unity's imported game-asset pipeline. Game content under `Assets/` and resolved Unity Package Manager assets retain their respective owners.

### External/

Third-party vendor drops and reference material awaiting review or integration. This is a quarantine area outside Unity's import pipeline. First-party editable art and audio belong in `SourceAssets/`, rather than being mixed with vendor material. Keep vendor provenance and licence information with the drop.

---

## Unity Assets Structure

```text
Assets/
├── _Project/
├── _ThirdParty/
├── _Addressables/
├── _Generated/
└── Gizmos/
```

---

## Assets Folder Rules

### Assets/_Project/

All first-party Unity-imported production content belongs here. Editable originals outside the import pipeline belong in `SourceAssets/`.

This is the main source of truth for Geurts-authored Unity assets.

### Assets/_ThirdParty/

Imported plugins, packages, and external Unity assets.

Rules:

- Never mix studio code with vendor code.
- Preserve vendor-required installation paths. Some plugins require `Assets/Plugins/` or another vendor-specific root; do not relocate them solely to fit this template. Unity Package Manager packages remain under their package ownership.
- Use `_ThirdParty/` for vendor content whose supported installation allows that location.
- Do not directly modify vendor code unless necessary and documented.

### Assets/_Addressables/

Optional grouping layer for addressable content if used.

Rules:

- Store grouping and configuration metadata here when the chosen Addressables workflow uses it.
- Keep each source asset in its existing type/domain owner. Marking it addressable does not require moving or copying it here.
- Do not place unrelated production assets here only because they are loaded at runtime.

### Assets/_Generated/

Procedurally generated or tool-generated assets.

Rules:

- Rebuildable content only.
- Avoid manual edits unless explicitly allowed.
- Generated content should be safe to regenerate.

### Assets/Gizmos/

Unity editor gizmo textures and icons.

---

## Recommended _Project Structure

```text
Assets/_Project/
├── Art/
├── Audio/
├── Data/
├── Localization/
├── Materials/
├── Prefabs/
├── Scenes/
├── Scripts/
├── Settings/
├── Shaders/
├── UI/
├── VFX/
└── Testing/
```

---

## Folder Definitions

### Art/

Imported visual assets. Keep editable originals under `SourceAssets/Art/`. Use `Sprites/` for images imported as sprites and their atlases, `Textures/` for general non-sprite textures, and `2D/` for other imported two-dimensional art. A file has one owning location; do not duplicate it across these categories.

```text
Art/
├── 2D/
├── 3D/
├── Animations/
├── Sprites/
├── Textures/
└── Concept/
```

### Audio/

Imported audio clips and Unity mixer assets. Editable sessions and original recordings belong in `SourceAssets/Audio/`. Unity built-in audio is the intended default for future Audio brick updates; FMOD is completely optional. Follow the manifest-selected Technical Technique's [Game Audio and Sound Design standard](GeurtsTechnicalTechnique.md#game-audio-and-sound-design), the catalogue, and the installed Audio package documentation for the prerequisites of that release.

```text
Audio/
├── Music/
├── SFX/
├── Ambience/
├── Dialogue/
└── Mixers/
```

### Data/

Authored gameplay content, separated by responsibility rather than assumed game genre.

```text
Data/
├── Definitions/
├── Tables/
└── Tuning/
```

Use `Definitions/` for content definitions such as ScriptableObjects, `Tables/` for row-based datasets, and `Tuning/` for balance parameters. Add named domain children beneath the relevant category when needed. Project/service configuration belongs in `Settings/`. Mutable player saves and preferences belong in the owning persistence system's supported storage, normally below `Application.persistentDataPath`, rather than being written into these authored assets.

### Localization/

Optional first-party locale, string-table, and translated-content assets. Keep locale children consistent with the project's chosen localization workflow. This folder does not install a localization package or require localization in every game.

### Materials/

Shared material assets.

### Prefabs/

Reusable prefab assets.

```text
Prefabs/
├── Entities/
├── Environment/
├── Props/
├── UI/
├── Gameplay/
└── Systems/
```

Use `Entities/` for actor/entity roots such as agents, characters, or vehicles; `Gameplay/` for other reusable mechanics and gameplay objects; `Environment/` for environment assemblies; `Props/` for decorative or supporting objects; `UI/` for GameObject UI prefabs; and `Systems/` for reusable service roots. Keep a VFX-owned effect prefab with its effect in `VFX/` when that is its authoritative owner. Do not maintain duplicate copies in multiple prefab categories.

### Scenes/

Scene files only. All five subfolders below are required in every project, including a minimal project.

```text
Scenes/
├── Boot/
│   └── SCN_BigBang.unity
├── Frontend/
├── Gameplay/
├── Test/
│   └── SCN_DevPlayground.unity
└── Sandbox/
```

### Scripts/

All project-authored Unity code. Reuse installed Geurts Bricks before adding project implementations; shared brick code stays in its owning package and must not be copied into this tree.

```text
Scripts/
├── Core/
├── Gameplay/
├── AI/
├── UI/
├── Audio/
├── Networking/
├── Editor/
├── Tools/
└── Testing/
    ├── EditMode/
    └── PlayMode/
```

### Settings/

Project and service configuration assets, including input and rendering configuration. Mutable player state is not project configuration.

```text
Settings/
├── Input/
└── Rendering/
```

Use the owning service's documented location where an installed package imposes one; avoid copying settings into a second owner.

### Shaders/

Custom shaders and shader graphs.

### UI/

UI layouts, styles, fonts, icons, themes, and screen composition assets. C# presentation code belongs in `Scripts/UI/`; GameObject UI prefabs belong in `Prefabs/UI/`. Reuse existing UI-owned images and fonts rather than copying them into Art.

```text
UI/
├── Fonts/
├── Icons/
├── Layouts/
├── Themes/
└── Screens/
```

### VFX/

Particles, visual effects, flipbooks, and effect prefabs.

### Testing/

Non-code fixtures, test data, mock assets, and QA support.

```text
Testing/
└── Fixtures/
```

Test code belongs in `Scripts/Testing/EditMode/` or `Scripts/Testing/PlayMode/`. Test scene assets belong in `Scenes/Test/`; exploratory scenes belong in `Scenes/Sandbox/`. Fixtures must be referenced by their tests without becoming an accidental production dependency.

---

## Required Scene Structure

Use scene folders by function, not by chronology. `Boot/`, `Frontend/`, `Gameplay/`, `Test/` and `Sandbox/` under `Assets/_Project/Scenes/` are required folders. The project must also contain these two scene assets:

| Required scene | Required project-relative path | Purpose |
|---|---|---|
| `SCN_BigBang` | `Assets/_Project/Scenes/Boot/SCN_BigBang.unity` | Project boot and initialisation. |
| `SCN_DevPlayground` | `Assets/_Project/Scenes/Test/SCN_DevPlayground.unity` | Initial development and testing. |

The [Technical Technique's Required Project Scenes](GeurtsTechnicalTechnique.md#required-project-scenes) owns their required build indices and Build Profile scene-list rules. Requiring `Frontend/`, `Gameplay/` and `Sandbox/` does not require additional scene assets in those folders.

The JSON registry describes directories only. The existing folder tool creates missing folders and preserves existing content; it does not create `.unity` assets or configure scene lists. Scene setup must use supported Unity Editor APIs, preserve existing scene contents and references, and report missing or conflicting scenes and index assignments.

Folder purposes:

- `Boot/` - Initialisation scenes.
- `Frontend/` - Menus, shell, and meta systems.
- `Gameplay/` - Shipping game scenes.
- `Test/` - Feature validation scenes.
- `Sandbox/` - Experimental scenes.

---

## Script Structure Recommendation

Use domain-based grouping.

- `Core/` - Foundational systems.
- `Gameplay/` - Game-specific mechanics and domains.
- `AI/` - Decision logic and behaviours.
- `UI/` - Menus, HUD, and presentation logic.
- `Audio/` - Runtime audio systems.
- `Networking/` - Replicated systems and transport glue.
- `Editor/` - Editor-only tools.
- `Tools/` - Runtime-safe utilities.
- `Testing/` - Tests and test helpers, separated by Edit Mode and Play Mode assembly purpose.

---

## Use Existing Folders and Add New Ones

The template supplies stable ownership roots, not a fixed catalogue of every game's features. Use the same roots across projects, then extend them only for actual project content.

### Start from the current template

1. Update the complete managed documentation snapshot through the Commandments Companion's confirmed Update action. Do not hand-edit that snapshot or mix files from different package commits.
2. In Game Forge God's Build Forge setup, use **Create project folders** to create the selected full profile. For a separately chosen manual operation, use the copied PowerShell command above with the Unity project root explicitly supplied.
3. Inspect the folders that already exist before placing content. Counts come from the selected definition, rather than historical package examples. The full profile creates 76 project paths; it does not create scene assets, assembly definitions, content, packages, or optional features.
4. Re-running setup adds missing template directories. It preserves existing directories, assets, and `.meta` files, including old genre-specific paths no longer present in the fresh template.

### Decide where content belongs

1. Identify who owns the content: first-party Unity assets, first-party editable originals, vendor content, generated output, host tooling, or project documentation.
2. Choose the existing type folder whose documented purpose matches the artifact. Inspect its children and current project conventions before creating anything. Reuse the existing exact path, spelling, and letter case.
3. Give each file one authoritative owner. A reference from another feature does not justify a copied asset or a second `Shared/`, `Common/`, or parallel feature root.
4. Add a child only when it represents a real responsibility, a collection needing discovery, or a stable workflow. A single class or asset does not automatically need its own folder. Avoid speculative feature hierarchies and excessive depth.

For a real interaction feature, suitable children might be `Scripts/Gameplay/Interaction/`, `Data/Definitions/Interaction/`, and `Prefabs/Gameplay/Interaction/`. Create only the children that actually have content. Reuse the same domain name across artifact types for searchability; references connect them without placing code, data, and prefabs together. A genre-specific `Weapons/` or `Progression/` child is valid when the game needs it, but is no longer assumed by the universal template.

### Create folders safely

- For additional project-specific folders inside `Assets/`, use Unity's Project window or supported AssetDatabase APIs. In the Project window, select the existing parent, right-click **Create > Folder**, and enter the intended PascalCase name. Create parents first. Check `AssetDatabase.IsValidFolder` and reuse an existing directory before calling `AssetDatabase.CreateFolder`; that API can create a numbered substitute when a name already exists. Verify the returned GUID resolves to the exact intended path and treat a different path as a conflict. See [Unity's CreateFolder reference](https://docs.unity3d.com/6000.6/Documentation/ScriptReference/AssetDatabase.CreateFolder.html).
- The documented template operation is a create-only alternative for its declared registry paths; Unity imports newly created asset folders and generates their metadata during refresh. Do not use it as an asset migration tool.
- Outside `Assets/`, create only the missing directory beneath the validated project root using the host filesystem. Check for file collisions, containment, and reparse points before creation, following the automation safety rules above.
- Use PascalCase children and preserve template root spellings. Do not create case-only alternatives or accept `Interaction 1/` as a replacement for `Interaction/`.
- Adding a project-specific child does not require changing the managed JSON registry. Keep local placement decisions in ordinary project technical documentation, outside the managed snapshot. A reusable template addition belongs in the authoritative documentation source and must update the Markdown, JSON, versions, consumers, and validation together.
- Folder creation never authorizes moving, renaming, or deleting existing content. A separately authorized migration inside `Assets/` must use Unity-supported asset moves, preserve `.meta` GUIDs, and validate references. Do not replace an established project layout merely to match a renamed fresh-template category.

### Verify Unity participation

Folders organize content; assembly and build rules still need explicit configuration.

- Put Editor-only code in an Editor-only assembly. An `Editor/` child beneath a parent runtime asmdef can belong to that runtime assembly unless it has an appropriate separate Editor-only asmdef or asmref. Follow [Unity's assembly definition guidance](https://docs.unity3d.com/6000.6/Documentation/Manual/assembly-definitions-intro.html).
- `Testing/`, `EditMode/`, and `PlayMode/` names do not configure test assemblies or exclude test code from players. Configure test assemblies through the installed Unity Test Framework and verify their intended platforms and references. The template creates directories only. See [Unity's test assembly workflow](https://docs.unity3d.com/Packages/com.unity.test-framework@1.4/manual/workflow-create-test-assembly.html).
- Networking, localization, Addressables, and FMOD folders do not install or activate those optional systems. Do not add `Resources/` or `StreamingAssets/` merely as organizational folders: they have specific loading and build behaviour. Use them only when the owning system requires that behaviour. See [Unity's special folder rules](https://docs.unity3d.com/6000.6/Documentation/Manual/SpecialFolders.html).
- Check new assets import successfully, tests remain in test assemblies, Editor code stays out of Windows players, and the applicable build/scene rules still hold. Use the manifest-selected Technical and Automation techniques for validation; folder presence alone is not proof of a working feature.

---

## Timeless Rules

- Prefer function-based top-level folders over temporary feature names.
- Separate first-party content from third-party content.
- Keep scenes, prefabs, scripts, and data distinct.
- Do not bury reusable assets inside scene-specific folders unless they are truly local.
- Avoid deep nesting unless it reduces confusion.
- Every folder should answer: what belongs here, and what does not?

---

## Anti-Patterns

Do not create or rely on folders named:

- `Misc/`
- `New Folder/`
- `Temp/`

Avoid:

- Mixed folders containing scripts, prefabs, textures, and data together.
- Feature folders at the root when the project is still small and domains are clearer.
- Third-party code mixed into first-party code locations.
- Generated assets placed among manually authored production assets.

---

## Naming Guidance for Folders

- Use PascalCase for subfolders inside Unity content areas.
- Keep names short and literal.
- Prefer nouns over vague labels.
- Avoid abbreviations unless team-standard.

---

## Machine-Readable Definition Contract

The JSON `canonicalPath` property is a legacy serialized compatibility key. Preserve its exact key and required value for schema consumers, but use `Required package path` in human-facing metadata and prose.

Before creating folders, any compatible folder-creation consumer must:

1. Load `GeurtsGameForgeCommandments/GeurtsTechniques/GeurtsFolderStructureDefinition.json` from the active validated package.
2. Confirm supported `schemaVersion`, `definitionVersion`, and `packageVersion` values.
3. Confirm `managedFolderCount` is 78 and `projectStructureFolderCount` is 76 for definition v0.12.0.
4. Reject duplicate paths, absolute paths, traversal segments, backslashes, unknown content categories, missing parents, unknown profiles, or malformed automation objects.
5. Confirm every registry path appears in the literal Markdown registry below.
6. Select only the creation profile owned by the calling operation.
7. Create missing authorized folders parent-first.
8. Preserve every existing folder and file.
9. Report the exact definition version and every created, existing, skipped, invalid, or conflicted path.

A newer definition may add or reclassify paths. It must not cause a tool to delete a path that appeared in an older definition. An obsolete path is a reportable migration candidate, not deletion authorization.

### Literal Documented Path Registry

The following normalized paths must match the JSON `managedFolders[].path` set exactly. Validation compares the two literal registries; ordering is not authority.

<!-- GEURTS-FOLDER-PATHS:BEGIN -->

```text
Assets
Packages
ProjectSettings
UserSettings
Docs
Docs/GameDesign
Builds
Tools
Tools/Build
Tools/Validation
External
SourceAssets
SourceAssets/Art
SourceAssets/Audio
Assets/_Project
Assets/_ThirdParty
Assets/_Addressables
Assets/_Generated
Assets/Gizmos
Assets/_Project/Art
Assets/_Project/Art/2D
Assets/_Project/Art/3D
Assets/_Project/Art/Animations
Assets/_Project/Art/Sprites
Assets/_Project/Art/Textures
Assets/_Project/Art/Concept
Assets/_Project/Audio
Assets/_Project/Audio/Music
Assets/_Project/Audio/SFX
Assets/_Project/Audio/Ambience
Assets/_Project/Audio/Dialogue
Assets/_Project/Audio/Mixers
Assets/_Project/Localization
Assets/_Project/Data
Assets/_Project/Data/Definitions
Assets/_Project/Data/Tables
Assets/_Project/Data/Tuning
Assets/_Project/Materials
Assets/_Project/Prefabs
Assets/_Project/Prefabs/Entities
Assets/_Project/Prefabs/Environment
Assets/_Project/Prefabs/Props
Assets/_Project/Prefabs/UI
Assets/_Project/Prefabs/Gameplay
Assets/_Project/Prefabs/Systems
Assets/_Project/Scenes
Assets/_Project/Scenes/Boot
Assets/_Project/Scenes/Frontend
Assets/_Project/Scenes/Gameplay
Assets/_Project/Scenes/Test
Assets/_Project/Scenes/Sandbox
Assets/_Project/Scripts
Assets/_Project/Scripts/Core
Assets/_Project/Scripts/Gameplay
Assets/_Project/Scripts/AI
Assets/_Project/Scripts/UI
Assets/_Project/Scripts/Audio
Assets/_Project/Scripts/Networking
Assets/_Project/Scripts/Editor
Assets/_Project/Scripts/Tools
Assets/_Project/Scripts/Testing
Assets/_Project/Scripts/Testing/EditMode
Assets/_Project/Scripts/Testing/PlayMode
Assets/_Project/Settings
Assets/_Project/Settings/Input
Assets/_Project/Settings/Rendering
Assets/_Project/Shaders
Assets/_Project/UI
Assets/_Project/UI/Fonts
Assets/_Project/UI/Icons
Assets/_Project/UI/Layouts
Assets/_Project/UI/Themes
Assets/_Project/UI/Screens
Assets/_Project/VFX
Assets/_Project/Testing
Assets/_Project/Testing/Fixtures
.github
.github/instructions
```

<!-- GEURTS-FOLDER-PATHS:END -->

---

## Recommendations

1. Keep `_Project` as the single source of truth for studio-owned assets.
2. When maintaining this source repository, run the read-only source validator at `Tools/ValidateGeurtsDocumentation.ps1` whenever the Markdown technique or JSON definition changes; this is distinct from copied project-mutating tools that require explicit `-ProjectRoot`.
3. Keep every required baseline folder; add other folders when a category has multiple assets or a stable workflow need.
4. Use `Test` and `Sandbox` intentionally so experimental work does not pollute production content.
5. Use `External/` for unintegrated vendor drops, `_ThirdParty/` for supported imported vendor assets, and `SourceAssets/` for first-party editable originals.

---

## Minimal Version

If the project is very small, start with this structure while retaining every required scene folder and both required scene assets:

```text
Assets/_Project/
├── Art/
├── Audio/
├── Data/
├── Prefabs/
├── Scenes/
│   ├── Boot/
│   │   └── SCN_BigBang.unity
│   ├── Frontend/
│   ├── Gameplay/
│   ├── Test/
│   │   └── SCN_DevPlayground.unity
│   └── Sandbox/
├── Scripts/
└── UI/
```

---

## Expansion Rule

Keep the required baseline in every project. Expand beyond it when search time, onboarding friction, or asset collisions become noticeable.

The `full-project-structure` automation profile creates the complete 76-path structure. Teams may choose the minimal subset manually at the beginning of a small project; definition v0.12.0 does not define an automated minimal profile. A future profile must be versioned in both authorities and must preserve the no-deletion rule. The Commandments Companion does not select any profile.

---

## Definition of Done

A folder-definition change is complete only when:

- the Markdown and JSON versions and literal paths agree;
- every JSON parent exists in the registry;
- every content category is from the declared five-value set;
- every automation owner and creation profile is valid;
- all `automation.mayRemove` values remain `false`;
- the full project profile contains exactly the intended project-structure paths;
- fresh creation includes the revised general-purpose categories and excludes retired genre-specific template paths;
- folder creation is executed twice in a temporary project and the second run creates nothing;
- upgrading an older template preserves existing files, `.meta` identities, and timestamps;
- unsafe paths, collisions, and reparse-point changes remain rejected;
- no scene assets, assembly definitions, packages, or feature content are generated by folder creation;
- the manifest and affected integration references are updated in the same change.

## User-selected Codex guide placement

The separately invoked Install Codex guide action may create or replace AGENTS.md in an existing folder explicitly selected by the user, including a folder outside the Unity project. This does not authorize folder-tree generation. The AGENTS.md Technique owns its payload, confirmation and exact documentation entry point. The managed documentation tree and Docs/GameDesign remain excluded.
