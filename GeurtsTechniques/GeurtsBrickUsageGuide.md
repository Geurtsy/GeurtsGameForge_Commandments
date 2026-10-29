<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Brick AI Usage Guide

**Version:** 1.1.0
**Audience:** AI agents only
**Required package path:** `GeurtsTechniques/GeurtsBrickUsageGuide.md`

## Selection and evidence

The manifest selects this index with the Brick Contract and Catalogue. Read the shared rules here and only the relevant brick sections through the manifest's controlled section reader. Game Forge integration is primary; StandardsOnly does not select bricks unless explicitly adopted.

The [Catalogue](GeurtsBrickCatalogue.json) alone selects current installable identities, versions, immutable sources, Unity bounds and dependency minimums. Each section below records evidence at that catalogue pin, not a second installation target. All 13 current entries are released; no current catalogue brick is Planned. Planned features within released bricks remain unavailable. Future Planned entries require purpose, limits and an explicit unavailable state, with no invented API, action, installation source or executable example.

**Declared requirements** come from the [Brick Contract](GeurtsBrickContract.md) and selected techniques. **Source evidence** below was checked read-only at exact pins: package.json, ForgeCapabilities.json, guide paths, operation provider declarations and linked recipe bytes where available. **Runtime evidence** remains the owner's source-matched validation; no Unity build, installer, native service or gameplay workflow was executed for this index. A declaration or passing documentation check does not certify functionality. Recheck the actual installed graph and available providers before use; unknown/mismatched evidence blocks the affected action.

For every dependent brick, verify both licensed Odin Inspector and Quantum Console, supported Unity (6000.6.3f1 or newer), actual package dependencies and local Commandments before Editor mutation. BigBang and the passive adapter have the exact exceptions below. God is the only mandatory shared Geurts brick; optional peers stay optional. Explicit installation uses the Catalogue's Git source. Read each pinned owner's AIUsability task table, then its selected recipe/API guide; do not load release history for ordinary integration.

Installed packages/bricks and managed documentation never update automatically. Every Update/Update All requires a current explicit user action and the owning confirmation; saved consent and God menu openings are not exceptions. Read-only checks retain their existing triggers. Verify implementation and installed behavior separately from this requirement; the [owner coordination record](../Migrations/v0.64.0.md) tracks adoption. Background game-change queue publication remains a separate authorized workflow.

The examples below are bounded workflows derived from owner guides, not new APIs or approvals to run them. Retain owner consent, review, typed payloads, stale-review checks, operation guards and game design authority. Discover supported operations locally; inspect is read-only, execution is explicit and results retain actual partial/failure states. Direct APIs do not imply a generic operation ID. Runtime consumers borrow the existing bootstrap service and release owned resources; Editor-only services stay out of players. The [maintenance owner](GeurtsDocumentationMaintenanceTechnique.md) requires this index and the affected owning guide to stay synchronized.

## BigBang

**Catalogue ID:** `com.geurts.gameforge.bigbang`
**Evidence version:** `0.8.9`
**Source:** [package manifest](https://github.com/Geurtsy/GeurtsGameForgeBigBang/blob/eb291ef5e6d2a1e9b16104d04f8b97f6dac9cc53/package.json), [capabilities](https://github.com/Geurtsy/GeurtsGameForgeBigBang/blob/eb291ef5e6d2a1e9b16104d04f8b97f6dac9cc53/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/GeurtsGameForgeBigBang/blob/eb291ef5e6d2a1e9b16104d04f8b97f6dac9cc53/Documentation~/GameIntegration.md).

- **Use:** Prepare a fresh Forge Unity project and hand off to God; use BigCrunch only for separately requested whole-Forge removal.
- **Prerequisites:** Windows, supported Unity and Git. BigBang itself compiles without God, Odin Inspector or Quantum Console; installation/handoff requires licensed Odin Inspector, Quantum Console and verified Steamworks.NET.
- **Entry points:** Use the six-step BigBang Editor workflow. No unattended installation controller or ForgeOperations action is supplied.
- **Example:** Import the licensed libraries, explicitly acquire the supported Steamworks.NET wrapper, verify prerequisites, get the latest compatible God source, install and verify God, then Continue with God. Acquire Commandments separately in God.
- **Lifecycle/settings:** Editor-only. Preserve existing God and frozen operation state; God owns ongoing packages and runtime bootstrap.
- **Verify:** Require actual resolved Git identity/commit, fresh successful compilation and available God handoff. A UPM success alone is insufficient.
- **Limits:** No content acquisition, scene/GDD setup or optional-brick installation. Native Steam and interactive acceptance are separate.

## Commandments Compatibility

**Catalogue ID:** `com.geurts.gameforge.documentation`
**Evidence version:** `0.15.4`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.commandments/blob/c1e5d2aa1d03ff2e32d3959c94aa2f3e785bed33/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.commandments/blob/c1e5d2aa1d03ff2e32d3959c94aa2f3e785bed33/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.commandments/blob/c1e5d2aa1d03ff2e32d3959c94aa2f3e785bed33/Documentation~/AIUsability.md).

- **Use:** Retain existing legacy Companion Editor callers during migration to God. Excluded from fresh installations and Install All.
- **Prerequisites:** No God/vendor compile dependency; compatible God is required to perform delegated content work and God requires both licensed libraries.
- **Entry points:** Retained DocumentationIntegration / CommandmentsIntegration forwarding; use God's supported CommandmentsIntegration for new Editor callers. No independent automation provider.
- **Example:** With both packages verified, open God's Commandments view; retain the adapter while custom assemblies reference it. Migrate those references explicitly, then remove the adapter through UPM.
- **Lifecycle/settings:** Passive Editor-only handoff; no startup acquisition, menu registrations, runtime service or independent updater.
- **Verify:** Check actual installed identities and callable God owner. Confirm an absent owner reports unavailable and the adapter starts no acquisition.
- **Limits:** The pinned Documentation~/README.md still says 0.15.3 while package/capabilities declare 0.15.4. Treat that version/install example as stale; use the Catalogue. Owner correction remains outstanding.

## God

**Catalogue ID:** `com.geurts.gameforge.god`
**Evidence version:** `0.39.4`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.god/blob/b7a001234dd5b149cc767dd1ab305df4c6e876d7/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.god/blob/b7a001234dd5b149cc767dd1ab305df4c6e876d7/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.god/blob/b7a001234dd5b149cc767dd1ab305df4c6e876d7/Documentation~/GameIntegration.md).

- **Use:** Foundation for every dependent brick: lifecycle, shared capabilities/settings, bootstrap, packages and Commandments.
- **Prerequisites:** Licensed Odin Inspector and Quantum Console, resolved Unity dependencies and the Forge Steamworks.NET prerequisite. No optional peer brick or passive adapter is required.
- **Entry points:** Use the God dashboard and Build Forge. Supported operations include inspect_sources and setup_bootstrap; runtime consumers borrow BrickHost.Current capabilities.
- **Example:** Complete separately confirmed Commandments acquisition, validate local foundation, explicitly set up bootstrap and configure modules. For custom behavior, use the linked GameCapabilityConnection recipe to observe an optional capability from the existing host.
- **Lifecycle/settings:** Keep one retained SCN_BigBang/ForgeBootstrap. Dispose consumer subscriptions on disable/unload; custom bricks use BrickContext ownership. God owns per-brick settings and cannot be disabled.
- **Verify:** Check bootstrap/readiness independently of package presence; test absent, available, withdrawn and re-enabled capability states plus subscription disposal.
- **Limits:** No second host/registry in a game. Editor APIs stay outside player assemblies; optional providers may be unavailable.

[Exact owner recipe](https://github.com/Geurtsy/com.geurts.gameforge.god/blob/b7a001234dd5b149cc767dd1ab305df4c6e876d7/Tools~/Examples/GameIntegrationRecipe.cs) and [owner validation](https://github.com/Geurtsy/com.geurts.gameforge.god/blob/b7a001234dd5b149cc767dd1ab305df4c6e876d7/Documentation~/AIUsabilityValidation.json). Recipe bytes matched the pinned guide during this review; its tests were not rerun here.

The pinned God 0.39.4 source still contains automatic package/content update paths. They are superseded policy, not compliant recommended usage. A matching implementation release and consumer adoption remain outstanding; no documentation edit disables those installed handlers.

## Steam

**Catalogue ID:** `com.geurts.gameforge.steam`
**Evidence version:** `0.3.1`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.steam/blob/44e5b61c6d9130682163d9536d91be67ed7d9a8d/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.steam/blob/44e5b61c6d9130682163d9536d91be67ed7d9a8d/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.steam/blob/44e5b61c6d9130682163d9536d91be67ed7d9a8d/Documentation~/GameIntegration.md).

- **Use:** Optional Windows x64 platform provider and Steam release preparation; distinguish wrapper readiness from native service readiness.
- **Prerequisites:** God, both licensed libraries, supported Steamworks.NET and its Windows plugin configuration. Native testing additionally needs an explicitly owned app context.
- **Entry points:** Use the Steam Editor window; inspect_steam_preparation, save_steam_configuration and create_steam_distribution_draft are declared operations. Runtime services use God's optional platform contracts.
- **Example:** Review a caller-owned SteamConfiguration draft, inspect findings, then explicitly save the unchanged reviewed draft. Keep native initialization off for local unconfigured development; saved configuration applies on the next launch.
- **Lifecycle/settings:** God owns shared contracts; Steam owns optional native lifecycle and its settings. Cancel/withdraw through the owning lifecycle and handle unavailable services.
- **Verify:** Verify review causes no write/native startup, stale review blocks save, and explicit save reads back correctly. Native status must be observed separately.
- **Limits:** Real account, overlay, cloud/server and depot/customer-distribution acceptance remains separately unverified. A distribution draft is not deployment; no automatic Save and Load slot synchronization.

[Exact owner recipe](https://github.com/Geurtsy/com.geurts.gameforge.steam/blob/44e5b61c6d9130682163d9536d91be67ed7d9a8d/Tools~/Examples/GameIntegrationRecipe.cs) and [owner validation](https://github.com/Geurtsy/com.geurts.gameforge.steam/blob/44e5b61c6d9130682163d9536d91be67ed7d9a8d/Documentation~/AIUsabilityValidation.json). Recipe bytes matched the pinned guide during this review; its tests were not rerun here.

## Diagnostics

**Catalogue ID:** `com.geurts.gameforge.diagnostics`
**Evidence version:** `0.11.3`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.diagnostics/blob/a8d7a850654be6c438aebe0881ff95e1bbf23957/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.diagnostics/blob/a8d7a850654be6c438aebe0881ff95e1bbf23957/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.diagnostics/blob/a8d7a850654be6c438aebe0881ff95e1bbf23957/Documentation~/GameIntegration.md).

- **Use:** Optional logging, health/inspection, history, metrics and console tooling.
- **Prerequisites:** God and licensed Odin Inspector/Quantum Console. Runtime console implantation is optional and separately confirmed; required console resources follow its setup guide.
- **Entry points:** Use Diagnostics' Editor views; inspect_sources and install_console are declared operations. Extend health/inspection through the linked GameTargetDiagnostics recipe.
- **Example:** Register one game-owned read-only health check and inspection callback; inspect failing then recovered target state, and dispose its registration. Install a console only if requested.
- **Lifecycle/settings:** God owns shared logging/session contracts; Diagnostics supplies capture. Ordinary uncaptured logs are no-ops; actual failures remain visible in owner status. Release only owned registrations.
- **Verify:** Exercise failure, recovery and teardown independently of capture; console input/presentation needs its own acceptance.
- **Limits:** No parallel command UI or logging framework. Command filters do not confer gameplay or host/server authority.

[Exact owner recipe](https://github.com/Geurtsy/com.geurts.gameforge.diagnostics/blob/a8d7a850654be6c438aebe0881ff95e1bbf23957/Tools~/Examples/GameIntegrationRecipe.cs) and [owner validation](https://github.com/Geurtsy/com.geurts.gameforge.diagnostics/blob/a8d7a850654be6c438aebe0881ff95e1bbf23957/Documentation~/AIUsabilityValidation.json). Recipe bytes matched the pinned guide during this review; its tests were not rerun here.

## Angels

**Catalogue ID:** `com.geurts.gameforge.angels`
**Evidence version:** `0.9.7`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.angels/blob/67f76582819b48ea1091582d9e7ff2a4fdd93cb1/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.angels/blob/67f76582819b48ea1091582d9e7ff2a4fdd93cb1/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.angels/blob/67f76582819b48ea1091582d9e7ff2a4fdd93cb1/Documentation~/GameIntegration.md).

- **Use:** Optional Editor project maintenance: folders, guides, Git, scoped asset organization and explicit design imports.
- **Prerequisites:** God, both licensed libraries and compatible local Commandments. Codex naming/audio are separate optional account/tool integrations with explicit sharing and billing consent.
- **Entry points:** Use Angels' reviewed controls or supported AngelsAssetMoves.Preview/Apply APIs. Discover operation eligibility locally; current scans also have direct owner APIs and must not be invented as generic actions.
- **Example:** Preview only selected asset paths, inspect destinations/GUIDs and path-loader risks, retain original review rows, then apply after actual review and required confirmation. Verify each completed move and preserved unselected content.
- **Lifecycle/settings:** Editor-only; settings use God's per-brick store. Stop/disable cancels pending owner requests; completed moves remain. Automatic sorting/naming is separately default-off.
- **Verify:** Check cancellation, stale source/guidance refusal, GUID/meta preservation and actual/partial outcomes; choose a fresh review for retry.
- **Limits:** No Execute All, automatic primary GDD choice or startup scan. Documentation maintenance gives no GDD access. Optional paid inference is never implied by installation.

[Exact owner recipe](https://github.com/Geurtsy/com.geurts.gameforge.angels/blob/67f76582819b48ea1091582d9e7ff2a4fdd93cb1/Tools~/Examples/GameIntegrationRecipe.cs) and [owner validation](https://github.com/Geurtsy/com.geurts.gameforge.angels/blob/67f76582819b48ea1091582d9e7ff2a4fdd93cb1/Documentation~/AIUsabilityValidation.json). Recipe bytes matched the pinned guide during this review; its tests were not rerun here.

## Settings

**Catalogue ID:** `com.geurts.gameforge.settings`
**Evidence version:** `0.7.4`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.settings/blob/9863219766d79e4eadd9be2122082616f2a974b8/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.settings/blob/9863219766d79e4eadd9be2122082616f2a974b8/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.settings/blob/9863219766d79e4eadd9be2122082616f2a974b8/Documentation~/GameIntegration.md).

- **Use:** Authored game settings, typed providers, staged changes and local preference persistence.
- **Prerequisites:** God and both licensed libraries; actual package.json lists Unity dependencies. Audio/UI peers remain optional.
- **Entry points:** Use authored Settings panels/providers; commit_setup takes the owner's reviewed draft. Custom game settings use the linked GameEffectSetting recipe.
- **Example:** Configure an authored setting, stage a value and verify the target stays unchanged. Cancel discards the draft; apply only the reviewed complete draft, then inspect effective and persisted values.
- **Lifecycle/settings:** Dispose provider registration when its target disappears. Settings owns saved preferences separately from God's module configuration and gameplay saves; apply includes all pending providers.
- **Verify:** Inspect Saved, Error, Conflicts and per-setting Outcomes; exercise Stage/Cancel, Apply, withdrawal and reload against isolated storage.
- **Limits:** Do not create another settings service in a live game. Real display-device confirmation and platform storage permissions require separate evidence.

[Exact owner recipe](https://github.com/Geurtsy/com.geurts.gameforge.settings/blob/9863219766d79e4eadd9be2122082616f2a974b8/Tools~/Examples/GameIntegrationRecipe.cs) and [owner validation](https://github.com/Geurtsy/com.geurts.gameforge.settings/blob/9863219766d79e4eadd9be2122082616f2a974b8/Documentation~/AIUsabilityValidation.json). Recipe bytes matched the pinned guide during this review; its tests were not rerun here.

## Scene Loading

**Catalogue ID:** `com.geurts.gameforge.sceneloading`
**Evidence version:** `0.7.3`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.sceneloading/blob/771f4fdeddb7334af1f8a34721148016d402ad27/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.sceneloading/blob/771f4fdeddb7334af1f8a34721148016d402ad27/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.sceneloading/blob/771f4fdeddb7334af1f8a34721148016d402ad27/Documentation~/GameIntegration.md).

- **Use:** Additive destination transitions with retained bootstrap and owned content replacement.
- **Prerequisites:** God, both licensed libraries and resolved Unity dependencies. Saved scene assets, explicit destination IDs and enabled Build Profile scenes are required.
- **Entry points:** Use Scene Action assets/callbacks for normal use. Custom callers resolve SceneLoadingRuntime.Service; save_settings is the declared settings action.
- **Example:** Author a destination and main scene, validate it, then invoke the owner's transition once. Await its result and idle state before releasing progress observers or deciding recovery.
- **Lifecycle/settings:** SCN_BigBang remains loaded; Scene Loading owns native transitions. Cancellation drains already accepted Unity work; disable/unload must release caller references safely.
- **Verify:** Confirm target content loads, prior content is replaced, bootstrap stays loaded, invalid destinations preserve state and callbacks are removed.
- **Limits:** No second loader or DontDestroyOnLoad. Request acceptance is not completion; no immediate retry loop or promised rollback.

[Exact owner recipe](https://github.com/Geurtsy/com.geurts.gameforge.sceneloading/blob/771f4fdeddb7334af1f8a34721148016d402ad27/Tools~/Examples/GameIntegrationRecipe.cs) and [owner validation](https://github.com/Geurtsy/com.geurts.gameforge.sceneloading/blob/771f4fdeddb7334af1f8a34721148016d402ad27/Documentation~/AIUsabilityValidation.json). Recipe bytes matched the pinned guide during this review; its tests were not rerun here.

## Save and Load

**Catalogue ID:** `com.geurts.gameforge.saveload`
**Evidence version:** `0.4.1`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.saveload/blob/027437e3239cd0506b4abd8ce713b94a43b59b3b/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.saveload/blob/027437e3239cd0506b4abd8ce713b94a43b59b3b/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.saveload/blob/027437e3239cd0506b4abd8ce713b94a43b59b3b/Documentation~/AIUsability.md).

- **Use:** Local named gameplay slots with explicit participants and transactional restore.
- **Prerequisites:** God, both licensed libraries, authored Save Profile and exactly its required participant set; no optional peer brick.
- **Entry points:** Use Saved Transform/Saved Value and Save Load Binding. create_profile accepts SaveProfileDraft; custom state implements ISaveParticipant and ISaveRestoreStep.
- **Example:** Create a profile with one explicit participant, wire Save/Load result events, save its value to a named slot, change the value and load after targets are ready. Await the actual result; autosave stays off unless deliberately configured.
- **Lifecycle/settings:** Use the active bootstrap service. Slot files live under Application.persistentDataPath/GeurtsGameForge/SaveLoad/<profile>/, separate from module settings. Dispose migration/owner tokens and cancel pending work through the owner.
- **Verify:** Check real file roundtrip, corrupt/newer input preservation and participant failure/partial restore. Use the linked concrete gameplay recipe and its isolated test.
- **Limits:** No implicit scene loading, arbitrary object graph serialization, cloud/network transport or automatic recovery. PARTIAL restore needs game-owned recovery; checksums do not authenticate data.

## Audio

**Catalogue ID:** `com.geurts.gameforge.audio`
**Evidence version:** `0.9.5`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.audio/blob/199666d1fcb7ce688d111da07b40e6ae72f52b8d/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.audio/blob/199666d1fcb7ce688d111da07b40e6ae72f52b8d/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.audio/blob/199666d1fcb7ce688d111da07b40e6ae72f52b8d/Documentation~/GameIntegration.md).

- **Use:** Unity clip playback, authored sounds, categories/mixing and scoped playback ownership.
- **Prerequisites:** God, both licensed libraries, authored sound/configuration and explicit bootstrap binding. Unity audio is the default; FMOD requires separately selected integration and licensed backend.
- **Entry points:** Use Audio authoring and its create_configuration, create_sound and bind_audio operations. Custom playback follows the linked GameIntegration recipe and RuntimeAPI guide.
- **Example:** Create a sound from one selected clip, assign configuration and retained-bootstrap binding, then play through the running service. Retain and release only the returned owned handle.
- **Lifecycle/settings:** Audio owns the backend and voices. Consumers release their own playback/subscriptions on disable; optional provider withdrawal must leave an actionable unavailable state.
- **Verify:** Check the built-in backend's handle lifetime, completion/cancellation and cleanup. Run unattended tests silently; listening and actual device/native-backend acceptance are distinct.
- **Limits:** No mandatory FMOD, global stop of unrelated voices, duplicate audio manager or claim that a source check proves audible quality.

[Exact owner recipe](https://github.com/Geurtsy/com.geurts.gameforge.audio/blob/199666d1fcb7ce688d111da07b40e6ae72f52b8d/Tools~/Examples/GameIntegrationRecipe.cs) and [owner validation](https://github.com/Geurtsy/com.geurts.gameforge.audio/blob/199666d1fcb7ce688d111da07b40e6ae72f52b8d/Documentation~/AIUsabilityValidation.json). Recipe bytes matched the pinned guide during this review; its tests were not rerun here.

## User Interface

**Catalogue ID:** `com.geurts.gameforge.userinterface`
**Evidence version:** `0.13.3`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.userinterface/blob/317867819006339b502d4abbbe19a9d3042915b5/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.userinterface/blob/317867819006339b502d4abbbe19a9d3042915b5/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.userinterface/blob/317867819006339b502d4abbbe19a9d3042915b5/Documentation~/GameIntegration.md).

- **Use:** UI Toolkit menus/screens, navigation, typed actions and authored appearance.
- **Prerequisites:** God, both licensed libraries and resolved UI/input packages; game-owned PanelRenderer/host, authored menu/screen and UiAction bindings.
- **Entry points:** Use the authoring UI and declared create_theme, create_menu, create_screen, create_draft and save_asset operations. Custom views use supported ScreenNavigator/UiAction APIs in the linked recipe.
- **Example:** Assign a PanelRenderer before enabling a new host, author a menu/action, and connect scene callbacks through UiActionListener. Open, invoke the action, navigate Back and close using the owner workflow.
- **Lifecycle/settings:** Host lifetime follows its scene/bootstrap owner. Create fresh views; dispose callbacks/subtrees on close without removing caller-owned siblings.
- **Verify:** Verify authored action dispatch, navigation/back and cleanup, then separately validate focus, input, resolution and rendered layout.
- **Limits:** Existing UIDocument setups remain supported; no automatic scene conversion. Game policy chooses save/session/destination behavior.

[Exact owner recipe](https://github.com/Geurtsy/com.geurts.gameforge.userinterface/blob/317867819006339b502d4abbbe19a9d3042915b5/Tools~/Examples/GameIntegrationRecipe.cs) and [owner validation](https://github.com/Geurtsy/com.geurts.gameforge.userinterface/blob/317867819006339b502d4abbbe19a9d3042915b5/Documentation~/AIUsabilityValidation.json). Recipe bytes matched the pinned guide during this review; its tests were not rerun here.

## Object Pooling

**Catalogue ID:** `com.geurts.gameforge.objectpooling`
**Evidence version:** `0.8.3`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.objectpooling/blob/605dcfd5909032f667032ec5e2d4c2a243faac67/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.objectpooling/blob/605dcfd5909032f667032ec5e2d4c2a243faac67/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.objectpooling/blob/605dcfd5909032f667032ec5e2d4c2a243faac67/Documentation~/GameIntegration.md).

- **Use:** Repeated prefab spawning with bounded growth, prewarming and generation-bound leases.
- **Prerequisites:** God, both licensed libraries, inactive prefab, ObjectPoolObject definition and explicit capacities/reset/lifetime configuration. Resources lookup is optional.
- **Entry points:** Use no-code spawners/rules or ObjectPoolingRuntime. Declared authoring actions create_definition, create_catalogue, repair_identifier and configure_scene retain exact target/Undo rules.
- **Example:** Validate a definition, prepare the pool, spawn with an explicit gameplay Scene owner, retain its immutable lease, and return that lease once. Observe capacity rejection and the scheduler boundary before reuse.
- **Lifecycle/settings:** The bootstrap service owns pools. Consumers release their subscriptions/tasks/attachments; lease generation protects against delayed work on reused objects.
- **Verify:** Check spawn/return/reuse, capacity rejection, reset and stale-lease refusal in the owning fixture.
- **Limits:** Never Destroy pooled instances, use a GameObject reference as ownership proof or create another live pool service. Contact, particle/device and optional audio acceptance remain separate.

[Exact owner recipe](https://github.com/Geurtsy/com.geurts.gameforge.objectpooling/blob/605dcfd5909032f667032ec5e2d4c2a243faac67/Tools~/Examples/GameIntegrationRecipe.cs) and [owner validation](https://github.com/Geurtsy/com.geurts.gameforge.objectpooling/blob/605dcfd5909032f667032ec5e2d4c2a243faac67/Documentation~/AIUsabilityValidation.json). Recipe bytes matched the pinned guide during this review; its tests were not rerun here.

## GitFlow

**Catalogue ID:** `com.geurts.gameforge.gitflow`
**Evidence version:** `0.1.2`
**Source:** [package manifest](https://github.com/Geurtsy/com.geurts.gameforge.gitflow/blob/a74071830b7aab17c47a10dbdb8eddc482625ddd/package.json), [capabilities](https://github.com/Geurtsy/com.geurts.gameforge.gitflow/blob/a74071830b7aab17c47a10dbdb8eddc482625ddd/ForgeCapabilities.json), [owner usage](https://github.com/Geurtsy/com.geurts.gameforge.gitflow/blob/a74071830b7aab17c47a10dbdb8eddc482625ddd/Documentation~/AIUsability.md).

- **Use:** Observe an existing integration queue, lease, processor evidence and receipts without controlling them.
- **Prerequisites:** Enabled God/GitFlow, both licensed libraries and Git for Windows; an existing checkout and supported public HTTPS or absolute local remote.
- **Entry points:** Open GitFlow and Refresh queue once, or await GitFlowBrick.Service.RefreshAsync(GitFlowTarget). inspect_queue is the only declared operation; discovery is passive.
- **Example:** Choose the existing checkout/remote, explicitly refresh once, then read the snapshot's target, timestamp, findings and unavailable evidence. Closing a view only detaches it; stop/disable cancels the shared operation.
- **Lifecycle/settings:** Editor-only shared lifecycle service; transient scope fields are not saved module configuration. Prior results keep their original observation time.
- **Verify:** Check read completeness and actual findings. A receipt/PID/lease display does not prove current-main ancestry, check success, processor ownership or delivery.
- **Limits:** Submission/publisher and recovery/repair are Planned and unavailable: no supported actions or installable separate source. Private authentication/SSH are unsupported. Pinned README says 0.1.1 while package/capabilities declare 0.1.2; owner correction is outstanding.

## Review dependencies

The passive adapter and GitFlow owner guides have the stale prose versions noted above; their pinned package manifests/capabilities match the Catalogue. Those owning repositories were not edited. Angels' Catalogue requiredTools was missing Quantum Console despite its pinned capability declaration and God dependency; this package corrects that metadata without changing its release pin. Existing owner guides also retain human-audience wording; adopt the AI-only maintenance rule in each affected owner's next authorized documentation update. Generic standards belong here; exact implementation corrections and recipe acceptance belong to those owners.

The optional Audio FMOD integration is not a separate current catalogue brick. Its owning Audio guide governs explicit adoption; do not invent a catalogue entry or source. Source inspection does not refresh consumer packages or their local Commandments copies.

