<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Multiplayer Technical Topic

**Version:** 0.2.0
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsMultiplayerTechnique.md`

## Multiplayer Efficiency Rule

- Use Unity Netcode for GameObjects only when it is already installed or selected as the project's networking framework. Do not introduce or install it merely because this technique mentions it; inspect the project and use the selected networking equivalent.
- When Netcode for GameObjects is selected, target a stable compatible **2.x** release; 1.x is deprecated for this baseline. Prefer its universal `[Rpc]` API over legacy `[ServerRpc]`/`[ClientRpc]` in new code, with explicit targets and intentional ownership, authority, delivery, and validation rules. Review `NetworkTransform.Update` migrations for authority versus non-authority behavior. Use the [versioned RPC documentation](https://docs.unity3d.com/Packages/com.unity.netcode.gameobjects@2.7/manual/advanced-topics/message-system/rpc.html) for the installed release; this reference is not a universal package-version pin.
- Minimise RPC calls.
- Batch updates where possible.
- Sync only the data required for gameplay correctness.
- Do not sacrifice network efficiency for local code convenience.

The multiplayer network-efficiency override applies regardless of the selected networking framework.

## Runtime acceptance

Before releasing affected networking behavior, exercise the selected transport with the project's supported authority/topology and player counts. Require relevant cases: representative and adverse latency/jitter/loss, disconnect/reconnect during active work, host/server loss or transfer where supported, late joining/state resynchronization where supported, duplicate/stale/out-of-order messages, and invalid or unauthorized requests. Verify authoritative state, rejection of invalid input, bounded queues/retries and owned cleanup; failures must not silently corrupt state or claim synchronization. Mark genuinely unsupported cases not applicable with a reason.

Record the exact build/backend, transport/version, roles, player count, test workload, network conditions, duration, result and limits. Compare bandwidth, message rate/size, synchronization delay and resource use with budgets chosen from the project's design and measured baseline. No universal latency/FPS/player-count threshold is imposed. Automated simulations supplement the real multi-instance/network checks needed for the behavior claimed; unperformed cases remain unverified and cannot pass the affected release gate. This requirement installs no networking package and creates no project game-design facts.
