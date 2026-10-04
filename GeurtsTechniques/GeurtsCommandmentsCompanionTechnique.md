<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Commandments Service and Companion Compatibility Technique

**Version:** 3.1.0
**Contract schema:** 3.0.0
**Package version:** 0.44.14
**Status:** Draft normative technique
**Primary audience:** God Editor service and compatibility adapter maintainers
**Secondary audience:** AI coding agents and human developers
**Required package path:** `GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md`

## 1. Scope and Ownership

God **0.29.0** owns Commandments viewing, acquisition, explicit version checks, confirmed updates and shared status in its existing Editor assembly. `GeurtsTechniqueManifest.md` remains the sole resolver for package-file selection, versions, subject ownership, applicability, reading order and conflicts. The retained technique/contract filenames and the word companion in the schema lifecycle below are compatibility vocabulary for this God-owned service, not permission for another updater.

God is a Windows-only, Editor-service owner installed through Unity Package Manager from `Geurtsy/com.geurts.gameforge.god`. It requires separately installed licensed Odin Inspector and Quantum Console assemblies. The passive compatibility adapter in `Geurtsy/com.geurts.gameforge.commandments` has no God or other Unity Package Manager package dependency, no vendor references, no lifecycle callbacks, no network transport and no menu or console-command registrations. It cannot acquire content without the supported God service.

`Geurtsy/GeurtsGameForge_Commandments` remains the sole source and authority for generic Geurts Game Forge documentation. This repository contains no Commandments Companion plugin code or God implementation. Ordinary Markdown tools can read local Commandments without any Unity package. Content releases do not require a God release while schema 3.0.0 and the pinned setup payloads remain supported. God must not bundle a generic Commandments copy in `Documentation~/`.

There is no external installer, Windows bootstrap, batch-driven setup, or separate companion setup action for content acquisition. BigBang may install prerequisites and God; it does not acquire Commandments or run this update action.

### Public Editor interfaces and no-code use

Open **Tools > Geurts Game Forge > Commandments** or **View Commandments** inside God. The view includes installed and available content versions, explicit check/update actions, shared progress/failure, module preference and an offline local reader. Package versions and content versions remain separate. Opening, restoring, resizing or scrolling a view does not check remotely or acquire content.

`Geurts.GameForge.God.Editor.CommandmentsIntegration` (API 1.0.0, assembly `Geurts.GameForge.God.Editor`) is the supported Editor interface for status/version/progress, Changed events, explicit checking, confirmed manual updates, host operation guards, local reading and owned embedded views. `CommandmentsSetupIntegration` supplies the existing separate Codex-guide and Git Ignore helpers. Install Codex guide remains a user-selected, independently confirmed action owned by the AGENTS.md Technique; it writes only the selected guide.

Angels and custom Editor callers use these public interfaces and the same controller; no runtime assembly may reference them. BigBang must remain compile-independent: its normal handoff executes God's existing menu only after verified installation. A future optional integration can discover the public Editor API after God is present; it must not add runtime documentation dependencies or silently acquire content. This contract authorizes no Angels implementation.

CreateEmbeddedWindow(Action<string>) returns an unshown, independent view. The host owns its lifetime, destroys it on Back/closure, and never reuses or closes a user's standalone window. Its complete version/check/update controls remain visible in God; its callback is navigation only. Explicit content actions use the same confirmation, guards and status. Local reading accepts only a bounded file beneath GeurtsGameForgeCommandments, rejects traversal/reparse escapes, and never selects game design files.

### Existing installation transition

Update installed Companion packages to **0.15.0** and God to **0.29.0** or newer using immutable Git releases. Either order is supported: the adapter with older God reports the missing owner; new God with a pre-adapter Companion blocks competing content actions and installs the old public operation guard when available. Existing active legacy content work also blocks package changes. Package updates alone never replace Commandments, AI routes, saved consent or preferences.

The adapter retains UPM ID `com.geurts.gameforge.documentation`, assembly `Geurts.GameForge.Documentation.Editor`, public `DocumentationIntegration`, `Geurts.GameForge.Commandments.CommandmentsIntegration` and `BuildForgeIntegration`, and the legacy window script GUID. Its restored window is only a handoff notice. God suppresses its legacy aliases while an old implementation owns those aliases. After both updates there is one content controller and no duplicate menu/command registrations.

The catalogue marks the adapter `compatibilityOnly: true`: it is available as an update for existing installations but excluded from fresh installs and Install All. Keep it while custom Editor assemblies reference the old API; migrate those references to God's Editor assembly and supported APIs, then remove it through UPM. No automatic custom-code or guide rewrite is allowed. Existing God GUIDs and retained adapter identities remain stable; moved internal scripts receive new God GUIDs so both old packages can coexist during transition.

Keep local edits outside the four managed targets or preserve them manually before accepting content replacement. Never automatically rewrite AGENTS.md, migrate the older GeurtsGameForgeDocumentation folder, or touch Docs/GameDesign. See [v0.41.0 migration](../Migrations/v0.41.0.md) for the exact transition and ownership map.

### Consent, package work and automatic God openings

The content action remains exactly **Update Geurts Game Forge Commandments**. It must show the one cancel-default confirmation before archive acquisition, including on the first manual content installation. A manual God package installation or Update All never implies content consent. Content and package operations share busy guards; a package update is not a content update. Missing/incompatible APIs report an actionable update explanation and never create a second implementation.

God retains **Automatically update packages and documentation** and **Automatically refresh the catalogue** as separate default-off options. Saved schema-3 consent uses the unchanged `commandments_schema_3` token and exact four-target explanation, local-edit loss, no backup or rollback, and preservation of unlisted paths. Cancel leaves the preference off. The only per-invocation-confirmation exception is an opted-in deliberate God menu opening, never startup, a restored window or merely enabling an option/module.

God's public UpdateCommandmentsAutomaticallyAsync(Func<bool> stillAuthorized) is reserved for that opted-in sequence after successful package work. It checks metadata and acquires only when needed; failed checks do not authorize acquisition. Recheck live consent, God lifetime and operation guards after download and before the first replacement. Closing God or disabling consent stops pending replacement. Legacy schema-2 automatic callers are refused before work. There is no automatic retry or rollback. Keep the existing module preference key and schema-3 successful-commit key exactly; migration must not reset either.

## 2. Closed Data Contract

`GeurtsCommandmentsCompanionContract.json` is the smallest closed data contract for this lifecycle. It names only:

- the official source and exact archive selection;
- the one project-local documentation destination;
- the entries required during basic candidate validation;
- the Update action and confirmation targets; and
- the three exact documentation-template-to-project-target mappings.

It is not a general setup-plan format, script manifest, extensible task engine, or permission catalogue. An implementation must reject an unsupported schema, a missing or unknown field, a duplicate mapping or target, an unsafe validation path, or any source, destination, template, target, action label, or confirmation behavior that differs from the supported schema contract. It must not discover additional work from repository contents.

Because the confirmation occurs before archive acquisition, a schema-3.0.0 companion must carry this exact supported destination, four-target list, and three template-to-target mappings for the dialog and mutation boundary. After confirmation and download, it must parse the archive's contract and require the pre-approved source selection, destination, action, confirmation behavior, target paths and effects, template paths, target paths, and mapping order before the first project mutation. The earlier approval does not authorize a changed or expanded managed target set. `packageVersion` and `validationEntries` follow the forward-compatible rules in the next paragraph rather than being pinned to the initial v0.11.0 values.

`packageVersion` is source-release metadata, not a companion compatibility gate: it must be a valid version and exactly match the package manifest in the same archive, but a later package version alone must not require a companion release while schema 3.0.0 remains supported. `validationEntries` is the archive's closed current completeness list; a schema-3.0.0 consumer may read a later list rather than pinning v0.11.0, but every entry must be unique, safe, readable, and archive-root-relative before mutation. Validation entries grant no project-read or project-write authority. Mapping `template` values are also archive-root-relative; `destination.projectRelativePath`, confirmation `path` values, and mapping `target` values are Unity-project-root-relative. All contract paths use `/` separators and contain no rooted path, empty segment, `.` segment, or `..` segment.

## 3. Project and Source Boundaries

The production source is:

```text
Repository: https://github.com/Geurtsy/GeurtsGameForge_Commandments.git
Branch: main
Selection: archive of the exact resolved main-head commit
```

The managed project-local documentation destination is exactly:

```text
<ProjectRoot>/GeurtsGameForgeCommandments/
```

The companion treats that destination as logically read-only managed content. Logical read-only status is a usage and ownership rule, not permission to set Windows read-only attributes. Users and automated tools should not maintain local changes there. A confirmed Update discards every local addition, deletion, and edit inside the destination without inspecting or preserving drift.

The three managed project AI targets are exactly:

```text
<ProjectRoot>/.github/copilot-instructions.md
<ProjectRoot>/.github/instructions/geurts-unity.instructions.md
<ProjectRoot>/.github/instructions/geurts-game-design.instructions.md
```

Within the companion Update, this technique owns complete replacement of those three files from the exact template mappings in the selected contract. The action does not merge managed regions, preserve content in those files, honor a native-entry opt-out, migrate legacy content, or invoke `ManageGeurtsAgentInstructions.ps1`. If `.github/` or `.github/instructions/` is absent, the companion may create only the missing parent directories required to materialize the listed targets. It must preserve every unlisted file and directory within those parents.

Every other project path is outside the lifecycle. In particular, the companion must not enumerate, inspect, create, validate, hash, modify, or delete anything under:

```text
<ProjectRoot>/Docs/GameDesign/
```

Merely copying the scoped game-design instruction template to its listed target does not authorize access to any path matched by that template.

## 4. Offline Startup and Explicit Metadata Checks

On each normal Unity project launch or open, the companion must not check remote metadata, refresh a catalogue or open an update popup. Restoring a dashboard must not schedule checks. A deliberate Commandments Companion menu opening or explicit metadata check may request the official repository's current `main` head commit; it compares that remote commit ID with one persistent companion-owned last-successful-installed commit value for this Unity project, held outside the Unity project filesystem and outside the installed UPM package, for example in host or Editor preference storage. The value must be keyed by a Unity-provided project identity or normalized project-root path derived without reading project content; a value for one project must never suppress availability in another. The companion must not create a project file or project path for this value. The check must not download an archive, inspect the managed documentation copy, inspect any AI target, mutate a managed project target, execute setup work, or synchronize content. A skipped, failed, or unavailable request is non-blocking.

An Update is available when the last-successful-installed commit value is missing or differs from the remote `main` head commit. Matching values mean only that the authoritative source has not advanced since the last fully successful companion Update; they do not validate or certify mutable local files. When the remote commit is unavailable, availability is unknown. The explicit Update action remains available in every state.

Ordinary AI-session initialization performs no additional remote check.

The last-successful-installed value contains only the exact commit ID selected by the most recent Update that completed and verified all four managed targets. It is comparison-only, non-authoritative, and non-blocking. It is not a receipt, package-version record, compatibility state, local-integrity assertion, drift record, backup pointer, rollback marker, recovery metadata, journal, or state-machine gate. Its write is attempted only after full managed-target success and never authorizes, blocks, repairs, or expands project mutation. If persistence fails, the managed-target Update remains successful, the companion reports a comparison-state warning, and a later open may offer the same Update again. An implementation must not claim that mutable local files are certified current merely from this value or from package-version ordering.

## 5. Explicit In-Editor Update

The companion exposes exactly one lifecycle action:

```text
Update Geurts Game Forge Commandments
```

Selecting it immediately shows one confirmation dialog. There is no earlier preview, dry run, check phase, setup screen, or second confirmation. Cancel is the initially focused and default response. Closing or dismissing the dialog, pressing Escape, or otherwise declining must cause no network or filesystem change from the Update action.

The confirmation must identify all four destructive targets and no implied broader scope:

```text
GeurtsGameForgeCommandments/                                                     entire folder replaced
.github/copilot-instructions.md                                                   entire file replaced
.github/instructions/geurts-unity.instructions.md                                 entire file replaced
.github/instructions/geurts-game-design.instructions.md                           entire file replaced
```

It must state that every local change in those targets will be overwritten and lost, that there is no backup or rollback, and that `Docs/GameDesign/` and every unlisted project path will not be accessed or changed.

No archive acquisition or project mutation may begin before affirmative confirmation.

## 6. Confirmed Update Sequence

After affirmative confirmation, the companion performs this bounded sequence:

1. Resolve the official repository's current `main` head commit and capture its exact commit ID.
2. Download an archive pinned to that exact commit into a temporary location outside the Unity project.
3. Perform basic pre-mutation validation: confirm the configured official source, the selected exact commit, safe relative archive paths, supported regular-file and directory entries, absence of Git metadata, readability of every contract-listed validation entry, readable entry routing through `AI_READ_FIRST.md` and `GeurtsTechniqueManifest.md`, support for contract schema 3.0.0, and equality between the contract and manifest package versions.
4. Delete any existing `<ProjectRoot>/GeurtsGameForgeCommandments/` and directly materialize the complete validated archive tree at that exact destination. The result contains no `.git` metadata or continuing repository, worktree, branch, remote, or synchronization connection.
5. Directly replace each of the three AI target files with the bytes of its mapped template from the same validated candidate. Create only a missing `.github/` or `.github/instructions/` parent needed for those exact files.
6. Verify that the complete documentation destination and all three mapped target files were written successfully.
7. After every managed-target verification passes, report the content Update as successful and attempt to write the selected exact commit ID as the companion-owned last-successful-installed value. If that comparison-state write fails, report a warning and allow a later open to offer the Update again; do not reclassify, undo, or repair the successful four-target replacement.
8. Remove temporary acquisition content on a best-effort basis. It is never a backup, rollback source, quarantine, journal, recovery state, or prerequisite for a later Update.

Validation must finish before the first destructive project mutation. After mutation begins, any failure or interruption may leave the documentation destination or one or more AI targets missing, incomplete, or from different attempts. The companion reports failure plainly and never reports partial completion as success. The only retry is another user-invoked Update with the same confirmation; there is no automatic repair or recovery flow.

## 7. Forbidden Behavior

Outside the explicit saved-consent God-opening exception above, Documentation Update must not:

- automatically download, install, replace, repair, or synchronize documentation or AI routes on Unity open;
- scan for or execute `.bat`, `.cmd`, `.ps1`, or any other script from either the documentation package or the Unity project;
- run folder creation, GDD scaffolding, GDD manifest maintenance, `.gitignore` provisioning, native-entry management, migration, or any other setup action;
- inspect or preserve local drift in the documentation destination or three managed AI targets;
- create a preview, dry run, backup, snapshot, rollback, quarantine, journal, recovery gate, last-valid copy, merge, opt-out, or migration path for this Update;
- modify any project file beyond the documentation destination and three mapped AI files; or
- treat a newly discovered repository file, script, manifest entry, or directory as executable work.

The complete documentation tree is copied as inert content. The presence of tools within that tree does not authorize their execution.

## 8. AI Routing Limitation

The three managed AI files route supported tools to `GeurtsGameForgeCommandments/AI_READ_FIRST.md`, which continues to the manifest-selected package chain. They do not make every AI product obey the documentation automatically.

Each source template explicitly tells an agent to read that installed entry before planning or modifying any Geurts Game Forge brick code and to treat the installed, manifest-selected documentation as the source of truth for the work. The companion copies that instruction only through the three declared mappings and does not discover or alter any other agent configuration.

An AI tool must support the applicable native instruction file or be explicitly instructed to read and follow `AI_READ_FIRST.md`. Tools that ignore those instruction surfaces may not discover or follow the Geurts documentation. The companion must present this limitation accurately and must not claim universal AI control or compliance.

## 9. Conformance

A conforming companion:

- is implemented in God's existing Windows Editor assembly outside this content repository, retaining God's separately installed licensed Odin Inspector and Quantum Console assemblies; the optional passive adapter owns no independent service;
- performs no remote checks or catalogue refresh at Unity startup or when restoring a window; explicit metadata checks never mutate managed targets;
- reports an Update available when its comparison-only last-successful-installed commit value is missing or differs from the remote head, and attempts to write that value only after all four managed targets verify successfully;
- exposes the one exact in-Editor Update action and one cancel-default confirmation listing the documentation folder and three AI files;
- acquires and validates one exact-commit archive only after confirmation;
- directly replaces the complete documentation destination followed by the three exact contract-mapped AI files;
- reports success only when the documentation copy and all three route targets are complete;
- treats the managed documentation copy as logically read-only and discards local edits on confirmed Update;
- never accesses `Docs/GameDesign/`, executes scripts, performs setup, or changes any unlisted project file; and
- explains the native AI routing limitation without promising universal enforcement.

## Separate Codex guide installation

The AGENTS.md Technique owns the separate **Install Codex guide** action. Documentation Update excludes Codex guides. The user chooses a folder and confirms replacement of only its AGENTS.md; that guide points directly to the installed AI_READ_FIRST.md. No guide is automatically created at the project root or shipped as a standalone file inside this documentation package. God 0.29.0 owns this helper; the optional 0.15.0 adapter forwards the retained Editor API. Earlier Companion 0.14.0 introduced schema-3.0.0 support. Schema 2 consent is not valid for the renamed target.

## Independent module preference

God 0.29.0 exposes **Module enabled** in its Commandments view and public **ModuleEnabled**, **SetModuleEnabled(bool)** and **ModuleToggleUnavailableReason** Editor integration members. These retain the preference introduced by Companion 0.12.0 and the API previously used by God 0.24.0; the passive adapter forwards to this same service. The preference defaults on and is keyed by the normalized Unity project root in Editor preference storage, outside the project filesystem and installed package. It is independent of the last-successful commit signal and automatic-update consent. Turning it off blocks new metadata checks, content updates and setup writes, including queued window actions; installed package, guidance, routes and existing saved preferences remain untouched. Active Commandments Companion, host or Unity work must finish before switching; do not cancel in-flight work or introduce cleanup/deletion. Its window remains reachable for information and re-enabling. Turning it on starts no network or installation work. Preserve the normal explicit menu/check actions and all Update consent, validation and four-target boundaries. This preference changes neither contract schema 3.0.0 nor the Update target set.
