<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Editor UI Theme Technique

**Version:** 1.5.3
**Status:** Normative mandatory standard
**Primary audience:** Geurts Game Forge brick and Editor-tool maintainers
**Secondary audience:** AI coding agents and human developers
**Required package path:** `GeurtsTechniques/GeurtsEditorUIThemeTechnique.md`

## Scope and authority

The dark sci-fi interface with green accents established by Forge Diagnostics is the mandatory visual standard for **all existing and future Geurts Game Forge bricks and Forge-owned Editor tools**. Apply it to Forge-owned windows, dashboards, setup pages, settings pages, custom inspector presentation, cards, navigation, status messages and controls. A new brick is not exempt because it has no previous visual design. An existing brick is not exempt because it uses IMGUI, Odin Inspector or a different earlier palette.

`GeurtsTechniqueManifest.md` selects this technique and owns applicability, reading order, versions and cross-document conflict resolution. This technique owns the shared Forge Editor palette, styling implementation, geometry, accessibility foundation, truthful status and their conformance requirements. The [Editor Appearance Technique](GeurtsEditorAppearanceTechnique.md) owns workflow presentation, tabs, collapsible content sections, callouts and inline authoring validation; both standards apply to affected Forge-owned Editor UI. The Technical Technique continues to own implementation priorities, the UI Toolkit baseline and required Odin usage. The Brick Contract owns dependencies, lifecycle, settings and package operations. Diagnostics owns diagnostic meaning and runtime console behavior. The Commandments Companion Technique owns the God-owned content service's dependency and project-access boundaries.

This standard is **Editor-only**. It does not select or redesign player-facing game UI, runtime Diagnostics or Quantum Console presentation, game art, scenes, game design documents, third-party inspectors or Unity's global skin. Do not access `Docs/GameDesign/` or change game design to apply this theme. Forge-owned Editor controls embedded in an existing Inspector remain in scope; preserve the behavior and readability of their host and neighboring controls.

## Required visual tokens

Use these shared tokens consistently. A brick must not substitute its own brand palette or silently derive unrelated colors from the current Unity skin.

| Token | Exact color | Use |
|---|---|---|
| Background | `#0A1012` | Main Forge content surface. |
| Panel | `#121C1E` | Section cards and grouped content. |
| Raised | `#172425` | Controls and raised or emphasized surfaces. |
| Border | `#2B433F` | Quiet section boundaries and separators. |
| Accent | `#6EF29D` | Selected navigation, primary emphasis, interactive focus and verified-working outlines. |
| Attention | `#FFAE57` | Needs-attention status outlines; distinct from warning severity. |
| Text | `#DEECE7` | Main labels, values and body text. |
| Muted | `#8FA8A1` | Secondary descriptions and supporting metadata. |
| Info | `#FFFFFF` | Informational severity. |
| Warning | `#FFE66D` | Warning severity and caution. |
| Error | `#FF6B6B` | Error severity and destructive emphasis. |

Dark layered panels, restrained borders and green accents provide the sci-fi character. Keep meaningful content dominant. Do not add scanline overlays, glow, tiny decorative labels, excessive all-capital text, flashing effects or invented telemetry that obstruct reading or imply nonexistent functionality. Derived hover, pressed, disabled and selected treatments must come from the shared theme and retain readable labels.

Severity colors remain semantic: Info is white, Warning is yellow and Error is red. Green branding must never turn an error or warning green. Topic colors and other data-defined colors remain independently meaningful where the owning feature requires them; use the shared surfaces around them and retain readable text.

## Layout and interaction

Use the [Editor Appearance Technique](GeurtsEditorAppearanceTechnique.md) for labelled collapsible content sections, appropriate tabs and inline authoring findings. Its required severity icons/text and hidden-finding indicators build on the accessibility foundation below; theme styling must not suppress them. This technique retains the shared layout dimensions and host interaction rules.

- Standalone primary brick and tool interfaces use resizable Editor windows. New floating windows target **1000 × 760 Editor points**, reduced to fit the main Editor area where space permits. Each window's supported minimum takes precedence; a main Editor area smaller than that minimum cannot fully contain the window. Reopening an existing window preserves its size, position, docking layout and constraints; do not resize or undock a user-arranged window.
- God **0.26.0** embeds selected installed brick tools in its own panel, with a fixed **Back to God** button and brick title above the scrolling content. Hide God's dashboard and update controls while a brick is selected; Back restores the dashboard. God 0.29.0 includes a complete Commandments view with explicit content update/version controls, as specified by the Brick Contract and Companion Technique. Opening its embedded view stays offline. Retain the shared theme and meaningful existing Odin configuration. The host owns an independent hidden view, preserving every existing standalone window's geometry, docking and lifetime. Check this navigation at normal and narrow sizes.
- Give each window a clear title and short purpose. Group related work into consistently padded section cards with descriptive headings, and place the most relevant action beside its context.
- Use a deliberate hierarchy of title, section heading, body and supporting text. Use readable Editor fonts and the shared typography definitions; decorative sci-fi fonts must not replace ordinary controls or diagnostic content. Long values, paths and messages must wrap, scroll or expose their complete value.
- Use shared spacing and control dimensions. Align related labels and buttons; keep card padding, section gaps and navigation consistent across bricks. Do not create one-off spacing systems for each window.
- Provide ample padding and visible gaps so instructions, callouts, labels and fields never overlap. Reserve the complete rendered area of dynamic or wrapped content and let the surface grow/scroll as needed. Follow the [Appearance Technique's inspector spacing requirements](GeurtsEditorAppearanceTechnique.md#71-inspector-spacing-and-overlap-prevention); compliance messages must not reduce the readability or usability of the fields they accompany.
- Show selected navigation, hover, pressed and keyboard-focus states distinctly. Keyboard focus must remain visible on enabled controls and must not be communicated through a color change alone. Preserve normal keyboard activation, text selection, copy, tab navigation and host interactions.
- Use a visible label or message for every material state. Pair severity or status color with text such as **Warning**, **Failed**, **Unavailable**, **Running** or **Complete**; use an icon or shape as a supplementary cue when useful. Callouts and authoring findings additionally require the distinct severity icons and hidden-finding visibility defined by Appearance. Color alone is insufficient.
- Explain unavailable actions visibly with the actual reason and an actionable next step. Tooltips may repeat or expand that explanation, but a tooltip alone is insufficient for an important disabled action. Preserve the same eligibility rule for the enabled state and its explanation so they cannot contradict each other.
- Distinguish destructive actions from ordinary actions using precise labels and error emphasis. Preserve the existing subject owner's confirmation, cancellation and scope rules; styling must not add, remove or bypass authorization.
- Keep all labels and input content readable against the surfaces actually drawn. Restore temporary GUI colors, styles and state after drawing so a Forge panel cannot change unrelated Unity or third-party UI.

### Status outlines

Outline the relevant Forge status card, section or setup step consistently: **green for verified working/ready**, **orange for needs attention**, and **red for an error**. Use the canonical Accent, Attention and Error tokens respectively. Keep a visible text label, actual reason and practical next action; colour alone is insufficient. Identify the actual tool owner beside the step so a God navigation surface cannot be mistaken for the tool performing the work.

These outlines communicate operational status, not log severity or selection. Information remains white and warning callouts/logs remain yellow; the orange Attention token does not replace Warning. A selected green control does not certify that its tool works. Apply success only to verified scope, attention to known `needs-action`/`blocked` conditions, and error to actual `failed` states. Unknown/not-checked, disabled, not-applicable and in-progress states retain neutral borders and precise text; never paint them as successful. The Forge Setup Technique owns exact status meanings and the unchanged setup contract enum.

Reserve outline padding and the complete rendered height of wrapped status/owner text, with ample separation from fields and neighbouring panels. Implement new reusable styling in God's canonical theme (and BigBang's maintained subset where applicable), not a private palette. This documentation requirement does not claim an existing released styling API or retrofit installed UI; verify native normal/narrow layouts when adopting it.

## Truthful status and animation

Display actual operation state, current stage, useful results and failure details. An unknown or unchecked condition must remain **Unknown**, **Not checked** or **Unavailable**, as appropriate; theme colors must not imply success. A queued or ongoing package operation must not look complete before the actual operation and required verification have succeeded.

Show a numeric percentage only when the operation supplies measurable progress. A Unity package request without a percentage uses an activity indicator and stage text. Decorative animation, including the Game Forge God furnace, may indicate activity or identity but must never be presented as a measured progress value, proof of successful setup or evidence of a running service. Keep animation unobtrusive and release its repaint/update work when the owning UI is no longer active.

<!-- GEURTS-SECTION:BEGIN FORGE-DEVELOPMENT-ONLY -->
## Shared implementation and dependency boundary

God's Editor assembly owns the canonical public **`ForgeEditorTheme`** API and **`ForgeEditorTheme.uss`** stylesheet. All bricks that depend on God must reuse those shared tokens, styles and components for their Forge-owned Editor presentation. Extend that shared implementation when a reusable state or control is missing instead of copying a palette, recreating a private theme class or adding a second shared theme package. Keep Editor-only dependencies out of runtime assemblies and player builds.

The canonical files are `Editor/ForgeEditorTheme.cs` and `Editor/ForgeEditorTheme.uss` in the God package; the API namespace is `Geurts.GameForge.God.Editor`. Use a cached `ForgeEditorTheme` instance's `Scope()` around existing IMGUI/Odin drawing and static `ForgeEditorTheme.ApplyToolkit(root)` for a Forge-owned UI Toolkit root. God 0.9.0 introduces this public shared theme; a dependent package that adopts it must declare the corresponding compatible God minimum instead of compiling against an older release without the API. Verify actual release availability through the catalogue before installation.

Use the public static `ForgeEditorTheme.OpenWindow<T>(Vector2 minimumSize, string title = null)` for primary window openers, where `T : EditorWindow`. Pass the window's existing supported minimum and its optional title. God **0.14.0** introduces this API; adopting dependent packages must declare that minimum. The helper reuses an existing window, while only a newly created floating window receives the larger initial geometry. The God-owned Commandments view uses this canonical opener directly. Confirmation dialogs retain their existing modal behavior and subject-owned consent rules.

God's public `ForgeThemedEditor` is the shared `OdinEditor` base for Forge-owned custom inspectors. It applies the theme while preserving Odin's property tree, serialized configuration and validation. Retain base drawing and cleanup when extending it. Theme instances belong to the window or inspector, are initialized within an active IMGUI draw context, and are disposed when their owner disables or closes.

Commandments must reuse God's canonical theme directly. The passive Companion adapter has no independent dashboard or generated theme. It retains only a legacy-window handoff notice. Never create a private Commandments theme fork.

God's retired `Tools~/SyncEditorTheme.ps1` path explains the migration; it no longer generates Companion implementation assets. No Unity implementation files belong in this documentation repository.

The independent BigBang initial installer also remains free of God and vendor assembly dependencies. It consumes a **generator-produced dependency-free subset** of the canonical tokens, primary window opener and UI Toolkit stylesheet/application method. Exclude all IMGUI/Odin/vendor integration regardless of define symbols; a stale `ODIN_INSPECTOR` symbol must still compile without Odin. Record the canonical source commit, keep generation and parity checking in BigBang source-maintenance tooling, and reject source/stylesheet drift. The first release generates from God `3f3c7795ecf01202ec97fcb91ec0db910adbeb2b`; canonical implementation standard 1.2.0 is distinct from this technique version. The same geometry, accessibility, semantic states and actual visual acceptance gates apply. This exception does not relax required licensed assemblies for God and dependent bricks.

Keep the theme's IMGUI/Odin and UI Toolkit representations consistent. Use the shared USS and supported UI Toolkit controls for new custom Editor UI, as required by the Technical Technique. Preserve meaningful Odin configuration, grouping, validation, serialized fields and existing inspector workflows. Existing Odin or IMGUI windows may adopt the shared theme without a forced framework conversion; do not replace working Odin configuration with bespoke controls merely to restyle it.

Theme assets, cached styles and generated textures must have deliberate ownership and cleanup. Avoid allocating textures, reading assets or rebuilding the complete style set on every repaint. Do not leak callbacks across window closure, assembly reload or play-mode transitions. Scope styling to Forge-owned visual roots and restore temporary IMGUI state even when drawing fails.

## Required validation before publication

An Editor UI change is conforming only when the following evidence is recorded for the affected surfaces:

1. The shared API/stylesheet is reused; canonical tokens match this technique. For a canonical theme change, verify God's Commandments view and regenerate/check BigBang's selected subset where affected before publication.
2. Compile and run relevant focused Editor checks in the exact Unity version required by the Technical Technique. No runtime assembly may acquire a theme or `UnityEditor` dependency.
3. Inspect the actual UI at its normal size and a narrow docked size, and check floating/docked behavior, scrolling, long labels and expanded messages. Controls and explanations must remain reachable without clipping or overlapping content.
4. Check readability with Unity's light and dark host skins and at normal and high display scaling. The Forge content remains dark in both skins; neighboring native/Odin controls remain legible. Record unavailable visual environments instead of claiming they passed.
5. Exercise the affected enabled, disabled, selected, hover, keyboard-focus, busy, success, warning and failure states. Verify the visible disabled reason and next step and semantic severity labels wherever applicable.
6. Confirm the real actions, settings persistence, Undo/serialized authoring behavior, cancellation, operation reporting and existing animation still work where touched. A visual change must not fabricate results, hide a failure, change package lifecycle or overwrite an open scene.
7. Preserve representative visual evidence and report any unchecked surface honestly. Source review or a passing compilation is not evidence that the rendered layout passed visual inspection.

The owning package version must increase before publication, and all affected package metadata, runtime-reported versions, changelogs and catalogue data must remain consistent under the entry point's versioning rules. Changes to this standard also advance the technique version and documentation package version.

## New-brick and review gate

Apply the Appearance Technique's workflow and authoring-feedback gate alongside this foundation. Do not reproduce its policy or create a competing palette; verify both selected standards in the owning package.

Every new brick with Editor UI must select this technique through the manifest, use the shared implementation from its first Editor screen, and include theme conformance in its implementation review. Every modification to existing Forge-owned Editor UI must preserve or establish conformance for the affected surface. A visual review must reject local palette forks, color-only status, unexplained important disabled controls, unreadable host integration and falsely reported progress.

This documentation standard is mandatory for participating maintainers and agents; it is not a claim of universal automatic enforcement. Native AI routing can direct supported tools to the entry point, but a tool that ignores those routes or the selected techniques may still produce nonconforming code. Validators, focused behavior checks and actual visual review provide evidence within their tested scope; they do not prove that every future agent or every rendered state will comply automatically.
<!-- GEURTS-SECTION:END -->
