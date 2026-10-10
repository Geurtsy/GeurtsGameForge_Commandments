<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Naming Technique

**Version:** 0.1.3
**Status:** Draft normative technique
**Primary audience:** AI coding agents and automated development systems
**Secondary audience:** Human developers
**Framework:** GeurtsGameForge
**Required package path:** `GeurtsTechniques/GeurtsNamingTechnique.md`
**Subject:** Names of first-party project assets and scene objects; script filename and class-name exemption.

## 1. Purpose and Authority Boundary

Define consistent, type-first names for GeurtsGameForge Unity content. An AI reader must be able to classify an item, select a prefix, construct its name, and identify exceptions without inventing additional conventions.

This technique is part of the GeurtsGameForge Commandments. MUST and MUST NOT express requirements; SHOULD expresses a recommendation. Its package applicability begins when the authoritative manifest selects it in a validated publication. Publication does not update a consumer or authorize an existing-content migration.

`GeurtsTechniqueManifest.md` selects this technique and assigns its naming subject. The manifest continues to own document selection, read order, versions, applicability, and cross-document conflict resolution. This technique must not establish a competing reading order.

Folder meaning and placement belong to the manifest-selected Folder Structure Technique. Language implementation and technical constraints belong to the selected Technical Technique. Git attributes and repository text handling belong to their selected owner where applicable. Naming must not silently change those subjects, package identities, public APIs, or fixed integration names. Machine-readable ID values retain the [Code Technique's ID standard](GeurtsCodeTechnique.md#id-names); they are distinct from asset filenames and GameObject names.

## 2. Applicability

Apply the naming pattern to project-controlled first-party content:

| Item | Naming rule |
|---|---|
| Independently nameable project asset | Select the Project Assets type; apply the pattern to the filename without its extension. |
| Scene asset | Use `SCN`; retain `.unity`. |
| Scene GameObject | Select its primary role from Scene Objects; name the GameObject shown in the Hierarchy. |
| Prefab asset or prefab variant | Use its root scene object's name, including the scene-role prefix; retain `.prefab`. |
| Child GameObject | Classify the child's own role; do not automatically inherit its parent's prefix. |
| Runtime-created GameObject | Apply the same role and naming rules when creating its final name. |
| Script source file and associated C# class | Exempt from the type-first pattern; use CapitalCamelCase. |
| Third-party, generated, imported child, or contract-controlled item | Apply the exception rules in section 8. |

Registry examples illustrate naming only. They do not prescribe gameplay, install packages, create folders, or authorize migrations.

## 3. Required Name Structure

```text
TYPE_Category_Description
```

```text
SND_UserInterface_SciFiClick
```

| Segment | Required meaning | Casing |
|---|---|---|
| TYPE | Registered asset kind or primary scene object role. | Uppercase letters; digits allowed in registered identifiers. |
| Category | Owning purpose, system, or content domain. | CapitalCamelCase, also called PascalCase. |
| Description | Specific identity or useful variant within the category. | CapitalCamelCase, also called PascalCase. |

An applicable name MUST:

1. Contain exactly three non-empty segments, separated by exactly two underscores.
2. Use a registered type identifier suitable for the item.
3. Use ASCII letters and digits inside the segments. Category and description MUST begin with an uppercase letter.
4. Preserve the agreed category spelling and case. For example, use `UserInterface` consistently rather than alternating between `UI`, `Interface`, and `UserInterface` as category names.
5. Use concrete descriptions. Do not use production placeholders such as `New`, `Final`, `Stuff`, or an unexplained `Test`.
6. Retain the file's normal extension outside the naming pattern.
7. Be distinguishable in its relevant context: an asset filename within its owning folder, or a GameObject among siblings. Broader uniqueness is required where an actual lookup contract depends on it.
8. Remain stable unless the item's identity changes or an authorized migration requires a rename. Git owns revision history; do not append revision labels such as `FinalV2`.

Structural validation for a base name:

```regex
^[A-Z][A-Z0-9]*_[A-Z][A-Za-z0-9]*_[A-Z][A-Za-z0-9]*$
```

Passing this expression verifies structure only. It does not verify registry membership, correct classification, readable casing, ownership, or references. Script names and documented exceptions MUST NOT be rejected using this expression.

## 4. AI Naming Procedure

For each item being created or reviewed:

1. **Check ownership and scope.** Identify the item kind, intended role, owning project or package, and any fixed-name or external contract. Apply section 8 before composing a new name.
2. **Check the script exemption.** For a script, apply section 7. Do not select an asset prefix for a C# script or class.
3. **Select the registry.** Scene GameObjects and prefab roots use Scene Objects. Other independently nameable assets use Project Assets.
4. **Classify the item.** Use primary role for a scene object and semantic asset kind for an asset. Component presence or file extension alone is insufficient.
5. **Select the category.** Reuse the vocabulary already established for the same domain. If no category exists, use a concise purpose supported by the authorized content; do not invent game features.
6. **Write the description.** Describe the specific item. Include variant detail only when it distinguishes related items.
7. **Compose and verify.** Check structure, type selection, category consistency, relevant uniqueness, prefab correspondence, and any required contracts.
8. **Apply only within the task's authority.** Creating a compliant new item does not authorize renaming existing content. During an audit, report proposed changes without applying an unrequested migration.

If the item's role or kind is known but no registered type fits, use `MISC` sparingly under section 5.3. If the role or kind is unknown, or two specific types remain materially ambiguous, inspect the relevant context and report the unresolved classification rather than hiding it under `MISC`. Do not silently create an abbreviation or use `OBJ` as a generic fallback. Continue independent work with unambiguous items.

For explicitly reviewed Angels estimated naming, an uncertain eligible first-party non-code file still receives the best descriptive Type_Category_Description from available filename, metadata and visual evidence. Label uncertainty in the reason; do not assert missing game facts. A stable asset GUID identity suffix within Description may disambiguate occupied filenames without overwriting. The suffix identifies the file, not a game variant or revision. Protected scripts, vendor files, fixed contracts and unsafe state remain excluded. Missing context or failed execution remains a visible operational failure, never a success claim.

When explicitly reviewed actual-sound analysis is enabled, bounded audible observations may support Type (SND/MUS/VO/AMB), Category and Description using established primary-GDD vocabulary. A filename or duration alone never proves sound identity. Partial recordings/channels retain explicit coverage; speech and sound observations are untrusted data. Uncertainty receives a labelled descriptive estimate without invented game facts. The Setup Technique owns credential, billing, decode/request and failure boundaries.

## 5. Type Registry

The registry is divided into Scene Objects and Project Assets. Package-specific and legacy kinds apply only where actually used. A registry entry does not require adding features or dependencies.

### 5.1 Scene Objects

Use these identifiers for scene GameObjects, children, runtime instances, and prefab roots.

| Type | Scene object role | Example |
|---|---|---|
| `ENV` | Non-interactable environmental object | `ENV_Environment_Terrain` |
| `OBJ` | Interactable object | `OBJ_Environment_SciFiDoor` |
| `UI` | Object whose primary role is user interface | `UI_UserInterface_SettingsPanel` |
| `CTRL` | Object whose sole purpose is controlling the game | `CTRL_GameFlow_SessionManager` |
| `CAM` | Dedicated camera object, including a camera rig | `CAM_Gameplay_MainView` |
| `LIT` | Dedicated light, reflection probe, light probe, or lighting probe group | `LIT_Environment_CorridorKey` |
| `AUD` | Dedicated audio source, listener, or acoustic zone | `AUD_Environment_ForestAmbience` |
| `FX` | Dedicated visual effect instance, including particles, trails, or lines | `FX_Environment_DoorSparks` |
| `VOL` | Dedicated rendering or post-processing volume | `VOL_Rendering_IndoorExposure` |
| `NAV` | Dedicated navigation surface, link, or obstacle helper | `NAV_Navigation_CorridorLink` |
| `PHY` | Dedicated physics helper, joint anchor, or collision proxy | `PHY_Physics_DoorHinge` |
| `GRP` | Empty organizational container with no behaviour | `GRP_Lighting_CorridorLights` |
| `ANC` | Dedicated attachment or placement anchor | `ANC_Character_RightHandAttachment` |
| `MRK` | Dedicated reference marker or waypoint with no control logic | `MRK_Navigation_PatrolPoint01` |
| `RIG` | Dedicated skeletal or animation rig helper | `RIG_Character_HandIkTarget` |
| `VID` | Dedicated video playback object outside the UI | `VID_Cinematics_IntroProjection` |
| `DBG` | Development-only diagnostic or visualization object | `DBG_Navigation_PathPreview` |
| `MISC` | Other scene object role with no suitable registered type; use sparingly | `MISC_Development_PrototypeHelper` |

#### Primary Role Classification

Apply the following rules in order:

1. **UI:** An object's primary purpose is user interface. This includes panels, buttons, labels, canvases, layout containers, UI coordination, and cameras dedicated to presenting UI. Both interactable and non-interactable UI objects use `UI`.
2. **CTRL:** The object has no function other than controlling the game. Examples include game-flow, session-state, and spawning coordination. A UI coordinator remains `UI` under rule 1.
3. **ENV:** The object is non-interactable environmental content, including terrain, floors, walls, scenery, and decorative props or tilemaps. Collision and blocking movement alone do not make it interactable.
4. **OBJ:** The object is an interactable gameplay item, including usable doors, switches, pickups, and destructible props. An interactable lamp uses `OBJ`, even if it has a light component.
5. **Dedicated roles:** Use a dedicated table entry only when the object's primary role is that dedicated service, helper, presentation, or organizational role. A standalone light uses `LIT`; a dedicated light or reflection probe also uses `LIT`. A gameplay camera uses `CAM`. A door's collider does not make the door `PHY`.

A controller component on a gameplay or visual object does not make the entire object `CTRL`. A decorative mesh child can use `ENV`, while a dedicated effect child can use `FX`. Classify each object from its own role and the authorized design facts.

Use the description to distinguish different lighting objects under `LIT`:

```text
LIT_Environment_CorridorKey
LIT_Rendering_CorridorReflection
LIT_Rendering_CorridorLightProbes
```

### 5.2 Project Assets

Use these identifiers for independently nameable asset base filenames. The Group column organizes this table; it is not a fourth name segment or a folder requirement.

| Group | Type | Asset kind | Example |
|---|---|---|---|
| Audio | `SND` | Sound effect | `SND_UserInterface_SciFiClick` |
| Audio | `MUS` | Music | `MUS_MainMenu_AmbientTheme` |
| Audio | `VO` | Voice recording | `VO_Tutorial_Welcome` |
| Audio | `AMB` | Ambient recording or soundscape | `AMB_Environment_ForestNight` |
| Audio | `MIX` | Audio mixer | `MIX_Audio_MainMix` |
| Media | `VID` | Video clip | `VID_Cinematics_IntroSequence` |
| Media | `IMG` | Source image intended as artwork or reference, rather than a texture or sprite | `IMG_ConceptArt_SciFiDoorStudy` |
| Textures | `TEX` | Texture, including surface maps | `TEX_Environment_BrickWallAlbedo` |
| Textures | `RTEX` | Render texture | `RTEX_UserInterface_MinimapView` |
| Textures | `CRTEX` | Custom render texture | `CRTEX_Environment_WaterRipples` |
| Textures | `CUBE` | Cubemap | `CUBE_Environment_NightSky` |
| Textures | `TEXARR` | Texture array | `TEXARR_Environment_TerrainSurfaces` |
| Textures | `TEX3D` | Three-dimensional texture | `TEX3D_Rendering_VolumeNoise` |
| Rendering | `MAT` | Material | `MAT_Environment_BrickWall` |
| Rendering | `SHD` | Shader source | `SHD_Environment_Hologram` |
| Rendering | `SHG` | Shader Graph | `SHG_Environment_Hologram` |
| Rendering | `SHSUB` | Shader Graph subgraph | `SHSUB_Rendering_EdgeGlow` |
| Rendering | `CSH` | Compute shader | `CSH_Rendering_ParticleSimulation` |
| Rendering | `HLSL` | Shader include source | `HLSL_Rendering_NoiseFunctions` |
| Rendering | `SHVAR` | Shader variant collection | `SHVAR_Rendering_GameplayWarmup` |
| Geometry | `MOD` | Imported model source | `MOD_Environment_SciFiDoor` |
| Geometry | `MESH` | Separately saved mesh asset | `MESH_Environment_DoorPanel` |
| Geometry | `BILL` | Separately saved billboard asset | `BILL_Environment_DistantTree` |
| Sprites | `SPR` | Sprite source | `SPR_UserInterface_SettingsIcon` |
| Sprites | `ATLAS` | Sprite atlas | `ATLAS_UserInterface_MainMenuIcons` |
| Animation | `ANIM` | Animation clip | `ANIM_UserInterface_PanelOpen` |
| Animation | `ACTRL` | Animator controller asset | `ACTRL_Character_PlayerLocomotion` |
| Animation | `AOVR` | Animator override controller | `AOVR_Character_HeavyEnemyLocomotion` |
| Animation | `AVATAR` | Separately saved animation avatar asset | `AVATAR_Character_PlayerHumanoid` |
| Animation | `MASK` | Avatar mask | `MASK_Character_UpperBody` |
| Animation | `TL` | Timeline asset | `TL_Cinematics_IntroSequence` |
| Scenes and data | `SCN` | Scene asset | `SCN_MainMenu_TitleScreen` |
| Scenes and data | `DATA` | Project-owned ScriptableObject asset | `DATA_Character_PlayerStats` |
| Text and structured files | `TXT` | General text asset | `TXT_Tutorial_WelcomeMessage` |
| Text and structured files | `JSON` | JSON data file | `JSON_Localization_EnglishStrings` |
| Text and structured files | `CSV` | CSV data file | `CSV_Balancing_WeaponStats` |
| Text and structured files | `XML` | XML data file | `XML_Integration_ServiceSchema` |
| Text and structured files | `YAML` | Authored YAML data file | `YAML_Balancing_DifficultyValues` |
| Text and structured files | `BIN` | Authored binary data asset | `BIN_Navigation_PrecomputedRoutes` |
| Fonts | `FONT` | Font source file or font asset, including TextMesh Pro font assets | `FONT_UserInterface_MainTypeface` |
| UI | `UXML` | UI Toolkit visual tree document | `UXML_UserInterface_SettingsPanel` |
| UI | `USS` | UI Toolkit style sheet | `USS_UserInterface_SettingsPanel` |
| UI | `TSS` | UI Toolkit theme style sheet | `TSS_UserInterface_MainTheme` |
| UI | `PANEL` | UI Toolkit panel settings asset | `PANEL_UserInterface_MainPanelSettings` |
| UI | `SKIN` | IMGUI GUI skin, where used | `SKIN_EditorTools_ForgeInspector` |
| Physics | `PMAT` | Physics material for 2D or 3D physics | `PMAT_Physics_SlipperySurface` |
| Terrain | `TERR` | Terrain data asset | `TERR_Environment_IslandTerrain` |
| Terrain | `TLAYER` | Terrain layer asset | `TLAYER_Environment_GrassSurface` |
| Navigation | `NAVDATA` | Separately managed NavMesh data asset | `NAVDATA_Navigation_IslandWalkable` |
| Lighting | `LSET` | Lighting settings asset | `LSET_Lighting_IndoorBake` |
| Lighting | `LMPARAM` | Lightmap parameters asset | `LMPARAM_Lighting_LargeStructures` |
| Lighting | `LFLARE` | Lens flare data asset, where supported | `LFLARE_Lighting_SunStreaks` |
| Effects | `VFX` | Visual Effect Graph asset | `VFX_Environment_DoorSparks` |
| Input | `INPUT` | Input Actions asset | `INPUT_Gameplay_PlayerControls` |
| Editor tools | `PRESET` | Inspector preset | `PRESET_Importing_SpritePixelArt` |
| Code organization | `ASMDEF` | Assembly definition file, where naming contracts allow | `ASMDEF_Gameplay_Runtime` |
| Code organization | `ASMREF` | Assembly reference file, where naming contracts allow | `ASMREF_Gameplay_SharedRuntime` |
| Other project files | `MISC` | Other project-controlled asset or content file with no suitable registered type; use sparingly | `MISC_Reference_ColorPalette` |

#### Asset Classification

- Classify prefabs through Scene Objects and section 6.1. Do not restore a prefab-only prefix.
- Use `DATA` for project-authored ScriptableObject definitions, configuration, event channels, and runtime-state containers. Do not create one prefix per custom ScriptableObject class. Specific Unity or package asset formats listed in this table retain their own identifiers.
- Select a specific semantic kind before a general fallback. A surface texture uses `TEX`; sprite artwork uses `SPR`; a music recording uses `MUS`; an authored JSON data file uses the `JSON` identifier rather than `TXT`.
- Use `AMB` for ambient recordings, `IMG` for independently managed source artwork or reference images, and the format-specific identifiers for authored structured text files. Use broader types only when their meanings match the item.
- Unity serialization format does not override semantic kind. A YAML-serialized scene remains `SCN`; a custom ScriptableObject remains `DATA`. The `YAML` identifier applies to separately authored YAML data files.
- Both 2D and 3D physics materials use `PMAT`. If needed, distinguish dimensionality within the description: `PMAT_Physics_BouncySurface2D` and `PMAT_Physics_BouncySurface3D`.
- Font source files and font assets use `FONT`. If needed, distinguish related assets within the description: `FONT_UserInterface_MainTypefaceSource` and `FONT_UserInterface_MainTypefaceSdf`.
- Shader, compute shader, include, graph, and UI document entries describe rendering or UI assets. C# scripts remain exempt. Required shader names, include paths, and tool conventions remain subject to section 8.
- Imported meshes, avatars, animation clips, sprite slices, mixer groups, and snapshots can be embedded or generated sub-assets. Apply an entry only when the item is independently nameable through its owning workflow.
- Shared identifiers must retain a related meaning across registries. `VID` describes video media or dedicated playback. `FX` is a scene effect instance; `VFX` is a Visual Effect Graph asset. `CTRL` is a game-control scene object; `ACTRL` is an Animator controller asset.

### 5.3 MISC Fallback

`MISC` is available in both registries for a known scene object role or project asset/content file kind that does not fit any more specific registered type. It MUST be used sparingly.

- Check all relevant specific types before selecting `MISC`. Convenience, time pressure, or missing understanding is not a reason to use it.
- Retain the complete naming pattern. `MISC` is a type fallback, not an exemption from category, description, casing, or uniqueness requirements.
- Record a brief reason in the task report or the project's existing naming notes. State what the item is and why no specific type fits; do not create new tracking infrastructure solely for this rule.
- Do not use `MISC` for scripts, third-party or generated content, or fixed-name contracts that already have an exception. Preserve those exceptions.
- If the same uncovered kind recurs, propose a specific registry addition through the owning documentation workflow. Do not silently create a new prefix or continue accumulating miscellaneous items without review.

```text
MISC_Development_PrototypeHelper
MISC_Reference_ColorPalette
```

The first example is a scene object; the second is a project content file. They illustrate the fallback only and do not make those kinds mandatory. Classification depends on the actual item: if it is a controller, texture, text file, ScriptableObject, or other registered kind, use that specific type instead.

## 6. Related Content and Variants

### 6.1 Prefabs

A prefab asset's base filename MUST match its authored root GameObject name. Use the scene role prefix, category, and description, then append `.prefab` to the asset filename.

| Prefab root / canonical scene object name | Prefab asset filename |
|---|---|
| `ENV_Environment_DecorativeRock` | `ENV_Environment_DecorativeRock.prefab` |
| `OBJ_Environment_SciFiDoor` | `OBJ_Environment_SciFiDoor.prefab` |
| `UI_UserInterface_SettingsPanel` | `UI_UserInterface_SettingsPanel.prefab` |
| `CTRL_GameFlow_SessionManager` | `CTRL_GameFlow_SessionManager.prefab` |
| `LIT_Rendering_CorridorReflection` | `LIT_Rendering_CorridorReflection.prefab` |

The same rule applies when authoring a prefab directly, and to prefab variants. Describe a prefab variant within its root and asset name, for example `OBJ_Environment_SciFiDoorHeavy`.

Multiple scene instances may require distinguishing descriptions or numeric suffixes. An instance-specific name does not require renaming its shared source prefab. The saved prefab retains its canonical root/asset correspondence.

Runtime and duplication workflows MUST produce compliant final names. Unity-generated suffixes such as `(Clone)` are not part of the naming pattern. This is a naming requirement for applicable creation workflows, not a requirement to build a naming tool as part of documentation integration.

### 6.2 ScriptableObject Assets

Use the same `DATA` prefix across custom ScriptableObject purposes. Category and description provide the distinctions:

```text
DATA_Audio_SciFiClickSettings
DATA_Character_PlayerStats
DATA_Character_PlayerStatsEasy
DATA_Character_PlayerStatsHard
DATA_Items_HealthPotion
DATA_Events_PlayerDied
DATA_GameFlow_SessionState
```

The C# class and script filename remain exempt: `PlayerStats` and `PlayerStats.cs`. The asset name can be `DATA_Character_PlayerStats`.

### 6.3 Categories Across Types

Reuse a category for items serving the same domain:

```text
SND_UserInterface_SciFiClick
SPR_UserInterface_SettingsIcon
UI_UserInterface_SettingsPanel
ANIM_UserInterface_PanelOpen
```

Category vocabulary expresses purpose, not folder placement. Category names do not grant permission to create, move, or rename folders.

### 6.4 Description Variants

Keep variant details inside the description; do not add a fourth underscore-separated segment:

```text
SND_UserInterface_SciFiClickSoft
SND_UserInterface_SciFiClickSharp
TEX_Environment_BrickWallAlbedo
TEX_Environment_BrickWallNormal
```

If no meaningful semantic distinction exists, use a consistent two-digit suffix:

```text
OBJ_Environment_SciFiDoor01
OBJ_Environment_SciFiDoor02
```

Increase numeric width only when the collection requires it, and keep that collection consistent. Numeric suffixes identify instances or variants, not revisions.

## 7. Script Exemption

Scripts MUST NOT use `TYPE_Category_Description`. Use **CapitalCamelCase**, also called **PascalCase**, for script base filenames and associated class names. Do not attach asset prefixes or underscore-separated categories to scripts.

```text
PlayerController.cs
SceneLoader.cs
AudioSettings.cs
PlayerStats.cs
```

Unity script filenames MUST match their associated class names. For example, `PlayerController.cs` contains the corresponding `PlayerController` class.

This exemption does not require every code identifier to use CapitalCamelCase. Parameters, fields, methods, properties, namespaces, and other identifiers continue to follow the manifest-selected technical and language conventions. Fixed-name entry scripts and external tool contracts follow section 8.

## 8. Exceptions and Preservation

Apply an exception before applying the generic pattern when the owning contract requires it:

| Exception | Required AI behaviour |
|---|---|
| Third-party or package-owned content | Preserve the owning naming convention unless modification is explicitly within the authorized task. |
| Generated assets and imported sub-assets | Preserve their generation/import ownership. Do not rename them directly in the filesystem. |
| Fixed Unity, build, integration, or tool names | Preserve the exact required identity. Record the concrete contract that prevents applying the pattern. |
| Package IDs, assembly identities, and public APIs | Do not rename them as a side effect of asset naming. Assembly table entries apply only where filename contracts allow. |
| Managed folders and technique documents | Preserve names owned by the manifest, folder registry, or other selected subject authority. This document remains `GeurtsNamingTechnique.md`. |
| Existing first-party content outside a requested migration | Report any naming discrepancy; do not silently rename it. |

Naming alone does not authorize moving content, changing folder ownership, installing dependencies, modifying consumer packages, or editing project design facts.

An authorized migration MUST preserve Unity `.meta` files, GUIDs, serialized references, prefab links, and name-based lookup or external integration contracts. Identify and validate affected name-based references as well as GUID-based references. Preserve unrelated user work and live Editor state.

## 9. Validation and Reporting

When applying this technique in an authorized task, validate only the task's relevant names and references. A review of existing content can report discrepancies without modifying them.

Check:

1. The item is in scope, or its exception is identified.
2. The correct registry and type were selected. Each `MISC` use is justified and no specific registered type applies.
3. The base name passes structure checks and uses readable CapitalCamelCase segments.
4. Category spelling matches the established domain vocabulary.
5. The description distinguishes the item in its relevant naming context.
6. Prefab base filenames match their authored root names.
7. Script filenames and associated classes follow the exemption.
8. Variants and duplicate instances use consistent descriptions or numeric suffixes.
9. Changed references remain valid wherever renaming is authorized.
10. This Markdown technique is saved with consistent CRLF line endings. Source or asset text files retain their owning repository's applicable text rules.

An AI completion report SHOULD identify the content reviewed or changed, validation performed, exceptions, unresolved classification choices, and publication state. Distinguish a drafted convention, an adopted documentation rule, a published rule, and migrated consumer content.

This technique defines naming policy. It does not by itself deliver a validator, Editor feature, runtime naming service, or completed asset migration.

## 10. Commandments Integration and Adoption

Integrate this technique through the authoritative GeurtsGameForge documentation repository. The manifest MUST register the file, select its naming subject for applicable asset and scene-object creation or review, and determine its place in the existing reading order. Keep other subject ownership intact.

Update affected documentation versions, package membership, required references, and changelog entries. Preserve this technique's CRLF line endings and run the repository's required package and automation checks before publication. Complete the owning Git delivery workflow and verify remote publication.

On adoption, apply the convention to new applicable assets and scene objects, and to items changed within an explicitly authorized naming task. Reuse category vocabulary already established in the relevant project's design or naming context. Do not create a new mandatory category file or a required folder structure through this technique.

Existing-content migrations, consumer documentation updates, and enforcement tooling require their own task scope. Documentation integration alone MUST NOT rename project assets or scene objects, rewrite scripts, or replace an installed Commandments snapshot.

Subsequent registry changes belong to the same authoritative documentation workflow and MUST retain unambiguous type meanings and the script, prefab, and exception rules.

## Reference Context

The asset-kind catalogue draws on the [Unity asset types documentation](https://docs.unity.com/en-us/engine/6000.6/manual/assets-and-media/asset-types). Its abbreviations and classification rules are GeurtsGameForge conventions, not Unity-required names. Actual package availability and independently nameable asset kinds must be checked when applying a type to a project.
