<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Authoring Technical Topic

**Version:** 0.1.1
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsAuthoringTechnique.md`

## UI

Use UI Toolkit for new Geurts UI work. Inspect the existing UI before changing it, and never silently replace or overwrite working user content. When a project already uses another UI system, follow explicit user/project requirements for a scoped integration or migration; do not perform a destructive automatic conversion.

All existing and future Forge-owned Editor UI must comply with the manifest-selected [Editor UI Theme Technique](GeurtsEditorUIThemeTechnique.md) and [Editor Appearance Technique](GeurtsEditorAppearanceTechnique.md). Reuse God's shared `ForgeEditorTheme` API and `ForgeEditorTheme.uss` for dark sci-fi surfaces and green accents; God's Commandments view uses that same canonical implementation directly. Preserve meaningful Odin configuration and use UI Toolkit for new custom Editor UI. Editor appearance is a first-class quality requirement and Definition of Done gate, with tabs, labelled collapsible sections, useful severity callouts and inline authoring findings owned by Appearance. This gate does not add or reorder the technical priorities above, change the multiplayer override or alter dependency/serialization rules. These Editor-only standards do not change runtime or player-facing game UI.

For new custom UXML controls, use `[UxmlElement]` on a partial class and `[UxmlAttribute]` for exposed attributes, following the Unity 6.6 UxmlElement reference. Avoid new `UxmlFactory`/`UxmlTraits` implementations. Use supported UXML/USS and verify data binding and lifecycle cleanup in the actual runtime or Editor context.

## Odin Inspector Usage

Odin Inspector is required within the implementation scope defined by the Unity 6000.6.3f1 dependency baseline. Confirm a current stable Unity 6-compatible release is installed, licensed, and referenced by each applicable assembly definition before implementing or modifying scoped code. Use the [official Odin patch notes](https://odininspector.com/patch-notes) to verify compatibility; record the installed version in implementation evidence rather than pinning a moving release in this technique.

Use Odin attributes as the default authoring layer for Geurts-owned components and ScriptableObjects. Prefer Odin's declarative drawers, validation, buttons, tables, and grouping over new one-off custom inspectors when they express the workflow clearly. Keep ordinary Unity serialization when it supports the required data. Use Odin serialization only for an intentional unsupported data shape or polymorphic contract, and test prefab overrides, asset persistence, domain reload behavior, IL2CPP/AOT, and stripping where applicable.

- Follow the [Editor Appearance Technique](GeurtsEditorAppearanceTechnique.md) for meaningful tabs, boxed grouping, labelled collapsible sections, callouts and discoverable hidden findings.
- Mark mandatory asset and component references with `[Required]` and express safe numeric limits with `[MinValue]`, `[MaxValue]`, or another suitable Odin constraint.
- Use `[ValidateInput]` for domain rules that cannot be expressed by a simpler constraint, with a concise actionable message.
- Use `[ReadOnly]` or `[ShowInInspector]` for useful live diagnostic state that should be visible without becoming serialized configuration.
- Use `[Button]` for safe, useful Editor actions such as validation, preview, setup, and test operations.
- Apply `[OdinSerialize]` only when Odin serialization is required; do not add it to Unity-supported fields merely to increase attribute use.
- Document every non-obvious validation rule and button through labels, tooltips, or concise comments; group and tab presentation belongs to the Appearance Technique.

Editor buttons must support Undo and dirty/prefab recording when they change Unity-owned serialized data. Destructive actions require explicit labels, a clear confirmation, precise scope, and useful failure reporting. Do not duplicate an existing Odin workflow with a custom Editor window unless the custom interaction is materially better and the reason is documented.
