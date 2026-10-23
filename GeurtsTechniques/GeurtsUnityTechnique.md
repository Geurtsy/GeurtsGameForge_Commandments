<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Unity Technical Topic

**Version:** 0.3.4
**Unity minimum:** Unity 6.6 (6000.6.3f1) or newer
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsUnityTechnique.md`

### Combined Unity CLI and Editor workflow

Use Unity's built-in command-line interface (CLI) as the default for repeatable imports, compilation checks, automated Edit Mode and Play Mode tests, builds and scripted validation when it can verify the affected behavior correctly. Use the Unity Editor or target player for the visual, interaction and gameplay checks that require them. Combine these methods according to the evidence each check needs; a successful batch run does not establish visual or interactive correctness. The [Automation Technique's computer-control policy](GeurtsGameForgeAutomationTechnique.md#computer-control-during-implementation-and-tests) still requires explicit user authorization for interactive testing on the user's computer.

| Work | Preferred method | Evidence |
|---|---|---|
| Import and compilation checks | Background Unity CLI batch run in the selected Editor version. | Completed process, exit code and full Editor log, including compiler errors and warnings. |
| Repeatable Edit Mode and Play Mode tests | Unity Test Framework CLI with the intended test platform and focused suite. | Test result XML, pass/fail/skip counts and Editor log. |
| Windows builds and scripted validation | Unity CLI with the intended Windows Build Profile or supported static Editor method. | Build or validation report, exit code and log; exercise the resulting player when required. |
| Visual layout, input/focus behavior and live gameplay | Relevant Editor or Windows player inspection, using supported APIs or isolated fixtures where they provide sufficient evidence. | Actual rendered/behavior evidence for the affected surface; report any unavailable interactive check. |

For a CLI run:

- Select the exact supported Editor patch from the project's baseline and resolved dependencies. Invoke its `Unity.exe`; built-in Editor automation does not require installing a separate CLI product or a live connector.
- Set `-projectPath`, use `-batchmode` for unattended work, and save the full log with `-logFile`. Use `-nographics` only for checks that do not require graphics; rendering or GPU-dependent behavior must retain graphics support.
- For tests, use the installed compatible Unity Test Framework's `-runTests`, `-testPlatform` and `-testResults` arguments. Do not add `-quit` to an asynchronous test run: let the test runner finish and exit. For custom work, `-executeMethod` calls an existing supported static method in an Editor script; a synchronous run may use `-quit`, while asynchronous work must exit only after completion.
- Check process completion, exit code, full logs and the expected result files together. Missing results, skipped coverage, compiler errors or an incomplete run must not be reported as a pass. Do not suppress compiler failures to make validation appear successful.
- Batch mode cannot open a project already open in another Unity Editor instance. Preserve the user's live session and unsaved scenes/settings: use a separate validation project with the intended source and resolved dependencies when isolation is needed. Record its source revision and relevant differences; validation of saved/copied content does not prove unsaved live content. Do not close or save the user's Editor merely to run a check.
- Reuse established validation entry points and run proportionate checks after meaningful changes. Group compatible checks where useful to reduce repeated startup/import work, without losing separate results or mixing incompatible test requirements. CLI reduces manual steps and supports repeatability; claim a time saving only when measured.

Use the versioned [Unity 6.6 Editor command-line reference](https://docs.unity.com/en-us/engine/6000.6/manual/unity-editor/command-line-arguments/editor), command-line build guidance, and the [Unity Test Framework command-line reference](https://docs.unity3d.com/Packages/com.unity.test-framework@1.4/manual/reference-command-line.html) for the installed compatible package version. These method choices retain the existing Windows workflow, Unity API serialization boundary and subject-specific acceptance gates.


---

<a id="unity-600063f1-compatibility-baseline"></a>
## Unity 6000.6.3f1 Minimum Compatibility Baseline

### Editor and dependency selection

**Steam API is required for Geurts Unity projects through Steamworks.NET**, alongside the licensed Odin Inspector and Quantum Console baseline. Select and verify the official wrapper, managed APIs and Windows x64 native-plugin files under the [Steam Integration Technique](GeurtsSteamIntegrationTechnique.md). Missing or incompatible wrapper evidence blocks BigBang installation and handoff. This project prerequisite adds no wrapper compile reference to God or BigBang and requires no native initialization, Steam client, account or AppID for local verification. BigBang must remain usable to explain and explicitly acquire missing prerequisites.

Use **Unity 6.6 (6000.6.3f1) or newer**, retaining 6000.6.3f1 as the minimum for all new and modified Geurts Unity code, Editor tooling, tests, automation and C# examples. This technique owns the compatibility baseline; entry files and native AI routes continue to defer to the manifest. The documentation package version is independent of the Unity Editor version.

Before Unity implementation, read `ProjectSettings/ProjectVersion.txt`, `Packages/manifest.json`, and `Packages/packages-lock.json` when available, then inspect the installed packages, assembly definitions, render pipeline, build targets, and scripting backend relevant to the task. Record the exact Editor patch and resolved dependency versions used for validation. In this documentation-only repository these Unity project files do not exist; do not fabricate them or claim that another repository's code has been upgraded. This implementation preflight does not expand the Commandments Companion's closed startup or Update permissions.

**6000.6.3f1 is a minimum version, not an exact-version requirement.** Accept it and numerically newer Unity Editors, including later patches and later Unity series; do not impose equality or an artificial upper version ceiling. Compare major, minor, patch, release channel and revision numerically; prereleases below the final minimum and malformed/unknown versions remain blocked. Retain the exact chosen Editor in `ProjectVersion.txt` and the resolved package manifest/lockfile after any explicitly selected, validated migration. A newer existing Editor does not require a downgrade to the minimum. Review the selected Editor's release notes and record the exact version actually compiled and tested; version eligibility never certifies an untested release or dependency graph.

Use the newest stable package release verified compatible with the selected Editor **at or above 6000.6.3f1** and the actual dependency graph. Keep reusable Forge code compatible with the minimum unless an owner explicitly versions a higher requirement. Review current package compatibility information and installed source before changing APIs. Read release history only when a requested migration requires it. Update required dependencies together through supported package workflows and retain reproducible versions; do not blindly select `latest`, preview/experimental releases, or dependencies requiring an Editor newer than the selected one. A compatible stable API takes precedence over a newer incompatible API.

**Odin Inspector and Quantum Console are required dependencies** for Geurts gameplay, reusable framework, runtime-system, and developer-tool implementation. Use current stable releases compatible with Unity 6.6 and the project's target platforms. Verify Odin was acquired through a licensed distribution and Quantum Console through its supported distribution; do not copy, vendor, or redistribute either package without the applicable rights. Missing dependencies are implementation blockers. If either dependency is missing, incompatible, or unlicensed, report that concrete blocker and do not create a fallback inspector, serializer, command console, or parallel diagnostics framework to bypass the requirement.

Use both dependencies wherever their supported features improve configuration, validation, inspection, diagnostics, tuning, or developer operation. "Use as much as possible" means meaningful adoption across applicable Geurts-owned code, not decorating every member, serializing unsupported data unnecessarily, exposing unsafe commands, or adding runtime work without a benefit. Preserve established project data and behavior while migrating duplicate custom tooling onto these required systems.

God owns the Commandments Editor service; the [Commandments Companion Technique](GeurtsCommandmentsCompanionTechnique.md) owns its lifecycle and passive-adapter transition. The [Brick Contract](GeurtsBrickContract.md#identity-and-dependencies) owns package and licensed-library dependencies. Authoritative Markdown content remains readable without God. A separately selected legacy compatibility contract remains frozen.

**BigBang is the narrow independent initial-installer exception.** `com.geurts.gameforge.bigbang` compiles before God, Odin Inspector and Quantum Console exist, without vendor, God, Input System, uGUI or TextMesh Pro assembly references and without `IBrick` registration. It uses an explicit Editor-only assembly and supported Unity Editor/UI Toolkit APIs to prepare the licensed libraries, install one verified immutable God target and hand over after successful compilation. Its missing-library UI is acquisition assistance, not a fallback inspector, serializer or console. Ordinary God and dependent bricks retain all required licensed-library rules. The manifest-selected [BigBang Technique](GeurtsBigBangTechnique.md) owns this initial-installation boundary; runtime initialization and `SCN_BigBang` remain owned by God.

For a separately maintained UPM package migrated and verified against this baseline, declare `"unity": "6000.6"` and `"unityRelease": "3f1"` in its `package.json`. These fields declare the minimum Editor version, not equality. Validate reusable package code at the minimum and affected behavior on the newer selected consumer Editor; record each actual version separately. A package with a deliberately higher minimum must declare it and remain unavailable to older Editors. Consult the [package manifest reference](https://docs.unity.com/en-us/engine/6000.6/manual/packages-list/cus-pkg-lp/cus-pkg-development/cus-pkg-manifest/upm-manifest-pkg). Do not add a Unity package manifest to this documentation repository or change the companion's closed JSON schema to carry Editor requirements.

For Steam-related packages and Windows player changes, select the [Steam Integration Technique](GeurtsSteamIntegrationTechnique.md). Verify a pinned Steamworks.NET release against this exact Editor, Windows x64, the actual backend and native-plugin settings; do not infer compatibility from managed compilation. Its local package prerequisite does not require native initialization, an AppID or release-pipeline setup. BigBang retains compile independence from Steamworks.NET as well as God and licensed libraries. Use the catalogue-selected BigBang release's `Documentation~/SteamPreparation.md` for its tested immutable wrapper profile. Local prerequisite and Windows preparation evidence remain separate from real native/account/overlay/distribution acceptance; retain the owning release's explicit limits.

### C# and .NET

- Use **C# 9.0**, within Unity's documented supported subset. Do not assume C# 10+ features such as file-scoped namespaces, global using directives, record structs, required members, or collection expressions are available. Avoid unsupported C# 9 features such as covariant return types, module initializers, and init-only setters in baseline examples. Do not add compiler shims or change the language version just to use newer syntax. See the [Unity 6.6 compiler reference](https://docs.unity.com/en-us/engine/6000.6/manual/scripting/environment-and-tools/overview-of-dot-net-in-unity/csharp-compiler).
- Prefer **.NET Standard 2.1** for new reusable code; respect an existing project's API compatibility level. Unity also offers the **.NET Framework 4.8** profile, but this does not make .NET 5+ or .NET Core-only APIs available. Check managed libraries on the actual target and scripting backend, including IL2CPP/AOT and stripping when used. See Unity's .NET API compatibility levels.
- Keep Unity-serialized data in supported fields and types; do not use records as Unity-serialized data models. Apply `[SerializeField]` to fields, not properties or methods. If an existing auto-property deliberately serializes its backing field, use `[field: SerializeField]` and a field-targeted tooltip. Preserve serialized identity when refactoring and validate existing asset values in the Editor.

### Current API choices

Never use a Unity or dependency API marked deprecated or obsolete in the minimum or selected newer Editor in new or updated code, tests, tools or examples. Replace deprecated calls with supported APIs while preserving their behavior. The [zero-warning compilation gate](#zero-warning-compilation-gate) applies to all compiler warnings, including deprecation warnings; do not suppress them or keep a deprecated call merely because it still compiles. Review the installed API documentation and compile in the recorded selected Editor and retain minimum-version compatibility checks before release.

Prefer serialized references, explicit dependency wiring, and cached component access over scene-wide discovery. When discovery is necessary, use `Object.FindAnyObjectByType<T>()` for an arbitrary match or `Object.FindObjectsByType<T>()` for all matches. Specify inactive-object handling deliberately. In Unity 6000.6, `FindFirstObjectByType` and the `FindObjectsByType` overloads taking `FindObjectsSortMode` are deprecated because their instance-ID ordering cannot be maintained. Never use them. See [object discovery](https://docs.unity.com/en-us/engine/6000.6/script-reference/unityengine/object/findobjectsbytype).

This method-body fragment performs an intentional one-time scan of active colliders; it is not an `Update()` pattern or a complete component:

```csharp
UnityEngine.Collider[] colliders = UnityEngine.Object.FindObjectsByType<UnityEngine.Collider>(
    UnityEngine.FindObjectsInactive.Exclude);
```

For `Rigidbody` and `Rigidbody2D`, use `linearVelocity`, `linearDamping`, and `angularDamping` in new or migrated code instead of their obsolete velocity/drag names. Preserve the existing simulation behavior: these names do not justify setting velocity every frame, changing force modes, or making kinematic bodies behave dynamically. See 3D velocity, 2D velocity, 3D damping, and 2D damping.

Use the **Input System** package and input actions for new input work. Inspect the existing input architecture and Active Input Handling setting; integrate or migrate bindings deliberately and test devices, rebinding, and UI navigation relevant to the project. Do not introduce legacy `UnityEngine.Input` polling into new examples, silently change existing controls, or enable both input backends as an unexplained workaround. See Unity 6.6 input guidance.

Use **Build Profiles** for new build configuration guidance and select the intended profile, scene list, platform, and scripting defines explicitly in automation. Do not assume legacy Build Settings instructions or one shared scene list describe every build. Existing supported build APIs may remain when they meet the same requirements. See Build Profiles.

### Collider movement and trigger-based detection

**Never move any object with a `Collider` or `Collider2D` through `transform.position`.** This includes triggers, compound-collider children, movement, spawning/repositioning and teleports. Do not bypass the rule through `localPosition`, `Translate`, transform-based tweens/animation or movement of an ancestor that carries the collider along. Use the owning `Rigidbody`/`Rigidbody2D` and supported physics movement APIs; keep static colliders stationary. An existing `CharacterController` uses its supported controller movement APIs without adding a competing Rigidbody; any unsupported repositioning requirement needs an explicit scoped decision. Preserve the intended body type and simulation behaviour: use forces/velocity for dynamic bodies and appropriate physics movement for kinematic bodies. Apply continuous movement at the physics timestep; intentional teleports use the body's physics position API, with explicit velocity/contact handling. Do not silently change an existing controller or serialized body setup.

**Avoid raycasting, overlap spheres and other expensive physics queries; use trigger-driven detection instead.** This includes 2D equivalents, shape casts, repeated overlap checks and non-allocating variants: avoiding allocation does not eliminate the query cost. Configure the correct trigger/body combination and collision layers, handle enter/exit callbacks, and retain only the needed nearby references. Clean up membership when objects disable, despawn, return to a pool or unload; do not rely on an exit callback always occurring. Avoid continuous `OnTriggerStay` polling when enter/exit state suffices. Triggers still have simulation cost; constrain their size, layers and active count, and profile representative gameplay. If triggers cannot express a required behaviour, report the concrete limitation for an explicitly scoped decision rather than silently introducing query-based polling.

Use the versioned Unity references for [Rigidbody movement](https://docs.unity.com/en-us/engine/6000.6/script-reference/unityengine/rigidbody/moveposition), [2D body movement](https://docs.unity.com/en-us/engine/6000.6/script-reference/unityengine/rigidbody2d/moveposition) and [trigger callbacks](https://docs.unity.com/en-us/engine/6000.6/script-reference/unityengine/collider/ontriggerenter). Verify movement and detection in the actual body/layer configuration; this documentation does not retrofit installed controllers.

### Async and lifecycle

**Use coroutines instead of `void Update()` for first-party recurring gameplay work.** Prefer event callbacks when no periodic work is needed; otherwise start an owned coroutine only while needed and yield at the lowest frequency that meets the behaviour. Do not replace `Update` with a coroutine that still performs unnecessary work every frame. Choose scaled or unscaled waits deliberately, avoid repeated yield allocations, prevent duplicate routines, and explicitly stop/reset work when its owner disables, despawns, returns to a pool or unloads. Coroutines run synchronous work on the main thread and are not automatically faster; profile the result. See [Unity's coroutine guidance](https://docs.unity.com/en-us/engine/6000.6/manual/scripting/coroutines-section).

Retain required engine callbacks, including `FixedUpdate` for physics-timestep movement and trigger callbacks for detection. These are not replacements for general-purpose `Update` polling. A genuine API-required `Update` integration must be identified and explicitly approved in scope rather than hidden in a wrapper. Apply this rule to new and affected code; do not rewrite unrelated or vendor components.

For genuinely asynchronous Unity operations, prefer `UnityEngine.Awaitable` where appropriate. Await each pooled instance only once. Preserve `Task` for suitable .NET/library interoperation. This async API choice does not replace the coroutine rule for recurring gameplay work. Observe cancellation and exceptions, cancel work when its owner or application exits, and return to the main thread before using Unity APIs that require it. Do not hide failures in unobserved fire-and-forget work. See Awaitable and the async programming guide.

Respect the project's Enter Play Mode settings. When domain reload is disabled, reset owned static state deliberately and prevent duplicate event subscriptions across play sessions. Release subscriptions and resources at the appropriate runtime or Editor lifecycle boundary; Editor tools must account for assembly reload and window teardown. Test repeated entry and exit with the settings the project actually uses. See domain reload behavior.

<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->
### Unity 6.6 migration checks

Read the [Unity 6.6 upgrade guide](https://docs.unity.com/en-us/engine/6000.6/manual/upgrade-guides/upgrade-guide-unity66) and all intervening upgrade guides when migrating older projects. For affected systems:

- URP custom passes must use Render Graph. The earlier Unity 6.3 guide removes normal Compatibility Mode support; `URP_COMPATIBILITY_MODE` is a temporary conversion aid, not a shipping solution. Do not change the project's render pipeline merely to modernize examples.
- Replace `AccessibilityNode.selected` with `invoked`; use a single `AccessibilityRole`, and review enum-size assumptions and precompiled assemblies.
- Review native-facing code and precompiled assemblies for the `SceneHandle` and `EntityId` type changes; rebuild affected assemblies against the selected Editor.
- Resolve invalid USS syntax and unsupported selectors rather than suppressing importer errors.
- Review modified Adaptive Performance packages against its move into an Editor module; do not keep duplicate implementations.
- Replace obsolete `UPM_NPM_CACHE_PATH` configuration with an appropriate `UPM_CACHE_ROOT` configuration when present.

Review platform and package-specific changes only where those systems are used. Use the selected patch's Windows build toolchain and release notes to check native plugins, graphics features, scripting backends and other affected integrations. A rename or API Updater pass alone is not evidence of unchanged behavior.

<!-- GEURTS-SECTION:END -->

### Zero-warning compilation gate

**Every push or merge to `main` must have zero compiler warnings and zero compiler errors for the final candidate. Treat all compiler warnings as errors.** Configure the owning project's supported compiler/build settings and CI to enforce warnings-as-errors for applicable Editor and player compilations; verify the effective configuration rather than relying on an IDE display or a successful exit code alone. This gate also applies to non-Unity compiled projects following these standards through their own compiler settings.

Retain complete compiler logs and require a completed, successful compile with no warning/error diagnostics. Include resolved dependencies: a third-party compiler warning still blocks publication. Resolve it through a supported dependency update or the owning source change; do not edit vendor/generated files, suppress warnings, lower warning levels or add exclusions merely to obtain a pass. Missing tooling, incomplete logs, skipped compilation or an unverified dependency graph is a blocker, not a zero-warning result. If upstream integration changes compilation inputs, revalidate the combined candidate before it reaches `main`.

Use proportionate checks for the changed surface without waiving this gate. Existing compilation evidence may be reused only for identical relevant source, inputs, dependencies and environment. A documentation-only repository with no compiled implementation uses its required documentation checks; report compilation as not applicable, never as a verified zero-warning Unity build. This documentation establishes the policy; it does not configure or certify existing projects automatically.

### Verification and evidence

For changed Unity implementation, compile at the **6000.6.3f1 minimum** and in the exact selected newer consumer Editor when one is used, satisfy the zero-warning compilation gate, run relevant Edit Mode and Play Mode tests, and exercise affected behavior. Build and test the affected target player/backend when runtime compatibility is involved; Editor success does not prove IL2CPP, platform, or player compatibility. Remaining compiler warnings, including third-party warnings, block publication; report the exact blocker and supported resolution.

For documentation-only changes, verify examples against versioned Unity and package references and run this repository's validator and isolated PowerShell automation suite. Report whether examples were actually compiled in Unity. These checks do not certify separate game or companion repositories. If the required Editor, package, platform module, or project is unavailable, state the exact unverified surface rather than claiming full compatibility.
