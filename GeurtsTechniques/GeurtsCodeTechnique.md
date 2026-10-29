<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Code Technical Topic

**Version:** 0.2.0
**Unity minimum:** Unity 6.6 (6000.6.3f1) or newer
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsCodeTechnique.md`

## Coding Standards

### Asset and Scene Object Names

The manifest-selected [Naming Technique](GeurtsNamingTechnique.md) owns first-party asset, scene GameObject and prefab-root names, and the script filename/class-name exemption. Select it before creating, naming, renaming or reviewing applicable content. Code-symbol conventions, command names and machine-readable ID values below remain Technical subjects. Preserve fixed Unity, package and tool contracts through the Naming Technique's exceptions.

### Full-word authored names

Use full words in new class, method, property, field, parameter, enumeration and freely authored identifier names. The Naming Technique permits abbreviations only in the leading uppercase asset/scene TYPE prefix; scripts and code symbols have no such prefix. Preserve required casing and exact external/published contracts. Document existing abbreviated commands as legacy compliance gaps needing coordinated owner updates; do not silently rename APIs or serialized fields.

### ScriptableObjects and Object References

**Use ScriptableObjects extensively as the default for reusable, Inspector-authored game definitions, shared configuration, action assets and event channels.** Compose suitable existing asset types through typed references and thin components, retaining normal no-code setup. Keep per-instance behaviour on components; avoid assets for every transient value and hidden shared global state.

**Connect Unity assets, prefabs, components and scene objects through strongly typed serialized object references, assigned by drag and drop or an object picker in the Editor.** Prefer direct references to ScriptableObject definitions over string content IDs and registries. Avoid string IDs, object names, hierarchy paths and string-keyed lookups for connections that can be represented by object references. Do not substitute a hash of a string for a direct reference or add a lookup layer merely to avoid exposing a reference field.

Expose required references clearly, with tooltips and actionable authoring validation. Report missing, incompatible or invalid references before use; do not silently fall back to a name search. Respect asset/scene ownership and lifetime: reusable assets must not depend on a particular scene instance; provide scene-local connections through an owning component. Keep authored shared data separate from mutable per-instance/session state, with explicit state ownership and reset/cleanup. Do not use authored asset mutation as player-save storage.

IDs are exceptions when a supported persistence format, network protocol, dynamic-content/addressable loading boundary, external integration or existing versioned contract requires an identity that cannot use a direct Unity reference. Document the concrete boundary and use the owning system's typed identity/reference where available. Resolve and validate external identities at that boundary, retain the resulting object reference for use within its valid lifetime, and avoid repeated lookup work in frame/tick loops. Do not serialize raw Unity object references across processes or treat runtime instance IDs as persistent identities. Preserve existing fixed identities until a coordinated versioned migration updates their consumers.

For new and affected workflows, verify Editor assignment, missing-reference feedback, serialization/reload and reference lifetime in the applicable scene/player context. Apply the existing technical priorities, including the multiplayer override. This policy governs new and maintained implementations; it does not certify released bricks or migrate installed assets automatically.

### ID Names

Use IDs only for the boundary exceptions above; the naming rules below do not require introducing IDs where object references suffice.

**All freely authored ID names must use `lower_snake_case`: lowercase words separated by a single underscore (`_`), never a hyphen (`-`).** This applies throughout first-party games and Geurts bricks, including UI Foundations element IDs, screen and control IDs, and authored content, settings, action and event IDs.

Use meaningful names composed of lowercase letters and digits, with single underscores between words. ID values must match `^[a-z0-9]+(?:_[a-z0-9]+)*$`: no uppercase letters, spaces, hyphens, repeated underscores, or leading/trailing underscores.

| Intended name | Required ID value | Invalid alternatives |
|---|---|---|
| Main Menu Button | `main_menu_button` | `main-menu-button`, `MainMenuButton`, `Main Menu Button` |
| Master Volume | `master_volume` | `master-volume`, `Master_Volume` |
| Player 1 Spawn | `player_1_spawn` | `player-1-spawn`, `Player1Spawn` |

This rule governs machine-readable ID **values**, not display labels, C# symbol names, or file/folder names. For example, a C# property named `ElementIdentifier` keeps its code naming convention while its authored value is `main_menu_button`. Preserve required formats for GUIDs, hashes, vendor/protocol IDs, UPM package names, and fixed versioned schema tokens; do not rewrite those identities by globally replacing hyphens or changing case. New freely authored IDs follow this standard.

Validate the format and uniqueness within the owning ID scope during authoring and before use, observing that system's length limits and reserved names. Report invalid or duplicate IDs with an actionable message. Different labels can produce the same ID; do not silently overwrite another entry, append an arbitrary suffix, or normalize a persisted value behind the user's back.

When an existing first-party ID must change, inspect and update every affected lookup, binding, reference and persisted value together through a scoped, versioned migration. Preserve Unity asset GUIDs and unrelated user content, and verify resolution and persistence after the rename. Older brick releases may accept or generate legacy ID formats; that does not waive this rule for new freely authored IDs or establish that their tools already enforce it. Package-defined element names and existing serialized IDs retain their exact values until the owning component's coordinated migration updates their contracts and consumers. Adding this documentation standard does not itself migrate installed bricks, menus or project assets.

### Variables

- Class-level private fields must use an underscore prefix.

```csharp
private float _health;
```

- Method-level variables must not use an underscore prefix.

```csharp
float damageAmount = 10f;
```

- All `[SerializeField]` fields must include a `[Tooltip]`.

```csharp
[SerializeField, Tooltip("The maximum health value this entity can have.")]
private float _maximumHealth = 100f;
```

### Enums

Enums must use all caps with underscores.

```csharp
public enum ARTIFICIAL_INTELLIGENCE_STATE
{
    STATE_IDLE,
    STATE_PATROL,
    STATE_ATTACK
}
```

## Code Documentation Standards

### Purpose

This section defines standards for documenting C# code to ensure clarity, maintainability, and ease of collaboration.

### Major Component Help

Every major first-party component must provide a clearly labelled **Help** section explaining how to use it. This includes Geurts Game Forge bricks, substantial runtime/game systems, authoring components and Editor tools. A major component owns a distinct user workflow or substantial capability; this requirement does not demand a separate Help section for every small field, helper or method.

Explain the component's purpose, prerequisites and setup, normal use through supported controls, key settings and actions, and a short practical example. Include common problems and their remedies where relevant. Describe supported code/API extensions and any documented code-required exception when applicable, while keeping ordinary no-code instructions understandable without reading source. Tooltips, compliance notices and XML summaries supplement this Help section; they do not replace usage instructions.

Provide Help at the point of use. Components with an Editor surface must expose a discoverable, clearly labelled Help section in their inspector or tool view, following the [Editor Appearance Technique](GeurtsEditorAppearanceTechnique.md#61-component-help-sections). A major service without its own authoring surface must provide the labelled Help section in its owning component/package usage documentation, linked from its documented entry point. Essential instructions must remain readable locally/offline; optional links to fuller references may supplement them without adding runtime documentation dependencies.

Keep Help accurate for the supported component version and update it whenever setup or behaviour changes. Verify that a user can follow its instructions to complete a representative setup and use workflow. This policy does not certify existing releases or authorize automatic edits to installed components or user content; apply it to new and affected components during maintenance.

<a id="public-classes"></a>
### Classes

**Every first-party C# class, regardless of accessibility, must include a meaningful XML `/// <summary>` description immediately above its declaration (before any declaration attributes).** This includes public, internal, protected, private, static, abstract, generic and nested classes in Geurts bricks, ordinary game code, runtime systems, Editor tools and tests.

Describe what the class does and its responsibility. Empty summaries, repetition of the class name, ordinary `//` comments or `<inheritdoc/>` alone do not satisfy this requirement. Keep the XML well formed and accurate as the class changes. Add `<remarks>` for relevant setup, ownership, lifetime, constraints or usage guidance, and `<typeparam>` descriptions for generic type parameters where present.

For a partial class, place the complete class description on one primary first-party declaration maintained by the project; avoid duplicate class summaries on every part. Document relevant behavior supplied by the other parts. Preserve vendor and generated files; maintain documentation through an owned declaration or the supported generator/source when appropriate.

Review all classes and methods in the affected implementation before publication. Apply these rules to new and affected first-party code during maintenance; this does not certify existing releases or authorize unrelated edits to installed packages, third-party code or generated output. Summaries supplement Major Component Help and do not replace it.

<a id="public-methods"></a>
<a id="private-methods"></a>
### Methods

**Every first-party C# method, regardless of accessibility, must include a short, meaningful XML `/// <summary>` comment immediately above its declaration (before any declaration attributes).** This includes public, internal, protected and private methods, static and generic methods, overrides, Unity lifecycle callbacks and coroutine methods.

State what the method does, its expected behavior and important side effects. Empty summaries, repetition of the method name, ordinary `//` comments or `<inheritdoc/>` alone are insufficient. Keep summaries concise; add relevant detail in `<remarks>`. Use `<param>` for parameters, `<returns>` for a returned value and `<typeparam>` for generic type parameters where present.

```csharp
/// <summary>
/// Subtracts damage from this entity's health.
/// </summary>
/// <param name="damageAmount">The amount of damage to apply.</param>
public void ApplyDamage(float damageAmount)
{
    _health -= damageAmount;
}
```

### Complex Routines and Logic

**Complex routines must contain explanatory comments describing what they do.** This includes methods, constructors, local functions, callbacks and coroutine or asynchronous routines when their logic is complex. Place comments beside the relevant implementation steps or blocks; a declaration summary alone is insufficient.

Explain the algorithm or major phases, non-obvious decisions, state transitions and relevant ordering, timing, ownership or cleanup constraints. Describe intent and reasons rather than restating syntax. Do not comment every line. Keep summaries and implementation comments accurate when behavior changes.
