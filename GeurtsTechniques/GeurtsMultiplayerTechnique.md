<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Multiplayer Technical Topic

**Version:** 0.4.0
**Unity minimum:** Unity 6.6 (6000.6.3f1) or newer
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsMultiplayerTechnique.md`

The manifest selects this owner for networking, replicated state and multiplayer implementation. The [Technical Technique's Multiplayer Exception](GeurtsTechnicalTechnique.md#multiplayer-exception) makes latency the highest multiplayer priority, followed by bandwidth efficiency before the normal code priorities.

## Selected Framework, Steam Transport and Player Topology

For Geurts Game Forge multiplayer, use **FishNet** as the networking framework, **FishySteamworks** through **Steamworks.NET** as the Steam gameplay transport, and **Client-Host** as the selected player topology. One hosting player's game runs the authoritative server and that player's local client in the same executable; other players join as remote clients. A rented or dedicated server is not required for this topology.

This selection applies when implementing Forge multiplayer; single-player projects do not acquire networking merely by using Forge. StandardsOnly projects retain their separately selected framework unless they explicitly adopt this selection. Preserve existing installations and authored networking content; this documentation change does not authorize automatic installation, conversion or replacement. Use another framework or a dedicated-server topology only for an explicit user/project requirement. Do not introduce Unity Netcode for GameObjects or Netcode for Entities as an additional networking stack for this baseline.

Select stable FishNet, FishySteamworks and Steamworks.NET releases verified together against the Unity minimum, selected newer Editor, Windows x64, actual scripting backend and dependency graph. Record versions and immutable source commits; no example, floating branch or untested latest release is a compatibility pin. Preserve vendor provenance and licence notices. Free FishNet is sufficient for the Host/client baseline; Pro features remain optional and require their actual selected licence and validation. A reusable Forge integration must respect the applicable dependency/add-on licence rather than copy vendor implementation into a competing networking solution.

The [Steam Integration Technique](GeurtsSteamIntegrationTechnique.md) retains ownership of Steam prerequisites, native activation and release evidence. God remains the only mandatory shared Geurts brick. Keep FishNet and Steam SDK types out of God's neutral contracts and unrelated optional bricks. Apply the built-in Multiplayer ownership below instead of moving Steam networking into an optional integration package. This selection does not publish a new networking brick or certify an existing catalogue entry.

## Multiplayer Kit and Built-In Steam Support

**Steam multiplayer support is required inside the Multiplayer kit.** Selecting Multiplayer always includes its Steam transport integration, configuration, connection lifecycle and failure reporting. Do not offer a Steam-free Multiplayer edition or make Steam networking an optional separate kit, add-on or integration package. Local development mode changes which transport runs; it does not remove the required Steam implementation from the kit.

The responsibilities are distinct:

| Component | Responsibility within the required stack |
|---|---|
| FishNet | Network objects, replication, remote calls, prediction and host/server authority. FishNet alone does not provide Steam services. |
| FishySteamworks | FishNet's Steam transport, using Steamworks.NET to connect through Steam networking. |
| Steamworks.NET | Managed access to Valve's Steamworks APIs and the matching native binaries. |
| Multiplayer kit | Built-in wiring, supported no-code setup and API extensions, transport selection, host/client connections, Steam-session coordination and cleanup. |

These are required external dependencies of the selected Multiplayer implementation, not universal FishNet prerequisites for single-player Forge projects. Acquire them explicitly from their supported distributions and record a jointly verified immutable dependency profile before releasing Multiplayer. Do not vendor or redistribute third-party source outside its licence, install duplicate wrappers, invent package identifiers, or add Git URLs to a package's `package.json.dependencies`.

The existing **Geurts Game Forge Steam** brick remains a separate optional platform-services and release-preparation brick. Preserve its identity, published source and supported services; this policy neither removes it nor turns it into a separate optional Steam multiplayer kit. Multiplayer must supply its required Steam networking without requiring users to select that brick. Unrelated achievements, stats, cloud storage, Workshop and distribution features remain outside Multiplayer's required networking scope. Lobby discovery, invitations and matchmaking need their own explicitly selected behavior and evidence; a transport connection alone does not implement them.

### One native Steam session

Multiplayer owns its required transport integration inside the kit, including the means to use one correctly owned native session when the standalone Steam brick is absent. If that brick is also enabled, both must cooperate through supported lifecycle/capability contracts with **one initializer, one callback pump and one shutdown owner**. Reuse a compatible existing owner; never initialize twice, take over another owner's session or stop it while another consumer still depends on it. Releasing Multiplayer connections must release only its registrations and owned resources. Provider failure/withdrawal must terminate affected Steam connections visibly and preserve unrelated local functionality.

This is a required implementation contract, not a claim that the currently published Steam/God APIs already support this cooperation. Verify actual owner APIs and coordinate any necessary owner release before advertising combined support; missing ownership/cooperation evidence blocks that configuration. Keep SDK types out of God and use the Steam owner's native activation, callback and shutdown rules. The general separate-integration rule does not split this built-in Multiplayer responsibility into another kit.

## Availability, Setup and Owner Handoff

The [Catalogue](GeurtsBrickCatalogue.json) records `com.geurts.gameforge.multiplayer` as **planned and unavailable**, with no release version, source or verified God minimum. There is no verified owning implementation, installation source, supported Forge API, operation or executable recipe in this documentation update. The [usage index](GeurtsBrickUsageGuide.md#multiplayer) routes this declared requirement; do not present third-party setup instructions as a released Forge workflow.

Before publishing the owning implementation:

1. Verify God, licensed libraries, FishNet, FishySteamworks and Steamworks.NET against the actual Unity/Windows dependency profile. Keep installation explicit; local package checks must not initialize Steam or require an account/AppID.
2. Provide supported Multiplayer Editor configuration for the retained bootstrap-owned NetworkManager, local Tugboat testing and the included Steam transport. Give native-test mode explicit AppID/session prerequisites and actionable blocked/failed results. Native activation remains off for unconfigured local development; never silently fall back to Tugboat after a requested Steam connection fails.
3. Provide the same configuration, start/host/join, disconnect/stop and validation paths through supported public APIs. Publish exact owner entry points and a meaningful no-code/API recipe only after implementation and validation; selecting this specification creates none.
4. Keep Multiplayer configuration in its own God-managed settings, preserving unrelated Steam settings and authored network content. Disable/stop must release connections, callbacks and owned resources; enable/restart uses retained settings with fresh prerequisite checks. No automatic project conversion or package update is authorized.
5. Verify the Steam path with the standalone Steam brick absent and the combined configuration with it present, including disabled/failed providers, repeated Play, stop order and bootstrap transitions. Coordinate changes to Steam/God only if their actual APIs cannot satisfy the single-session contract. Record exact source pins, dependency minimums, owner guides and evidence before changing the planned catalogue entry to released.

The outstanding implementation owner is Multiplayer; Steam/God lifecycle cooperation and compatible third-party versions remain unverified dependencies. This documentation repository contains no runtime implementation and does not certify another repository or installed project.

## Client-Host Authority and Runtime Ownership

- Keep authoritative gameplay state, spawning and accepted mutations on the host's server side. Remote and local host clients submit bounded requests/inputs; validate identity, ownership, permission, payload and current state before mutation. The host player's local path must retain the same validation as remote clients. A client claiming to be the host does not grant authority.
- Use FishNet's supported client prediction/reconciliation when gameplay needs immediate local response, with the server validating authoritative results. Prediction addresses responsiveness; measure its input, correction and resimulation costs instead of assuming it saves bandwidth. Use the installed FishNet RPC, synchronization and serialization APIs; Unity Netcode RPC attributes are not FishNet API guidance.
- FishySteamworks Peer To Peer connections describe Steam routing to the host, not distributed gameplay authority. Steam identity, lobby membership and transport connectivity do not independently authorize a gameplay request. The game owns admission, session policy and permission; Diagnostics testing overrides must never bypass host/server authority.
- Place the network manager and application-wide transport hosts in the ordinary retained `SCN_BigBang` bootstrap scene. Disable FishNet's automatic `DontDestroyOnLoad` setting before runtime initialization. Follow the [Bootstrap Technique](GeurtsBootstrapTechnique.md#bootstrap-scenes-and-runtime-persistence) for scene ownership and cleanup; do not add direct or indirect hidden-scene persistence.
- Reuse one owned Steam initialization, callback pump and shutdown path under the Steam Integration owner; do not add an unchanged example SteamManager or duplicate native initializer. Coordinate FishNet scene membership/readiness with the existing scene-loading owner while retaining bootstrap. Release connections, callbacks, queued work and subscriptions on failed start, disconnect, stop and repeated Play sessions.
- Handle host departure/loss as an explicit session outcome with owned cleanup and an actionable result. Host migration, reconnection into a replacement session and dedicated-server deployment require separately selected design and tested implementation; they are not automatic guarantees of Client-Host mode. Include the hosting player's simulation workload and upload capacity in project budgets.

## Multiplayer Efficiency Rule

- Apply the Technical owner's latency-first, bandwidth-second order. Minimise RPC calls and recipient fan-out; batch updates only when doing so does not increase gameplay latency. Synchronize only data required for gameplay correctness.
- Configure FishNet observer/interest conditions so each client receives only relevant objects and state; preserve readiness and correct state when relevance changes.
- Use changed-value synchronization, supported packing/quantization and compact serializers with precision justified by gameplay. Set tick/send intervals for low latency in the actual workload, then reduce traffic where that latency is preserved; do not lower update frequency solely to save bandwidth when it increases gameplay delay. Avoid unnecessary transform properties, repeated unchanged payloads and cosmetic state that can be derived locally.
- Choose reliable or unreliable delivery intentionally for each message's correctness and recovery needs. Bound message sizes, queues, retries and request rates; avoid excessive retransmission or fragmented payloads.
- Do not sacrifice latency for bandwidth savings or other code priorities. Measure gameplay response and synchronization delay first, then actual bytes, message/packet rates, host upload and resource use under representative and adverse conditions. Record before/after latency and bandwidth for the chosen trade-off. Selecting FishNet or Steam relay does not itself establish an efficiency improvement.

The Technical owner's latency-first, bandwidth-second multiplayer override applies regardless of the selected networking framework. This topic implements that rule; it does not replace or reorder the Technical Technique's priorities.

## Local Testing and Steam Acceptance

Use FishNet's included **Tugboat** transport for local Host/client testing without native Steam: Unity Editor Host plus one or more Windows clients on localhost, or separate PCs on a local network. Start one Host and join the other instances as clients. This needs no rented server or production AppID and preserves Steam's default-off unconfigured development boundary. Tugboat is a testing mode inside the same Steam-capable kit; passing it cannot satisfy the required Steam release acceptance.

Test the actual **FishySteamworks** Steam path separately using distinct Steam accounts on separate devices, with the deliberately configured test AppID/session and the chosen dependency profile. FishySteamworks documents that two separate instances on one device using the same Steam account cannot connect through its Steam transport; a single Host executable containing server and local client is supported. Local Tugboat results do not establish Steam routing, native account/authentication, lobby/invite integration, relay behavior or customer distribution acceptance. Sample AppID 480 retains the Steam owner's development-only boundary.

Before releasing Client-Host behavior, exercise both the host's local client and remote-only clients, joining an active session where supported, host departure/loss, disconnect/reconnect and bootstrap-preserving content transitions. Record the actual host/client devices, roles, accounts, build/backend and transport; never expose account credentials or authentication tickets in diagnostics. Document unavailable native or multi-device cases as unverified.

## Runtime acceptance

Before releasing affected networking behavior, exercise the selected transport with the project's supported authority/topology and player counts. Require relevant cases: representative and adverse latency/jitter/loss, disconnect/reconnect during active work, host/server loss or transfer where supported, late joining/state resynchronization where supported, duplicate/stale/out-of-order messages, and invalid or unauthorized requests. Verify authoritative state, rejection of invalid input, bounded queues/retries and owned cleanup; failures must not silently corrupt state or claim synchronization. Mark genuinely unsupported cases not applicable with a reason.

Record the exact build/backend, transport/version, roles, player count, test workload, network conditions, duration, result and limits. Compare gameplay response and synchronization delay first, then bandwidth, message rate/size and resource use with budgets chosen from the project's design and measured baseline. No universal latency/FPS/player-count threshold is imposed. Automated simulations supplement the real multi-instance/network checks needed for the behavior claimed; unperformed cases remain unverified and cannot pass the affected release gate. This requirement installs no networking package and creates no project game-design facts.

## Framework References

Primary references checked on 30 October 2026: [FishNet's FishySteamworks transport guide](https://fish-networking.gitbook.io/docs/fishnet-building-blocks/transports/fishysteamworks) explicitly requires Steamworks.NET; [the transport owner's setup and testing guide](https://github.com/FirstGearGames/FishySteamworks) documents host/client operation and separate-account/device testing; [Steamworks.NET installation](https://steamworks.github.io/installation/) supplies the official wrapper distribution. This verifies component selection, not a jointly tested release profile.

Use the documentation and source matching the installed releases: [FishNet](https://fish-networking.gitbook.io/docs), [observer/interest management](https://fish-networking.gitbook.io/docs/guides/features/observers), [NetworkTransform controls](https://fish-networking.gitbook.io/docs/fishnet-building-blocks/components/network-transform), and [Valve's modern Steam networking](https://partner.steamgames.com/doc/features/multiplayer/networking). References describe supported mechanisms, not verified Forge implementation or universal version pins.
