<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Multiplayer Technical Topic

**Version:** 0.3.1
**Unity minimum:** Unity 6.6 (6000.6.3f1) or newer
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsMultiplayerTechnique.md`

The manifest selects this owner for networking, replicated state and multiplayer implementation. The [Technical Technique's Multiplayer Exception](GeurtsTechnicalTechnique.md#multiplayer-exception) makes latency the highest multiplayer priority, followed by bandwidth efficiency before the normal code priorities.

## Selected Framework, Steam Transport and Player Topology

For Geurts Game Forge multiplayer, use **FishNet** as the networking framework, **FishySteamworks** through **Steamworks.NET** as the Steam gameplay transport, and **Client-Host** as the selected player topology. One hosting player's game runs the authoritative server and that player's local client in the same executable; other players join as remote clients. A rented or dedicated server is not required for this topology.

This selection applies when implementing Forge multiplayer; single-player projects do not acquire networking merely by using Forge. StandardsOnly projects retain their separately selected framework unless they explicitly adopt this selection. Preserve existing installations and authored networking content; this documentation change does not authorize automatic installation, conversion or replacement. Use another framework or a dedicated-server topology only for an explicit user/project requirement. Do not introduce Unity Netcode for GameObjects or Netcode for Entities as an additional networking stack for this baseline.

Select stable FishNet, FishySteamworks and Steamworks.NET releases verified together against the Unity minimum, selected newer Editor, Windows x64, actual scripting backend and dependency graph. Record versions and immutable source commits; no example, floating branch or untested latest release is a compatibility pin. Preserve vendor provenance and licence notices. Free FishNet is sufficient for the Host/client baseline; Pro features remain optional and require their actual selected licence and validation. A reusable Forge integration must respect the applicable dependency/add-on licence rather than copy vendor implementation into a competing networking solution.

The [Steam Integration Technique](GeurtsSteamIntegrationTechnique.md) retains ownership of Steam prerequisites, native activation and release evidence. God remains the only mandatory shared Geurts brick. Keep FishNet and Steam SDK types out of God's neutral contracts and unrelated optional bricks; concrete cooperation between optional owners belongs in its separate integration owner. This selection does not publish a new networking brick or certify an existing catalogue entry.

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

Use FishNet's included **Tugboat** transport for local Host/client testing without native Steam: Unity Editor Host plus one or more Windows clients on localhost, or separate PCs on a local network. Start one Host and join the other instances as clients. This needs no rented server or production AppID and preserves Steam's default-off unconfigured development boundary.

Test the actual **FishySteamworks** Steam path separately using distinct Steam accounts on separate devices, with the deliberately configured test AppID/session and the chosen dependency profile. FishySteamworks documents that two separate instances on one device using the same Steam account cannot connect through its Steam transport; a single Host executable containing server and local client is supported. Local Tugboat results do not establish Steam routing, native account/authentication, lobby/invite integration, relay behavior or customer distribution acceptance. Sample AppID 480 retains the Steam owner's development-only boundary.

Before releasing Client-Host behavior, exercise both the host's local client and remote-only clients, joining an active session where supported, host departure/loss, disconnect/reconnect and bootstrap-preserving content transitions. Record the actual host/client devices, roles, accounts, build/backend and transport; never expose account credentials or authentication tickets in diagnostics. Document unavailable native or multi-device cases as unverified.

## Runtime acceptance

Before releasing affected networking behavior, exercise the selected transport with the project's supported authority/topology and player counts. Require relevant cases: representative and adverse latency/jitter/loss, disconnect/reconnect during active work, host/server loss or transfer where supported, late joining/state resynchronization where supported, duplicate/stale/out-of-order messages, and invalid or unauthorized requests. Verify authoritative state, rejection of invalid input, bounded queues/retries and owned cleanup; failures must not silently corrupt state or claim synchronization. Mark genuinely unsupported cases not applicable with a reason.

Record the exact build/backend, transport/version, roles, player count, test workload, network conditions, duration, result and limits. Compare gameplay response and synchronization delay first, then bandwidth, message rate/size and resource use with budgets chosen from the project's design and measured baseline. No universal latency/FPS/player-count threshold is imposed. Automated simulations supplement the real multi-instance/network checks needed for the behavior claimed; unperformed cases remain unverified and cannot pass the affected release gate. This requirement installs no networking package and creates no project game-design facts.

## Framework References

Use the documentation and source matching the installed releases: [FishNet](https://fish-networking.gitbook.io/docs), [observer/interest management](https://fish-networking.gitbook.io/docs/guides/features/observers), [NetworkTransform controls](https://fish-networking.gitbook.io/docs/fishnet-building-blocks/components/network-transform), [FishySteamworks setup and testing](https://github.com/FirstGearGames/FishySteamworks), and [Valve's modern Steam networking](https://partner.steamgames.com/doc/features/multiplayer/networking). References describe supported mechanisms, not verified Forge implementation or universal version pins.
