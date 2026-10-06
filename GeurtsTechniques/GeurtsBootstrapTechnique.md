<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Bootstrap Technical Topic

**Version:** 0.1.0
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsBootstrapTechnique.md`

`GeurtsTechniqueManifest.md` alone selects this technical topic, its version and reading scope. The Technical Technique retains the shared priorities.

## Required Project Scenes

Every Geurts Unity project must contain the following two scenes. The Folder Structure Technique owns their exact [asset placement and required scene folders](GeurtsFolderStructureTechnique.md#required-scene-structure).

| Build index | Required scene | Purpose |
|---|---|---|
| 0 | `SCN_BigBang` | Project entry scene for booting and initialisation. |
| 1 | `SCN_DevPlayground` | Initial development and testing scene. |

Both scenes must be enabled in the effective scene list for each game Build Profile, with `SCN_BigBang` first and `SCN_DevPlayground` second. Additional enabled scenes follow at index 2 or later. If a profile overrides the global scene list, its override must retain the same two starting entries. Scene indices are zero-based build indices, not positions in the Editor hierarchy. See Unity's Scene List guidance and scene build-index reference.

Project setup must verify that both entries refer to real scene assets at their required paths and that neither is missing, disabled, duplicated or assigned the wrong index. Use supported Unity Editor scene and Build Profile APIs for changes; preserve existing scene contents, references and unrelated scene-list entries. Do not overwrite an existing scene to satisfy the baseline. The folder-creation script alone does not establish scene compliance.

The exact required scene identities `SCN_BigBang` and `SCN_DevPlayground` are fixed-name contracts under the [Naming Technique's exceptions](GeurtsNamingTechnique.md#8-exceptions-and-preservation). Do not rename them to apply a generic asset pattern.

This baseline defines scene identity, purpose and build order. Scene contents and destination flow follow the project's separately selected design requirements within the mandatory bootstrap lifetime rules below.

## Bootstrap Scenes and Runtime Persistence

**Use bootstrap scenes for runtime persistence. Do not use `UnityEngine.Object.DontDestroyOnLoad` ("Don't Destroy On Load") in first-party game code or Geurts Game Forge bricks, directly or through wrappers, aliases, or adapters.** Keep persistent objects owned by ordinary loaded bootstrap scenes rather than Unity's hidden persistence scene.

- Use `SCN_BigBang` as the primary bootstrap scene. Load bootstrap before dependent content, wait for required services to be ready, and keep the bootstrap scene loaded throughout the application or Play session. Additional bootstrap scenes are appropriate only when an actual service ownership need requires them.
- Keep application-wide service hosts, console/EventSystem objects, global input/audio/UI services, and persistent pool roots in the bootstrap scene that owns their lifetime. God remains the shared brick lifecycle authority: scene placement must not introduce a second brick initializer. Disabling or stopping a brick still releases its owned objects, subscriptions, tasks, and resources.
- Load frontend, gameplay, and test content additively; replacement unloads only the outgoing content scenes. Exclude bootstrap scenes from content unload/replacement sets. Do not use `LoadSceneMode.Single` for content transitions after bootstrap startup, because it unloads the retained bootstrap scene. See Unity's [Additive](https://docs.unity3d.com/6000.6/Documentation/ScriptReference/SceneManagement.LoadSceneMode.Additive.html) and [Single](https://docs.unity3d.com/6000.6/Documentation/ScriptReference/SceneManagement.LoadSceneMode.Single.html) loading references.
- Give dynamically created persistent objects explicit bootstrap ownership. Create them beneath a known bootstrap-owned root, or move an unparented root into the known loaded bootstrap scene through supported scene APIs. Do not rely on the currently active scene: it controls the destination of newly instantiated objects and lighting settings. Select the active content scene deliberately and keep scene-local gameplay objects owned by that scene for cleanup on unload. See [SetActiveScene](https://docs.unity3d.com/6000.6/Documentation/ScriptReference/SceneManagement.SceneManager.SetActiveScene.html) and [MoveGameObjectToScene](https://docs.unity3d.com/6000.6/Documentation/ScriptReference/SceneManagement.SceneManager.MoveGameObjectToScene.html).
- Reuse the installed Scene Loading and Bootstrap brick when its supported capabilities fit. It remains optional; bootstrap architecture does not add a mandatory peer-brick dependency. Editor Play must initialize bootstrap before dependent content and preserve the user's original Editor scene arrangement.

Use supported vendor configuration to disable automatic `DontDestroyOnLoad` behaviour and retain scene ownership where available. If unavoidable vendor internals still use it, report the compatibility gap and the required compatible integration or release; do not patch licensed vendor source or claim full compliance. Existing first-party violations require a scoped, versioned migration that preserves scene/prefab references. A documentation update alone neither migrates a project nor certifies current published packages.

For affected runtime changes, verify bootstrap survives successful, failed, cancelled, and retried content transitions; service instances and subscriptions do not duplicate across repeated Play sessions; scene-local objects clean up; and owned services stop correctly. Preserve dirty/untitled Editor scenes and validate Windows player behaviour through the selected Automation and validation rules.

---
