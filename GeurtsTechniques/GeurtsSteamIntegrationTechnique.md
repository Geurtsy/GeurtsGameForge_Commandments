<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Steam Integration Technique

**Version:** 0.1.1
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsSteamIntegrationTechnique.md`

The manifest selects this owner for Steam preparation, Steamworks.NET prerequisites, platform-service boundaries and Steam validation. Technical retains its priorities and no-code/API rules; Unity owns compatibility; BigBang owns installer admission; Brick Contract owns dependencies/lifecycle; Forge Setup owns shared readiness; Bootstrap owns retained scenes.

## Target and delivery boundary

**Steam on Windows x64 is the primary release target.** Steam Deck, Proton, SteamOS, Linux and macOS are outside the current target. Supporting Steam does not require Deck certification, controller-only design or another operating-system build. A different target needs an explicit scope change.

The first milestone is **prepared for Steam development**. A Unity project can reach it before obtaining a game AppID or configuring a store page, depots, branches, SteamPipe uploads or a release pipeline. Keep that distribution work deferred until separately requested. Never invent a production AppID or claim release readiness from local preparation.

The catalogue now advertises released local Steam preparation, vendor-neutral God contracts and the independent BigBang prerequisite gate. Use its exact published sources and each owning release capability/evidence record. **Native Steam integration and overlay remain unverified.** Customer distribution and the Steam release pipeline remain deferred. Existing installations change only through manual adoption; published preparation does not certify a native session or overlay.

## Package prerequisite and installation

Use **Steamworks.NET** as the managed Steamworks wrapper. Before changing Unity packages, select a stable release verified against the exact Editor, Windows x64, scripting backend and dependency graph. Record its version, immutable Git commit and native SDK/binary versions. Do not treat a documentation example, floating branch or merely installed assembly as compatibility evidence. Wrapper selection and the compatibility spike belong to the bricks implementation, not this documentation release.

Use the wrapper's supported distribution, retain provenance and applicable licence notices, and preserve its native-plugin layout and importer settings. Avoid duplicate manual/UPM imports. With Git UPM delivery, the official package subpath is `/com.rlabrecque.steamworks.net`; put the verified immutable Git reference in the **consuming project's `Packages/manifest.json`**, resolved through supported Unity Package Manager actions. Git URLs never belong in another package's `package.json.dependencies`. The optional SteamManager example must not be adopted unchanged as the Forge lifetime owner. See [Steamworks.NET installation](https://steamworks.github.io/installation/) and [Unity Git package dependencies](https://docs.unity3d.com/6000.6/Documentation/Manual/upm-git.html).

Installing or updating the wrapper is an explicit package operation. Opening a window, reading Commandments, checking local prerequisites or installing God must not silently acquire it. The user adopts published packages manually. No credentials, private keys, partner login or store configuration belong in shared package assets or public diagnostics.

## BigBang admission and compile independence

**Steamworks.NET is required before the initial Install God action.** BigBang must still compile and open when Steamworks.NET, God, Odin Inspector and Quantum Console are absent. It remains Editor-only, with no Steamworks/God/vendor assembly reference, vendor API type, native initializer or Steam package dependency. Preparation is a prerequisite policy, not a new mandatory Geurts peer dependency or a requirement that Steam services run during installation.

The explicit local check must establish supported package provenance/resolution, a compatible Windows x64 native-plugin configuration, current participating managed assemblies and the required actual managed API signatures through supported local inspection. Folder, DLL, define, stale loaded assembly or package-name presence alone is insufficient. Missing metadata, unreadable inputs and unsupported versions return an actionable unknown/blocked explanation rather than guessed success. Technical availability does not establish commercial-library licensing or Steam account entitlement.

**Local prerequisite inspection must not initialize Steam, load native Steam libraries, contact Steam or require a running client, login, AppID, account entitlement or network connectivity.** Managed inspection must not execute vendor static constructors or methods. Keep native loading, client context and real service availability in separately requested integration tests. An offline project with valid local package/compilation evidence can pass admission.

Revalidate local evidence immediately before installation dispatch. Package/source/plugin-setting changes, relevant input changes, failed compilation and script reload invalidate evidence as required by BigBang's existing compilation/session rules. Preserve its separate explicit Get Latest Git Source resolution, frozen God target, one UPM dispatch, busy guards, existing-God preservation and verified handoff. Do not force reinstall or downgrade God to apply this policy. Existing God users get an explicit preparation/upgrade route; no automatic package mutation or retroactive installation failure is introduced.

## Optional provider and shared contracts

**God remains the only mandatory shared Geurts brick.** Steamworks.NET is an external project prerequisite; the Steam provider is an optional peer. God, BigBang and generic game/peer code must compile without the Steam provider. God must not acquire Steamworks.NET references or native initialization. Shared platform-service contracts in God stay vendor-neutral and describe availability, outcomes and useful failure reasons without SDK types.

The Steam brick owns wrapper/native calls, initialization, callback dispatch, shutdown, Steam configuration, identity and overlay integration. Its release declares the tested package/API profile and separates implemented adapters from unverified real native behavior. Generic peers consume optional capabilities through God's existing registration/lifecycle. Concrete cooperation requiring two optional packages belongs in a separate integration owner. A missing, disabled, unconfigured or failed provider leaves unrelated local gameplay usable and reports Steam-specific services as unavailable. Do not invent Steam identity, achievements or successful cloud writes.

Keep public APIs and normal Editor configuration on the same services, validation and cleanup. Provide no-code configuration, readable prerequisite findings and on-demand checks through the owning supported Forge UI. Theme and Appearance apply to that Editor UI. Diagnostics remains optional: normal logging uses God's facade; genuine failures remain visible in owning status even without capture. Do not add another console or a runtime Commandments dependency.

## Runtime ownership and native activation

Use God's lifecycle and a host owned by the ordinary retained **`SCN_BigBang`** scene. Follow the Bootstrap Technique; do not use direct or indirect `DontDestroyOnLoad`, another initializer, or an unchanged SteamManager singleton. Content scene transitions must preserve the owning host and avoid duplicate initialization/subscriptions.

**Native Steam activation is off by default in local unconfigured development.** With no AppID or enabled native configuration, Editor Play and standalone development remain usable without loading or initializing Steam. Expose explicit native-test configuration separately from package readiness. Do not require a client/account just to author or test unrelated gameplay.

For deliberately enabled native use, initialize before service access or callback registration; respect the real Steam client, AppID, OS-user and entitlement context. Keep one owned callback pump on Unity's main thread and release callbacks/resources on failed start, disable, stop, reload and process exit. Shutdown belongs only to the owner of successful initialization. Test repeated sessions with the project's domain-reload settings. Valve documents [initialization, callbacks and shutdown](https://partner.steamgames.com/doc/sdk/api); they are native acceptance requirements, not local installer probes.

Make launch/restart policy explicit per tested build. `SteamAPI_RestartAppIfNecessary` is optional; when deliberately used it precedes initialization, and a true result requires the current process to exit. It can launch the installed library copy. Never invoke it during local checks or ordinary Editor Play, or surprise the user by launching a different installed executable. See [Valve's restart contract](https://partner.steamgames.com/doc/sdk/api#SteamAPI_RestartAppIfNecessary).

Overlay availability is separate from package and API readiness. Verify a real graphics-enabled Windows standalone launched through Steam; do not promise the overlay in Unity Editor. Debugger injection has graphics-device timing requirements. Expose overlay activation without deciding gameplay pause, input suspension or multiplayer authority here; the selected game design owns those choices. See [Valve's overlay requirements](https://partner.steamgames.com/doc/features/overlay).

## Configuration and Windows player artifacts

Keep local unconfigured, deliberately enabled native-test and customer-distribution configuration distinct. Validate AppID format/ownership only at the appropriate native/distribution stage. Sample AppID **480** is a development example, never this game's identity. A local `steam_appid.txt` must be deliberately managed, preserved if user-owned, and excluded from customer output. Valve explains [development AppID files and their shipping exclusion](https://partner.steamgames.com/doc/sdk/api). Do not commit private credentials or modify partner settings during package preparation.

Select a **Windows x64 Build Profile**, effective scene list, scripting backend, stripping level and native-plugin import settings explicitly. Preserve the required first two scenes. Record and validate the actual generated player and the x64 native binary supplied by the chosen wrapper, including loader location and duplicate/wrong-architecture detection. Mono success does not establish IL2CPP/AOT or another stripping configuration. Exercise each supported combination actually claimed by a release. Wrapper installation alone proves neither import configuration nor a successful native load.

Customer artifact checks must reject `steam_appid.txt`, sample/development AppID configuration, credentials and unintended test binaries. Once distribution work is authorized, verify the real game's Steam-launched depot build, launch options, account/entitlement cases and clean-machine behavior. These future checks do not require creating a release pipeline now.

## Optional services and gameplay storage

Achievements, stats, leaderboards, matchmaking, networking, Workshop, DLC, commerce, Steam Input and DRM are separate optional capabilities. Implement and verify only the selected service; targeting Steam does not install or require them. Steam Input is not a Steam Deck requirement. Do not treat Steam identity as a local save key without an explicit migration/account policy.

Gameplay saves stay local first through the owning persistence system, normally below `Application.persistentDataPath`. God settings store module configuration, not gameplay saves; the current Save and Load starter does not provide gameplay persistence. Steam Cloud remains deferred. A future adoption chooses **Auto-Cloud or Remote Storage** deliberately and validates file scope, quotas, account changes, conflicts, offline behavior and failures. Do not silently synchronize settings/temporary files or advertise successful cloud persistence. See [Valve's Steam Cloud options](https://partner.steamgames.com/doc/features/cloud).

## Evidence and acceptance

Keep four independent evidence dimensions with their exact tested versions, source commits, configuration, results and limits. They are report labels, **not new shared setup statuses** or a substitute for the Forge Setup contract:

| Evidence | What it establishes |
|---|---|
| Prerequisite ready | Local wrapper provenance, managed API/compilation evidence and Windows x64 plugin configuration; no native Steam session. |
| Prepared for Steam development | Implemented configuration/provider boundaries, unconfigured local use and tested Windows development artifacts; no release pipeline required. |
| Integration verified | The specifically exercised real native services, callbacks, cleanup and Steam-launched standalone/overlay behavior in the recorded Steam context. |
| Release validated | The separately configured real-game distribution artifacts and Steam launch/delivery checks for the tested release. |

Unperformed checks remain unknown. Documentation/host tests, mocked providers and managed compilation never establish native initialization, overlay or distribution success. Use the existing shared statuses with explanations for missing, disabled, unconfigured, failed and unchecked Steam capability.

Later brick acceptance must cover wrapper/God/vendor-absent BigBang compilation, missing/partial/incompatible imports, stale evidence and dispatch rechecks, offline local admission, installed-God preservation, provider absence/disable/failure, repeated Play and scene transitions, initialization failures/cleanup, callback ownership, supported Windows backends and stripped artifacts. Real native and distribution checks require their actual client/AppID/entitlement/graphics context. Record scripted, rendered and physical-input evidence separately under Unity and Automation rules.

For documentation publication, validate manifest routing/membership, subject versions, audience visibility, semantic boundaries, the closed schema-3 content contract, exact published catalogue sources and the candidate archive. Keep local preparation evidence separate from native and distribution acceptance. Publish a higher immutable Commandments release only after the advertised owner releases and exact pins are verified. Preserve manual consumer adoption.
