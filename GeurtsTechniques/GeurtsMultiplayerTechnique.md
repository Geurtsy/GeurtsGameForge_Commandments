<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Multiplayer Technical Topic

**Version:** 0.1.0
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsMultiplayerTechnique.md`

`GeurtsTechniqueManifest.md` alone selects this technical topic, its version and reading scope. The Technical Technique retains the shared priorities.

## Multiplayer Efficiency Rule

- Use Unity Netcode for GameObjects only when it is already installed or selected as the project's networking framework. Do not introduce or install it merely because this technique mentions it; inspect the project and use the selected networking equivalent.
- When Netcode for GameObjects is selected, target a stable compatible **2.x** release; 1.x is deprecated for this baseline. Prefer its universal `[Rpc]` API over legacy `[ServerRpc]`/`[ClientRpc]` in new code, with explicit targets and intentional ownership, authority, delivery, and validation rules. Review `NetworkTransform.Update` migrations for authority versus non-authority behavior. Use the [versioned RPC documentation](https://docs.unity3d.com/Packages/com.unity.netcode.gameobjects@2.7/manual/advanced-topics/message-system/rpc.html) for the installed release; this reference is not a universal package-version pin.
- Minimise RPC calls.
- Batch updates where possible.
- Sync only the data required for gameplay correctness.
- Do not sacrifice network efficiency for local code convenience.

The multiplayer network-efficiency override applies regardless of the selected networking framework.
