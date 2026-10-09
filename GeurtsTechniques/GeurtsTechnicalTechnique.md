<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Technical Technique

**Version:** 0.20.2
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsTechnicalTechnique.md`

This is the short mandatory technical core for first-party game code, bricks, Editor tools, tests and automation. Read additional technical topics only when the manifest selects them. Use the current published packages in the catalogue; an installed older version is a compatibility fact, not the target for new guidance. Changelogs and historical release summaries are never routine mandatory reading. A requested migration or historical review selects its own history explicitly. No reading rule authorizes package installation or live-project changes.

## Technical Priority Order

The **Core Principles** are a strict priority order, not an unordered list of preferences.

These priorities and the Codex compatibility requirements below apply to **every Geurts Game Forge brick and all first-party code Codex creates or materially updates while following Forge documentation**, including ordinary project-specific/game code, runtime systems, Editor tools, tests and automation. The narrower scope of the reusable-framework compliance header does not exempt ordinary game code from these requirements: extendibility remains the first technical priority, subject to the multiplayer exception below.

When a decision requires a trade-off, apply this priority order:

1. **Extendibility** - Code must be modular and easy to expand.
2. **Efficiency** - Avoid unnecessary runtime cost; when efficiency genuinely conflicts with readability, runtime efficiency wins.
3. **Readability** - Code should remain clear to humans and AI agents without imposing avoidable runtime cost.
4. **Updated** - Use supported, non-deprecated APIs and practices in Unity 6000.6.3f1 and the project's compatible dependencies, subject to the manifest-selected Unity topic.
5. **Documented** - Major components, public APIs, and serialized fields must be clear and documented.

These priorities are not equal. A higher priority wins over a lower priority within this technique's subject. A package change must be selected and versioned through the manifest rather than inferred from a stray copy.

### Multiplayer Exception

For multiplayer systems, **network efficiency overrides all other priorities**. This override applies regardless of the selected networking framework.

Cross-document applicability and conflicts defer to the manifest. This technique's priority order applies only to actual technical trade-offs within its assigned subject.

## No-Code Module Use and Code Extensions

**Every existing and future Geurts Game Forge module must support normal intended use without user-written or edited code, except for narrow, documented special cases.** This includes bricks, foundational services and independent tools. No-code governs consumption; implementation retains the technical priorities and multiplayer override.

### Normal use through the Editor

- Provide supported Editor workflows for setup, configuration, authoring, module connections, standard actions, inspection and testing. Reuse meaningful Odin inspectors, Forge tools, components, ScriptableObjects, presets, references and serialized actions/events. Include clear labels, useful defaults, validation and actionable prerequisite errors.
- Routine use must not require C#, source patches, manual UXML/USS/JSON edits, scripts or undocumented calls. Expose references and bindings through controls; a code sample alone is insufficient. Custom visual scripting is not required.
- Keep configuration persistent, discoverable and editable. Preserve Unity asset identities, Undo and existing content. Runtime functionality must work in the Windows player without Editor assemblies or Codex; Editor-only tools retain that scope.

### Code remains a supported first-class path

Provide documented public APIs and focused extension points for developers and Codex to configure, invoke, compose and extend modules. Describe entry points, types, lifecycle, ownership, dependencies, validation, errors and side effects with small version-accurate examples. Prefer interfaces, events and adapters over package patches, private reflection or copied implementations.

Editor and code paths must share services, configuration contracts and validation, with equivalent behaviour, operation guards and cleanup. Codex uses supported configuration for standard behaviour and APIs/extensions for custom code. This adds no live connector, runtime AI or mandatory peer-brick dependency.

### Special exceptions

Code-required exceptions are limited to new project-specific behaviour, external integrations that supported configuration cannot express, or an explicitly requested code-only workflow. The owning usage guide must explain the affected capability, reason, prerequisites, minimum supported extension and Editor alternative or limitation. Ordinary use stays available without code. Missing setup controls, hidden bindings, unfinished tools or an "advanced" label are not exceptions.

For new modules and materially changed workflows, verify representative setup/use through Editor controls without hand-authored code, plus the affected API/extension path and shared behaviour. Record prerequisites, results, exceptions and existing usability gaps. This does not certify released modules, migrate installations or authorize unrelated rewrites.

## Windows Development and Build Workflow

Develop, test and build **on Windows for Windows, using Unity and Codex**. Use the supported Unity Editor, Codex-assisted implementation/validation and Windows PowerShell-compatible host automation. Another host or player target requires an explicit user change.

Select the **Windows Build Profile**, scene list, architecture and scripting backend explicitly. Validate affected behaviour in the Windows Editor and, for runtime/build changes, the resulting Windows player. Preserve unrelated settings, profiles and open scenes.

**Steam on Windows x64 is the primary release target.** The manifest-selected [Steam Integration Technique](GeurtsSteamIntegrationTechnique.md) owns preparation, Steamworks.NET prerequisites, optional platform services and evidence. Prepare projects before AppID/store/depot/release-pipeline setup; keep unconfigured local development usable. Steam Deck, Proton, SteamOS and other operating systems are outside this target. This policy does not certify or retrofit released bricks.

**The Steam API through Steamworks.NET is a mandatory project prerequisite**, alongside Odin Inspector and Quantum Console. Verify its supported managed APIs and Windows x64 native-plugin files through the Steam Integration owner. BigBang verifies this requirement before installation and existing-God handoff. Native Steam activation, client/account/AppID checks and distribution remain separate; the independent installer still compiles and opens when prerequisites are missing.

Use consistent **CRLF** (`\r\n`) for new/edited first-party C#, Markdown, JSON, PowerShell, batch and other text files. Record this in the owning repository's Git attributes and verify changed working-tree files. This repository uses `* text=auto eol=crlf`; Git-normalized storage and hashes do not change authoring policy.

Respect each file's mutation contract. Preserve binaries, vendor/generated files and Unity serialization through supported tools; do not reformat untouched files or overwrite protected content for newlines. Managed archives/exact templates retain source bytes; user regions and create-if-missing targets retain their byte-preservation rules. Keep the comprehensive `.gitignore` intact; defensive exclusions do not establish other supported hosts/targets.

### Absolute path length and workspace roots

Keep **every full absolute file and folder path below 260 characters: 259 characters maximum** in both **Codex projects** and **Geurts Game Forge projects**, including repositories, worktrees, Unity projects, fixtures and tools. Count the resolved drive/share prefix, separators, folders, filename and extension. Relative paths and Windows long-path support do not waive this limit; 260 is invalid.

Start with short roots and shallow folders, such as `C:/Dev/Game` or `C:/Dev/Task`. Reserve room for dependency extraction, caches, temporary files, generated code, build intermediates and outputs. Include Unity `Library/PackageCache`, `Library/Bee`, `Temp` and variable package/version/hash suffixes. Check each tool's actual cache/temp locations, including those outside the root.

Before creating, copying, extracting or moving content, check absolute destinations and foreseeable generated descendants against the limit. Combine the root with the deepest known suffix and allowances for variable versions, hashes and temporary names. State estimates/reserves when names are unknown, then check concrete paths before generation/extraction. Recheck after dependency, build or layout changes; do not wait for an operation to fail.

For an intended path at or above 260 characters, report the **exact full path and its character count**, choose a shorter new-content location and recheck. Do not silently rename/move user content, shorten package/asset identities or change user roots/settings. Existing-content migration requires the exact conflict, proposed destination, explicit authorization and preservation rules. Path checks grant no otherwise excluded access.


## Shared implementation boundaries

- Inspect relevant source, installed APIs and dependencies before implementing. Reuse suitable Geurts bricks under the [Brick Contract](GeurtsBrickContract.md). Do not fabricate APIs, add speculative architecture or rewrite unrelated working code.
- Preserve existing content, asset GUIDs, public/serialized contracts and vendor/generated files. Use supported Unity APIs for owned serialization. Necessary breaking changes require a coordinated versioned migration.
- Use explicit failure handling and cleanup. Never expose secrets, present placeholders as complete, swallow failures or leave avoidable partial states. Review affected references, paths, lifecycle, edge cases, regressions and security alongside performance.
- Use Unity 6.6 (6000.6.3f1) and current compatible, non-deprecated APIs for Unity work; the [Unity topic](GeurtsUnityTechnique.md) owns exact dependency, compiler and validation requirements. God and dependent bricks retain required licensed Odin Inspector and Quantum Console under the [Brick Contract](GeurtsBrickContract.md#identity-and-dependencies). The [BigBang Technique](GeurtsBigBangTechnique.md) owns its narrow prerequisite-only exception. Host PowerShell and this documentation repository do not require Unity/vendor assemblies.
- All existing and future Forge-owned Editor UI must follow the [Editor UI Theme Technique](GeurtsEditorUIThemeTechnique.md) and [Editor Appearance Technique](GeurtsEditorAppearanceTechnique.md). Keep it spacious, with useful Help and meaningful Odin/equivalent authoring; these standards exclude player-facing UI. Appearance is a quality gate within the existing technical priorities, not another priority list.
- Persistent runtime objects use retained bootstrap scenes, never direct or indirect `DontDestroyOnLoad`. Read the [Bootstrap topic](GeurtsBootstrapTechnique.md) for affected ownership, scene or transition work.
- Use Diagnostics when a compatible provider is available; ordinary logs are no-op when unavailable, while genuine failures remain independently visible. The [Diagnostics Technique](GeurtsDiagnosticsTechnique.md) owns capture, audience, commands and metrics. A runtime console and FMOD are optional; installing the licensed QC library does not require installing a console.
- First-party asset and script names follow the [Naming Technique](GeurtsNamingTechnique.md); freely authored ID values use `lower_snake_case`, preserving fixed schema, vendor, package, GUID and hash formats. The [Code topic](GeurtsCodeTechnique.md) owns exact validation and code-documentation rules.

<!-- GEURTS-SECTION:BEGIN FORGE-DEVELOPMENT-ONLY -->
## Reusable Framework Compliance Header

Insert the following comment only when the AI creates or materially edits a reusable cross-game Geurts Game Forge framework, library, or tooling component intended to be shared across games:

```csharp
// IMPORTANT: This script must comply with GeurtsGameForgeCommandments/GeurtsTechniques/GeurtsTechnicalTechnique.md and folder placement rules in GeurtsGameForgeCommandments/GeurtsTechniques/GeurtsFolderStructureTechnique.md.
```

Geurts Game Forge Bricks is a positive example of shared framework code. An ordinary game-specific implementation is excluded even when AI-generated; for example, a project-specific 2D map generator does not receive this header merely because an AI created it. AI authorship alone is insufficient. If intended ownership or reuse is unclear, ask before adding the header.

Never modify third-party packages, vendored code, generated code, read-only files, or a format/tooling surface that forbids the header merely to add compliance text.

<!-- GEURTS-SECTION:END -->

## Codex compatibility

Design every new or materially changed first-party component so humans and Codex can discover its responsibility, configuration, supported APIs, ownership, lifecycle, failure behavior and extension points. Provide concise version-accurate examples and proportionate repeatable checks. Keep code and no-code workflows on the same services. This adds no runtime AI, connector or optional peer dependency and does not certify existing components.

## Verification and completion

Implement the complete authorized outcome, including affected registration, references, tests and documentation. Verify normal/failure paths, repeatability, cleanup, compatibility and relevant performance. Report actual evidence and unavailable checks honestly; compilation alone does not establish rendered UI, physical input or Windows-player acceptance. Follow the Automation owner for questions, delivery and computer-control boundaries.

For changed C# scripts, apply the Code topic's naming, tooltips, public-class and public-method XML descriptions and Major Component Help. For Unity changes, apply the Unity topic's exact compile/test/build requirements. Validate no-code and supported API use where applicable; avoid unnecessary per-frame allocations and unjustified expensive `Update()` logic. Read Bootstrap, Authoring, Audio, Commands, Diagnostics, multiplayer and project-design guidance only for affected work, as selected by the manifest.

## Performance Trade-Off Guidance Under Efficiency

Apply this guidance only within the five-priority order defined above and the applicable project GDD. It is not a second priority list.

- Prefer frame-rate stability over shorter loading times when the applicable design facts do not require a different player-facing trade-off.
- Prefer runtime performance over editor convenience when gameplay experience is materially affected.
- For multiplayer work, apply the network-efficiency override defined in **Multiplayer Exception** above.

<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->
## Existing fragment links

These redirects preserve links from existing guides; they do not select additional topics.

<a id="unity-600063f1-compatibility-baseline"></a>[unity-600063f1-compatibility-baseline](GeurtsUnityTechnique.md#unity-600063f1-compatibility-baseline)

<a id="editor-and-dependency-selection"></a>[editor-and-dependency-selection](GeurtsUnityTechnique.md#editor-and-dependency-selection)

<a id="c-and-net"></a>[c-and-net](GeurtsUnityTechnique.md#c-and-net)

<a id="current-api-choices"></a>[current-api-choices](GeurtsUnityTechnique.md#current-api-choices)

<a id="async-and-lifecycle"></a>[async-and-lifecycle](GeurtsUnityTechnique.md#async-and-lifecycle)

<a id="unity-66-migration-checks"></a>[unity-66-migration-checks](GeurtsUnityTechnique.md#unity-66-migration-checks)

<a id="verification-and-evidence"></a>[verification-and-evidence](GeurtsUnityTechnique.md#verification-and-evidence)

<a id="coding-standards"></a>[coding-standards](GeurtsCodeTechnique.md#coding-standards)

<a id="asset-and-scene-object-names"></a>[asset-and-scene-object-names](GeurtsCodeTechnique.md#asset-and-scene-object-names)

<a id="id-names"></a>[id-names](GeurtsCodeTechnique.md#id-names)

<a id="variables"></a>[variables](GeurtsCodeTechnique.md#variables)

<a id="enums"></a>[enums](GeurtsCodeTechnique.md#enums)

<a id="ui"></a>[ui](GeurtsAuthoringTechnique.md#ui)

<a id="code-documentation-standards"></a>[code-documentation-standards](GeurtsCodeTechnique.md#code-documentation-standards)

<a id="purpose"></a>[purpose](#geurts-technical-technique)

<a id="purpose-1"></a>[purpose-1](GeurtsCodeTechnique.md#purpose)

<a id="major-component-help"></a>[major-component-help](GeurtsCodeTechnique.md#major-component-help)

<a id="public-classes"></a>[public-classes](GeurtsCodeTechnique.md#public-classes)

<a id="public-methods"></a>[public-methods](GeurtsCodeTechnique.md#public-methods)

<a id="private-methods"></a>[private-methods](GeurtsCodeTechnique.md#private-methods)

<a id="odin-inspector-usage"></a>[odin-inspector-usage](GeurtsAuthoringTechnique.md#odin-inspector-usage)

<a id="required-project-scenes"></a>[required-project-scenes](GeurtsBootstrapTechnique.md#required-project-scenes)

<a id="bootstrap-scenes-and-runtime-persistence"></a>[bootstrap-scenes-and-runtime-persistence](GeurtsBootstrapTechnique.md#bootstrap-scenes-and-runtime-persistence)

<a id="game-audio-and-sound-design"></a>[game-audio-and-sound-design](GeurtsAudioTechnique.md#game-audio-and-sound-design)

<a id="ai-integration-technique"></a>[ai-integration-technique](GeurtsGameAITechnique.md#ai-integration-technique)

<a id="runtime-console-integration"></a>[runtime-console-integration](GeurtsCommandsTechnique.md#runtime-console-integration)

<a id="required-quantum-console-library-and-optional-console-use"></a>[required-quantum-console-library-and-optional-console-use](GeurtsCommandsTechnique.md#required-quantum-console-library-and-optional-console-use)

<a id="accessibility"></a>[accessibility](GeurtsCommandsTechnique.md#accessibility)

<a id="command-rules"></a>[command-rules](GeurtsCommandsTechnique.md#command-rules)

<a id="full-names-only"></a>[full-names-only](GeurtsCommandsTechnique.md#full-names-only)

<a id="naming-convention"></a>[naming-convention](GeurtsCommandsTechnique.md#naming-convention)

<a id="help-commands"></a>[help-commands](GeurtsCommandsTechnique.md#help-commands)

<a id="command-classification"></a>[command-classification](GeurtsCommandsTechnique.md#command-classification)

<a id="cheat-commands"></a>[cheat-commands](GeurtsCommandsTechnique.md#cheat-commands)

<a id="multiplayer-efficiency-rule"></a>[multiplayer-efficiency-rule](GeurtsMultiplayerTechnique.md#multiplayer-efficiency-rule)

<a id="combined-unity-cli-and-editor-workflow"></a>[combined-unity-cli-and-editor-workflow](GeurtsUnityTechnique.md#combined-unity-cli-and-editor-workflow)

<a id="manifest-boundary"></a>[manifest-boundary](../GeurtsTechniqueManifest.md#1-manifest-resolver)

<a id="selectively-adapted-engineering-guidance"></a>[selectively-adapted-engineering-guidance](#shared-implementation-boundaries)

<a id="provenance-and-authority"></a>[provenance-and-authority](../GeurtsTechniqueManifest.md#1-manifest-resolver)

<a id="understand-inspect-and-reuse"></a>[understand-inspect-and-reuse](#shared-implementation-boundaries)

<a id="implement-integrate-and-handle-failure"></a>[implement-integrate-and-handle-failure](#verification-and-completion)

<a id="verify-test-and-preserve-compatibility"></a>[verify-test-and-preserve-compatibility](#verification-and-completion)

<a id="technical-evidence-for-reporting"></a>[technical-evidence-for-reporting](#verification-and-completion)

<a id="boundaries-with-other-subjects"></a>[boundaries-with-other-subjects](#shared-implementation-boundaries)

<a id="runtime-debugging-and-logging"></a>[runtime-debugging-and-logging](GeurtsDiagnosticsTechnique.md#shared-logging-contract)

<a id="objective"></a>[objective](GeurtsDiagnosticsTechnique.md#shared-logging-contract)

<a id="logging-standards"></a>[logging-standards](GeurtsDiagnosticsTechnique.md#shared-logging-contract)

<a id="performance-monitoring"></a>[performance-monitoring](GeurtsDiagnosticsTechnique.md#six-independent-overlay-metrics)

<a id="objective-1"></a>[objective-1](GeurtsDiagnosticsTechnique.md#six-independent-overlay-metrics)

<a id="requirements"></a>[requirements](GeurtsDiagnosticsTechnique.md#six-independent-overlay-metrics)

<a id="overlay-design"></a>[overlay-design](GeurtsDiagnosticsTechnique.md#six-independent-overlay-metrics)

<a id="example-quantum-console-commands"></a>[example-quantum-console-commands](GeurtsDiagnosticsTechnique.md#six-independent-overlay-metrics)

<a id="definition-of-done-for-ai-created-or-modified-scripts"></a>[definition-of-done-for-ai-created-or-modified-scripts](#verification-and-completion)

<!-- GEURTS-SECTION:END -->
