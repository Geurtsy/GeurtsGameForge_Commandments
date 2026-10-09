<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Code Technical Topic

**Version:** 0.1.1
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsCodeTechnique.md`

## Coding Standards

### Asset and Scene Object Names

The manifest-selected [Naming Technique](GeurtsNamingTechnique.md) owns first-party asset, scene GameObject and prefab-root names, and the script filename/class-name exemption. Select it before creating, naming, renaming or reviewing applicable content. Code-symbol conventions, command names and machine-readable ID values below remain Technical subjects. Preserve fixed Unity, package and tool contracts through the Naming Technique's exceptions.

### ID Names

**All freely authored ID names must use `lower_snake_case`: lowercase words separated by a single underscore (`_`), never a hyphen (`-`).** This applies throughout first-party games and Geurts bricks, including UI Foundations element IDs, screen and control IDs, and authored content, settings, action and event IDs.

Use meaningful names composed of lowercase letters and digits, with single underscores between words. ID values must match `^[a-z0-9]+(?:_[a-z0-9]+)*$`: no uppercase letters, spaces, hyphens, repeated underscores, or leading/trailing underscores.

| Intended name | Required ID value | Invalid alternatives |
|---|---|---|
| Main Menu Button | `main_menu_button` | `main-menu-button`, `MainMenuButton`, `Main Menu Button` |
| Master Volume | `master_volume` | `master-volume`, `Master_Volume` |
| Player 1 Spawn | `player_1_spawn` | `player-1-spawn`, `Player1Spawn` |

This rule governs machine-readable ID **values**, not display labels, C# symbol names, or file/folder names. For example, a C# property named `ElementId` keeps its code naming convention while its authored value is `main_menu_button`. Preserve required formats for GUIDs, hashes, vendor/protocol IDs, UPM package names, and fixed versioned schema tokens; do not rewrite those identities by globally replacing hyphens or changing case. New freely authored IDs follow this standard.

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
private float _maxHealth = 100f;
```

### Enums

Enums must use all caps with underscores.

```csharp
public enum AI_STATE
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

### Public Classes

**Every first-party public C# class must include a meaningful XML `/// <summary>` description immediately above its declaration (before any declaration attributes).** This includes public static, abstract, generic and nested classes in Geurts bricks, ordinary game code, runtime systems, Editor tools and tests.

Describe the class's purpose and responsibility so a caller can understand when and why to use it. Empty summaries, a repetition of the class name, ordinary `//` comments or `<inheritdoc/>` alone do not satisfy this requirement. Keep the XML well formed and accurate as the class changes. Add `<remarks>` for relevant setup, ownership, lifetime, constraints or usage guidance, and `<typeparam>` descriptions for generic type parameters where present.

For a partial class, place the complete class description on one primary first-party declaration that is maintained by the project; avoid duplicate class summaries on every part. Document the complete class, including relevant behavior supplied by its other parts. Preserve vendor and generated files; maintain documentation through an owned declaration or the supported generator/source when appropriate.

Review the public classes in the affected implementation before publication. This requirement does not certify existing releases or authorize unrelated edits to installed packages, third-party code or generated output. Class descriptions supplement the separate public-method XML documentation and Major Component Help requirements; they do not replace either.

### Public Methods

Every publicly accessible method must include an XML `/// <summary>` comment.

The summary must clearly and succinctly describe:

- The method's purpose.
- Expected behaviour.
- Important side effects.

Use `/// <param>` and `/// <returns>` tags for parameters and return values.

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

### Private Methods

Private methods should have a brief comment above the method declaration when their intent or logic is not obvious.

XML documentation is not required for private methods.

Do not comment every line. Focus on intent, usage, and non-obvious logic.

Comments must be updated when behaviour changes.
