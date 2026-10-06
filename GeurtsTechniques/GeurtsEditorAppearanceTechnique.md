<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Editor Appearance Technique

**Version:** 0.1.3
**Status:** Normative mandatory standard
**Primary audience:** Geurts Game Forge brick and Editor-tool maintainers
**Secondary audience:** AI coding agents and human developers
**Required package path:** `GeurtsTechniques/GeurtsEditorAppearanceTechnique.md`

## 1. Scope and authority

`GeurtsTechniqueManifest.md` selects this technique and owns applicability, reading order, versions and cross-document conflict resolution. This technique owns Forge-owned Editor workflow presentation, tabs, collapsible content sections, callouts and inline authoring validation. The [Editor UI Theme Technique](GeurtsEditorUIThemeTechnique.md) remains the sole owner of the palette, shared styling APIs, geometry, accessibility foundation and truthful operation status. The [Technical Technique](GeurtsTechnicalTechnique.md) owns technical priorities, dependencies, serialization, the UI Toolkit baseline and core no-code use with supported code extensions. The [Brick Contract](GeurtsBrickContract.md) owns lifecycle and integration; the [Diagnostics Technique](GeurtsDiagnosticsTechnique.md) owns logging and diagnostic meaning.

Apply this mandatory standard to all existing and future Forge-owned Editor windows, standalone and God-embedded brick views, custom inspectors, component and ScriptableObject authoring, setup and settings tools. Apply it to the affected surface whenever work creates or changes that surface. Keep ordinary configuration understandable without code and preserve supported code extensions that use the same underlying rules.

This standard is **Editor-only**. Runtime/player UI, game art, third-party inspectors and Unity's global skin are excluded. Do not access `Docs/GameDesign/`, alter scenes or invent game-design facts to apply it. Keep neighboring native and vendor controls readable when Forge controls are embedded in their host.

The independent BigBang installer must use supported Unity/UI Toolkit equivalents before God and Odin are installed. This requirement must not introduce God or vendor dependencies into BigBang. Its generated theme subset retains the Theme and BigBang Techniques' provenance and parity requirements. The passive Companion adapter remains a handoff adapter: no dashboard, updater, menus or vendor references are added. Local Commandments content remains readable without God.

## 2. Appearance quality gate

Editor appearance is a first-class quality requirement and a Definition of Done gate for every affected Forge-owned Editor surface. A tool is not complete merely because its controls compile or its actions work: users must be able to find the right workflow, understand the controls and discover problems without searching the Console.

This is a quality gate within the existing Technical Technique. It does not add, duplicate or reorder technical priorities, change the multiplayer override or justify unnecessary runtime cost. Review appearance alongside proportionate behavior checks and record any unavailable acceptance evidence honestly.

## 3. Shared visual foundation

Use the Theme Technique's very dark surfaces, consistent green accents, readable labels, deliberate hierarchy, shared spacing and intuitive controls. Reuse its canonical implementation and semantic severity tokens; do not create another palette or private theme. Green identifies branding, interaction and emphasis, never warning or error severity.

Preserve the Theme Technique's window size, docking, focus, scrolling, disabled-action explanation and truthful-status requirements, including its green working, orange needs-attention and red error outlines with visible text labels. A callout or foldout must not conceal an important reason an action is unavailable. Long labels, paths and expanded messages must remain readable and reachable at normal and narrow sizes.

## 4. Meaningful Odin use and framework boundary

Use Odin Inspector extensively and meaningfully wherever its supported inspectors, grouping, layout, validation, callouts, tables and window capabilities improve Forge authoring. Prefer supported Odin property authoring to a duplicate bespoke inspector. Follow the Technical Technique's installed-version, licensing, assembly-reference, serialization, Undo and safety requirements; do not add attributes just to increase their number.

New custom Editor UI retains the Technical Technique's UI Toolkit baseline. Use supported Odin authoring integration where appropriate and verify it against the installed compatible version. Existing Odin/IMGUI workflows can adopt this standard without an automatic framework conversion. BigBang uses the equivalents described in scope; its prerequisite boundary is not an exemption for God or dependent bricks.

Odin Inspector validation is sufficient for this standard. The separately sold Odin Validator product is not required. Automatic section or tab severity aggregation is not guaranteed by standard Odin attributes: implement or reuse an Editor presentation adapter over shared validation results where needed, and verify the actual behavior. Do not describe an unimplemented adapter as a released God API.

## 5. Tabs and workflows

Use tabs extensively where they improve navigation between substantial, related workflows. Give each tab a concise, clear label and a coherent purpose; keep related configuration and its relevant actions together. Do not create tabs for every field, hide an important comparison across separate tabs, or add nested navigation that makes a simple workflow harder to use.

Use supported Odin `TabGroup` authoring or equivalent UI Toolkit tab controls according to the framework boundary above. A small surface may use one clear workflow with labelled sections when tabs provide no benefit. Document non-obvious tab purposes and controls through labels, tooltips or nearby guidance.

Inactive tabs must expose warning/error indicators with the same discoverability as collapsed section headers. Use severity text and a distinct icon in the visible tab header or an adjacent clearly associated summary; colour or a tooltip alone is insufficient. Selecting a tab reveals its findings beside the relevant fields, without losing the user's other authored values or navigation state.

## 6. Labelled, collapsible content sections

Every content section must have a visible descriptive header and collapsible content. Its header remains visible when collapsed. Use sections to group related controls and actions; reserve the always-visible window title, navigation and required operation/consent controls for their existing host responsibilities. Collapsing a content section must never hide a required confirmation or block access to cancellation and failure reporting.

Use Odin `BoxGroup` extensively for clear grouping in applicable Odin authoring. A BoxGroup alone is not collapsible. Combine boxed grouping and a supported foldout through distinct hierarchical group paths, or use a supported custom group/Editor adapter with the same behavior. Do not stack BoxGroup and FoldoutGroup at the same group path and assume they combine. Follow the installed Odin version's supported group hierarchy; verify the visible header and collapsed state in Unity.

For example, a conceptual parent foldout `configuration` can own the child box `configuration/values`. These are distinct paths describing a hierarchy, not a drop-in C# implementation. Give the user-facing parent a meaningful label and avoid a duplicate unlabeled or misleading child header. In UI Toolkit, use an equivalent labelled foldout with the shared panel styling. A tab does not replace the section's collapsible header requirement.

Preserve user expansion/navigation state through supported Editor mechanisms; do not serialize UI expansion state into game assets. Recommended expansion defaults, persistence across sessions and badge artwork are implementation choices, not additional mandatory defaults. Keep important findings discoverable regardless of expansion state.

### 6.1 Component Help sections

Expose the [Technical Technique's Major Component Help](GeurtsTechnicalTechnique.md#major-component-help) in a clearly labelled **Help** section for each major component presented by an inspector or tool view. Make its location easy to find, including in standalone and God-embedded views where supported. A shared Help section may cover closely related controls in one major component; unrelated major components need their own relevant guidance. Include essential setup/use instructions locally rather than offering only an external link or tooltip.

Use the labelled, collapsible section pattern above. Reserve the full height of expanded/wrapped Help content and ample spacing before neighbouring fields, following section 7.1; allow scrolling without overlapping or hiding controls. Opening Help is read-only and must not trigger setup, package acquisition, updates or other mutations.

## 7. Useful severity callouts

Provide many useful nearby information, warning and error callouts wherever they help users understand a workflow, prerequisite, setting, consequence or correction. Use the supported Odin InfoBox/validation presentation or a themed Editor equivalent. There is no quota: avoid repeating instructions, filling empty space or overwhelming the controls with stale or irrelevant messages.

Each callout must include severity text and a distinct severity icon: an information icon for information, a warning triangle for warnings and an error icon for errors. Use the Theme Technique's readable shared severity styling. Colour alone is insufficient, and green branding must never replace warning/error styling. Do not rely on a tooltip for essential instructions or the explanation of a blocked action.

Place the message near its relevant control or action. Explain what the user needs to know, the consequence where useful and the practical next step. Distinguish neutral guidance from an authoring finding and distinguish an authoring finding from an operation that actually failed. Remove or update callouts when their underlying state changes.

### 7.1 Inspector spacing and overlap prevention

Be especially wary of layout regressions after Commandments-compliance edits. Added instructions, information boxes, validation messages and group headers must not overlap serialized fields or other controls. Every affected inspector must provide ample space for its actual content, with clear separation between callouts, labels, fields, buttons and section headers. Nearby guidance means visibly adjacent, never drawn over the field it explains.

- Reserve the full rendered height of each message and control, including wrapped text, icons, padding and the gap before the next element. Recalculate layout when the available width, displayed message, validation state or expansion state changes. Never allocate a single-line or fixed short height for content that can wrap or grow.
- Use the shared Theme spacing and supported Odin/Unity layout mechanisms. Custom drawers and manually positioned controls must report and reserve the same complete area they draw. Do not layer manual rectangles over automatically laid-out Odin fields, use negative spacing or margins to squeeze content together, or draw the same content twice through base and custom rendering.
- Leave clear vertical gaps between messages and their associated fields, and sufficient inner padding around boxed sections. If the current shared spacing is inadequate, improve the canonical layout through its owning package rather than creating a private spacing system. Allow the inspector to grow and scroll instead of compressing messages or reducing text readability to fit.
- Check supported normal and narrow Inspector widths, long and multiple simultaneous messages, nested/expanded sections, and messages appearing or clearing during editing. Confirm labels, fields and clickable controls remain fully visible and usable; hiding guidance, truncating essential text or requiring a wider Inspector is not an overlap fix.

Overlapping content is a failed appearance review, even when the inspector compiles and its actions work. Apply the native visual checks in section 10 and the Theme Technique; a source-only compliance pass cannot establish that spacing is sufficient.

## 8. Inline authoring findings and logging boundary

Routine authoring validation findings must appear inline at the affected field or group. Explain the problem and how to correct it, retain useful object/field context and clear the finding when fixed. Use the Technical Technique's supported Required, range and ValidateInput constraints where suitable; domain validation must share underlying rules between the Editor, public code extensions and relevant repeatable checks.

Do not report routine invalid authoring data through Debug.Log, Debug.LogWarning or Debug.LogError instead of inline findings. Do not spam the Unity Console or Diagnostics on repaint, property drawing or OnValidate while an ordinary finding remains unresolved. Opening or collapsing the panel must not repeatedly emit the same finding. Inline feedback must remain available when Diagnostics is absent.

Genuine operational failures and unexpected exceptions still follow the [Diagnostics Technique's logging contract](GeurtsDiagnosticsTechnique.md#shared-logging-contract). Do not suppress them or recategorize a real failed operation as harmless authoring guidance. Owning status/health reporting preserves useful failure details independently of logging availability. Apply that owner's capture-only, no Unity fallback policy; this technique adds no logging implementation or alternate route.

Finding presentation must not mutate serialized data. Explicit fixes and authoring actions retain Undo, dirty/prefab recording, multi-object handling, safe value guards and any required confirmation. Do not auto-fix data, load scenes, replace assets or perform package/content updates merely to make a validation indicator disappear.

## 9. Hidden findings, state and lifecycle

Warnings and errors must remain visible on collapsed section headers. Aggregate current descendant findings into a concise indicator using the highest applicable severity, severity text and its distinct icon. The expanded content retains individual actionable messages. Inactive tabs must also expose their current descendant warnings/errors as specified above; a clean visible tab must not conceal a broken inactive one.

Evaluate relevant authoring rules independently of whether a section or tab has been opened. Do not validate only drawn controls. Use shared results and appropriate change/invalidation triggers instead of expensive full validation on every repaint. Invalidate and refresh results after relevant edits, Undo/Redo, selection changes and other affected lifecycle events; clear stale findings when the problem is corrected or the inspected object changes. Dispose callbacks and cached Editor resources with their owner.

Distinguish Not checked, Unavailable and genuinely checked/clean states. An unchecked section or inactive tab must not appear clean merely because its controls have never been drawn. Preserve per-object context for multi-object selection, explain mixed or partially checked results and report clean only for the scope actually checked. Aggregate presentation must not invent success, hide an exception or trigger unsafe automatic fixes/opening behavior.

## 10. Verification, adoption and Definition of Done

Before publishing an implementation or executable example, compile it with the Technical Technique's exact Unity and resolved dependency versions, and run proportionate focused Editor checks. Verify inline findings, correction/clearing, collapsed headers, inactive tabs, checks before first opening, unchecked states, object changes, Undo/Redo, multi-object editing, prefab/asset persistence and affected lifecycle cleanup. Confirm no repeat logs are emitted by routine invalid data or repaint, while genuine failures still reach the established logging route. Test BigBang without God and vendor assemblies if that surface is touched; no runtime assembly may gain an Editor documentation dependency.

Inspect the actual native Unity UI using the Theme Technique's normal/narrow sizes, floating/docked layout, light/dark host skins and normal/high scaling requirements. Verify each affected major component has reachable Help with accurate setup/use instructions and readable expanded content. Check useful callouts and distinct icons, expanded/collapsed sections, inactive tabs, long messages, scrolling, keyboard focus and affected enabled/disabled/busy/failure controls. Explicitly verify ample inspector spacing and no overlap between instructions/callouts and fields, including when multiple messages wrap or appear after a validation change. A standalone and God-embedded view must both retain reachable content and host navigation where supported.

Follow the Automation Technique's computer-control policy. This standard does not authorize interactive desktop tests or disturbing the user's live Unity project. Prefer isolated fixtures and supported background checks; request explicit authorization only when required interactive control cannot be replaced, or record a human verification path and the exact unverified surface. Text validation, source review and successful compilation do not establish rendered UI acceptance.

Existing installations are adopted deliberately as their affected surfaces are maintained; do not automatically rewrite scripts, assets, settings, layouts or user content. See [the 0.44.0 adoption note](../Migrations/v0.44.0.md). This documentation release specifies the gate; it does not retrofit released bricks or certify their native appearance. Record actual conformance, exceptions and missing evidence within each owning package's validation report, increase its version and publish through the existing release workflow.

An affected Editor surface is done only when its shared theme, useful Odin/equivalent authoring, appropriate tabs, labelled collapsible sections, component Help, meaningful severity callouts, inline findings, discoverable hidden problems, preserved authoring behavior and native visual acceptance have been verified in their applicable scope. This is a maintainer/agent standard, not universal automatic enforcement.

## Reference material

Consult official documentation against the project's installed compatible Odin version. These references explain supported grouping and inspector presentation; they do not select a newer dependency or prove hidden-finding aggregation for Forge:

- [Odin group attributes and hierarchical groups](https://odininspector.com/tutorials/using-attributes/group-attributes).
- [Odin BoxGroup](https://odininspector.com/attributes/box-group-attribute), [FoldoutGroup](https://odininspector.com/attributes/foldout-group-attribute) and [TabGroup](https://odininspector.com/attributes/tab-group-attribute).
- [Odin InfoBox](https://odininspector.com/attributes/info-box-attribute) and [ValidateInput](https://odininspector.com/attributes/validate-input-attribute).
