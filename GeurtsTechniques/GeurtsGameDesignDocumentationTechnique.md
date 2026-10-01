<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Game Design Documentation Technique

**Game Design Documentation Discovery - AI and Human Developer Reference**  
**Version:** 0.14.1
**Status:** Draft normative technique
**Primary audience:** AI coding agents and automated development systems
**Secondary audience:** Human developers
**Required package path:** `GeurtsTechniques/GeurtsGameDesignDocumentationTechnique.md`

> `GeurtsTechniqueManifest.md` selects this file and version from one validated package commit. This technique defines primary game-context routing, explicit GDD import, discovery and maintenance boundaries.

---

## Purpose

This document defines how AI coding agents, automated development systems, and human developers discover, classify, maintain, and use project-specific game design documentation.

The Technical Technique defines how to build systems. Project-specific game design documentation defines what those systems should feel like, support, or express to the player.

Interpret the rules deterministically. Literal paths, explicit metadata, stable ordering, authority fields, and machine-verifiable states take precedence over elegant wording when the two conflict.

---

## Documentation Boundary

The sole Geurts Game Forge documentation source and authority is `Geurtsy/GeurtsGameForge_Commandments`. Its detached project-local fetched copy belongs at:

```text
<ProjectRoot>/GeurtsGameForgeCommandments/
```

Project-specific game design documentation belongs at:

```text
<ProjectRoot>/Docs/GameDesign/
```

God owns the Windows Editor Commandments service and requires separately installed licensed Odin Inspector and Quantum Console assemblies. The optional Companion 0.15.0 compatibility adapter has no God or other Unity Package Manager package dependency, no vendor references, no updater and no menus. It forwards existing Editor callers to God 0.29.0 or newer. Authoritative content remains independent and readable without God. The content action grants no additional project access. Never use a generic template as the target game's design authority.

Never put Geurts source-package files in `Docs/GameDesign/` or project-specific GDD files in `GeurtsGameForgeCommandments/`.

After one confirmation, the companion's `Update Geurts Game Forge Commandments` action may replace the complete managed documentation folder and only the three project AI-route files declared by `GeurtsCommandmentsCompanionContract.json`. It must not enumerate, inspect, create, validate, hash, modify, or delete any path under `Docs/GameDesign/`. Copying the exact scoped game-design route template to `.github/instructions/geurts-game-design.instructions.md` grants no access to the paths that template may later route an AI tool toward. GDD import, scaffolding and bounded manifest maintenance remain separate explicit operations under this technique and the AI Agent Setup Technique.

---

## Project Game Design Directory

Use this target-project directory for project-specific game design documentation:

```text
<ProjectRoot>/Docs/GameDesign/
```

Use this manifest as the design index when it exists:

```text
<ProjectRoot>/Docs/GameDesign/GameDesignManifest.md
```

---

## Primary Game Context

The documentation routing chain is `GeurtsGameForgeCommandments/AI_READ_FIRST.md`, then `GeurtsTechniqueManifest.md`, then this technique, then `Docs/GameDesign/GameDesignManifest.md`. The project manifest may declare one primary document using this separately managed section outside the existing `GEURTS-GDD-MANIFEST-BEGIN` table:

```markdown
<!-- GEURTS-GDD-PRIMARY-BEGIN version="1.0.0" -->
## Primary Game Design Document

**Primary document:** `Docs/GameDesign/SelectedDocument.md`

This document is the primary source of context about the game.
Technical design and implementation guidance remains authoritative in `GeurtsGameForgeCommandments/`, entered through `AI_READ_FIRST.md` and its manifest.
<!-- GEURTS-GDD-PRIMARY-END -->
```

`SelectedDocument.md` is a format example, not a required filename or a design fact. Apart from that selected path and the existing manifest's newline convention, the block above is the exact v1.0.0 payload. The importer rejects a modified payload rather than discarding user text. The actual path must identify a visible regular Markdown (`.md`) file inside `Docs/GameDesign/`, use `/` separators, and be relative to the Unity project root. Reject absolute paths, traversal, hidden path segments, the manifest itself, and symbolic links, junctions or other reparse points.

The declared primary document is the primary source of context about the game. Read it when game context or player-facing design facts are needed, together with other relevant documents selected by the index. This explicit primary selection takes precedence over the managed table's `Authority` field for choosing primary game context only. A document does not need a table row to be the declared primary source. Do not infer mechanics, approval status or design facts from the import action or filename. Existing scoped design facts and material conflicts still follow the manifest's conflict-resolution rules.

Technical design and implementation guidance remains authoritative in the manifest-selected techniques from `GeurtsGameForgeCommandments/`. Technical passages in the imported GDD do not replace those techniques. Surface a material conflict between game requirements and technical guidance instead of silently changing either authority.

A missing primary section preserves existing manifest-driven discovery. A missing primary file, malformed or duplicated primary markers, unsupported primary-section version, ambiguous pointer, or primary section nested inside the managed table is a conflict; do not silently select another document. A purely technical task may still proceed without unrelated game context. Project-specific pointers and GDD content must never be written into the replaceable `GeurtsGameForgeCommandments/` snapshot.

## Explicit Build Forge Import

Build Forge provides an explicit **Import selected documents** action. Users may queue multiple Markdown files by adding files or dropping a batch, review the selection, and choose the initial primary. Later imports preserve the primary unless the user selects **Make primary** on an imported document. Selecting or queuing files alone must not copy files or change routing. The legacy single-primary import remains a supported explicit primary-selection operation. This is not the Commandments Companion's Update, ordinary startup discovery, native-entry installation, or general manifest maintenance.

The import must:

- Create only missing `Docs/` and `Docs/GameDesign/` directories needed for this explicit import, under the Folder Structure Technique's narrow exception. Preserve existing folders and do not run general project setup.
- Accept `.md` only and preserve the selected source bytes without adding metadata, converting content, or inventing game facts.
- Copy the selected file into `Docs/GameDesign/` without silently overwriting any existing file. God 0.17.0 may replace differing destinations only after the manual overwrite confirmation below. Selecting an existing safe document in that directory uses its current project-relative path. An existing destination with identical bytes is an idempotent reuse; different bytes at the same destination require explicit confirmation. Callers without that confirmation remain non-overwriting.
- Create a missing `GameDesignManifest.md` from the installed documentation's existing create-if-missing scaffold. Preserve existing manifest text, encoding, and bytes outside the primary and imported-document sections. Support UTF-8, UTF-8-BOM, UTF-16LE-BOM and UTF-16BE-BOM; reject invalid text and UTF-32 without mutation.
- Preflight every selected document and every destination before copying any file. Reject differing documents that map to the same destination, including case-only collisions on Windows. Repeated selections of identical content are idempotent. Require an explicit initial primary from the selected batch; do not silently replace a missing primary.
- Add the primary section when absent or replace only one valid supported primary section. Preserve every existing managed table row and all other project notes. Duplicate, malformed, unsupported or nested primary markers are conflicts and must not be repaired by discarding content.
- Keep the existing managed document table format at v0.7.0. Do not scan unrelated design documents or invoke `UpdateGameDesignManifest.ps1` or native-entry setup as an import side effect. The explicit primary and imported-document sections provide registration without changing the managed table.
- Validate source and target containment, regular-file status and reparse-point boundaries before mutation. Revalidate destination absence or exact expected bytes and the manifest's original raw bytes immediately before writing, rejecting concurrent changes. Preserve the original source and every unapproved project file. Report every newly copied or overwritten document retained after a later failure; do not claim rollback.
- Report the selected project-relative path and current primary selection on success, or the failure and any retained newly copied content. Display why an unavailable import action is unavailable and how to resolve it.

### Manual overwrite warning

When an explicit import batch would replace existing content, preflight the entire batch and manifest before showing one warning listing the exact changed project-relative destinations and the project root. Explain that existing contents and local edits will be lost, no backup or rollback is created, and Cancel leaves the entire batch unchanged. **Cancel** is initially focused; Escape, Enter, closing the warning and cancellation do not authorize replacement. **Overwrite documents** grants one-time consent only for the displayed files and selected source bytes. This consent is never saved, inferred from an earlier import, or supplied by God's automatic package/documentation updates.

Identical content is reused without a warning. Two different selected files targeting the same destination remain a conflict even when overwrite is supported; do not silently choose a winner. Read-only destinations, invalid content, malformed routing and unsafe/linked paths fail before confirmation.

After affirmative confirmation, revalidate every source, destination and the original raw manifest bytes before any batch write. Reject content, existence or path changes while the warning was open; consent does not cover concurrent edits. Each replacement also retains the existing atomic expected-byte and containment checks at its final write boundary. Cancellation creates no files or directories, changes no routing, and leaves selected files queued for review. A later failure may leave earlier copied or overwritten files; report their exact paths and outcomes without claiming the entire batch was rolled back.

### Imported-document routing section

God 0.16.0 registers batch imports using the following separate exact v1.0.0 section, outside both the primary section and the existing managed table:

```markdown
<!-- GEURTS-GDD-IMPORTS-BEGIN version="1.0.0" -->
## Imported Game Design Documents

These selected documents supplement the primary game context. Import does not assign design authority or classification.

- `Docs/GameDesign/SelectedDocument.md`
- `Docs/GameDesign/SupportingDocument.md`
<!-- GEURTS-GDD-IMPORTS-END -->
```

The paths are examples only. Each list contains unique safe project-relative Markdown paths, rendered in ordinal path order; the importer preserves all earlier entries and an existing legacy primary when adding a batch. No recursive scan is permitted. Absence of this section preserves primary-only compatibility. Duplicate, malformed, unsupported, nested or modified sections are conflicts; preserve user notes outside the markers and never repair ambiguity by discarding bytes.

Read this lightweight list alongside the primary and managed table when routing game-context work. Imported paths have unprovided classification and precedence until the project explicitly supplies them; import does not invent design facts or override managed-table metadata. The one primary remains explicit. Select only relevant supporting documents for the current task and surface unresolved design conflicts under the manifest rules.

Build Forge lists these registered documents, identifies the primary, and offers **Open document** and **Make primary** actions. Revalidate a document before opening or choosing it. Missing or invalid supporting documents remain visible with a repair explanation and disabled actions. A missing supporting document does not silently retarget the primary. Setup completion still requires a valid primary; malformed import routing must be reported as a conflict. Monitor only registered paths and their parent chains while the UI is open, without enumerating unrelated design files. Pending selections may survive a script reload; an import starts only after explicit selection of the import action.

The generic manifest maintainer owns only its existing managed table and preserves the primary and imported-document sections byte-for-byte outside that table. It must not retarget the primary pointer merely because it detects a rename, move or removal; choosing a different primary document requires an explicit import or authorized primary-selection edit. When the pointer becomes stale, report the missing primary source before work that needs game context.

---

## Lightweight Session-Start Discovery

At Unity-project opening or AI-session initialization:

1. Check for `<ProjectRoot>/Docs/GameDesign/GameDesignManifest.md`.
2. Read it once when it exists.
3. Record its declared version plus either a content hash or last-modified timestamp as the session fingerprint.
4. Re-read it when that fingerprint changes.
5. Use its primary section and index metadata to route later work without loading every full design document.

A missing manifest does not block a purely technical task. A technical task may proceed without unrelated full GDD files.

Before changing player-facing behaviour, load every relevant document identified by the project's current `GameDesignManifest.md`. If a relevant document is missing, unavailable, unclassified, or silent on a decision that would establish or change player-facing design intent, stop and ask for that decision before implementation. Do not invent or assume mechanics, narrative, balance values, progression, characters, or other design facts. A stated assumption is allowed only for a reversible technical detail that does not create, alter, or overwrite design intent.

---

## When AI Agents Must Consult Game Design Docs

AI agents must check the project-specific game design documentation when a task affects:

- Core mechanics.
- Player abilities.
- Enemy behaviour.
- AI behaviour that affects gameplay feel.
- Combat tuning.
- Progression, economy, rewards, or unlocks.
- Quests, objectives, or narrative content.
- Level design or encounter pacing.
- UI and UX flow.
- Accessibility or player-facing options.
- Player-visible debugging, cheats, or tuning tools.

---

## Safe Scaffolding

Only after separate explicit authorization, the setup workflow may create these missing paths from controlled templates:

```text
<ProjectRoot>/Docs/GameDesign/
<ProjectRoot>/Docs/GameDesign/README.md
<ProjectRoot>/Docs/GameDesign/GameDesignManifest.md
```

Rules:

- Create missing directories and files only.
- Never overwrite project-specific README or manifest content.
- Mark unknown design decisions as `Unprovided`.
- Do not pre-populate fictional mechanics, narrative, balance, progression, characters, or other game facts.
- Make every rerun idempotent.
- Report which paths were created and which already existed.

Installing God or the adapter through Unity Package Manager and using the Commandments Update create no GDD paths and never invoke a script. Native-entry migration alone also creates no GDD paths. A separately authorized optional manual operation may use the copied manager with explicit project root and opt-in:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "<ProjectRoot>/GeurtsGameForgeCommandments/Tools/ManageGeurtsAgentInstructions.ps1" -ProjectRoot "<ProjectRoot>" -IncludeGameDesignScaffolding
```

The manual scaffolding opt-in does not update the manifest. Deterministic manifest maintenance requires another separate explicit manual operation, either the copied manager with `-UpdateGameDesignManifest` or the copied maintainer invocation below. The safe invocation contract is defined in `GeurtsTechniques/GeurtsAIAgentSetupTechnique.md`. None of these manual operations are part of the companion lifecycle.

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "<ProjectRoot>/GeurtsGameForgeCommandments/Tools/ManageGeurtsAgentInstructions.ps1" -ProjectRoot "<ProjectRoot>" -UpdateGameDesignManifest
```

---

## Recommended Design Document Set

These files are optional starting points. Create only what the project actually needs.

```text
<ProjectRoot>/Docs/GameDesign/
├── GameDesignManifest.md
├── GameDesignOverview.md
├── GameplayPillars.md
├── CoreMechanics.md
├── PlayerAbilities.md
├── EnemyAndAIDesign.md
├── ProgressionAndBalance.md
├── LevelDesign.md
├── UIUXDesign.md
├── NarrativeAndWorld.md
└── AccessibilityDesign.md
```

---

## Manifest Rules

`<ProjectRoot>/Docs/GameDesign/GameDesignManifest.md` is the project-specific routing index. It must not list project-local fetched Geurts package files as project design authority.

Each document record must support:

| Field | Requirement |
|---|---|
| Identifier | Stable unique identifier used for duplicate and rename detection. |
| Document path | Project-root-relative path inside `Docs/GameDesign/`. |
| Purpose or design domain | Explicit routing description; use `RequiresClassification` when unknown. |
| Status | For example `Active`, `Draft`, `Deprecated`, `Invalid`, or `RequiresClassification`. |
| Version | Declared document version when available; otherwise `Unprovided`. |
| Authority or precedence | Explicit relationship when the document overrides or is overridden by another design source. |
| Tags or task categories | Optional stable routing labels. |

Do not infer purpose or authority from a filename when that inference is unreliable.

### Deterministic Maintenance

After explicit authorization, use the copied tool with the Unity root supplied explicitly:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "<ProjectRoot>/GeurtsGameForgeCommandments/Tools/UpdateGameDesignManifest.ps1" -ProjectRoot "<ProjectRoot>"
```

The maintainer must detect and report:

- added documents discovered by scanning;
- imported documents only when the importer passes their project-relative paths through `-ImportedPath`;
- removed documents;
- renamed documents when only the filename changes within the same directory;
- moved documents when their directory changes within `Docs/GameDesign/`;
- unchanged documents;
- duplicate identifiers or paths;
- unsupported files and conflicts.

The deterministic scan includes regular Markdown files recursively, including `README.md`, and excludes the manifest itself, hidden files or hidden directories, temporary files, backups, and tool lock files. Other extensions are reported as unsupported rather than indexed. Without an explicit `-ImportedPath` signal, a newly discovered Markdown file is `Added`, never guessed to be imported.

Persistent identifiers are the primary rename key. A file-watcher rename event or unique content fingerprint may be used when an identifier is unavailable. If a rename cannot be determined reliably, report an addition and a removal requiring review rather than guessing.

Maintenance must be:

- deterministic and idempotent;
- stably ordered by normalized project-relative path and then identifier;
- free of timestamps or formatting changes that create unnecessary source-control churn;
- limited to an explicit managed manifest section while preserving the exact bytes outside it;
- able to preserve the manifest's original UTF-8, UTF-8-BOM, UTF-16LE-BOM, or UTF-16BE-BOM encoding and reject invalid text or UTF-32 without mutation;
- able to preserve manually authored purpose, status, version, authority, and tags where practical;
- protected from recursive self-triggering by excluding the manifest itself and ignoring its own unchanged output hash;
- fail-safe when identifiers conflict or parsing is ambiguous.

`-ManifestPath`, when supplied, must resolve exactly to `<ProjectRoot>/Docs/GameDesign/GameDesignManifest.md`. The maintainer must reject reparse points anywhere in the project, design, or discovered directory path; keep its single-writer lock and temporary replacement artifacts at a validated project-root-owned location rather than beneath the swappable game-design parent; acquire the lock with create-new, handle-owned delete-on-close semantics before reading the manifest; treat any pre-existing lock path as a conflict and preserve its exact bytes; remove only the lock represented by its acquired handle; parse every non-empty managed-region line strictly; validate explicit metadata before rendering; and treat unsupported future managed-region versions as conflicts without downgrade. It must retain the raw-byte fingerprint captured at read time and, immediately before atomic promotion, revalidate containment and the full path chain, then reject any existence or byte drift instead of overwriting concurrent content.

The managed table is bounded by matching `GEURTS-GDD-MANIFEST-BEGIN` and `GEURTS-GDD-MANIFEST-END` markers. Manually authored notes belong outside that region.

New documents without reliable metadata receive `RequiresClassification`. Unsupported files are reported and must not be silently treated as design authority. Duplicate identifiers are conflicts: do not choose a winner or overwrite the manifest silently.

A compatible host may detect imports or debounced file-watcher events, invalidate cached discovery data, report manifest drift, and offer a user-approved handoff to the external maintainer. Those passive events must not invoke the maintainer automatically or write project GDD content. The separately user-selected Build Forge import above has its own limited copy, primary-pointer and imported-list authority. The God-owned Commandments service is not such a host: its explicit metadata check and confirmed Update must not inspect `Docs/GameDesign/` at all.

### Design Document Conflicts

Cross-document conflict resolution is centralized in `GeurtsTechniqueManifest.md`. Record explicit design-source precedence in `GameDesignManifest.md`; otherwise surface a material conflict and ask when its resolution would establish design intent. Do not choose a stray document merely because it has a higher version or newer date.

---

## Manifest Relationship

The manifest selects this technique alongside any other applicable subject owner. Project-specific game-design documents define player-facing facts within their recorded scope; if those facts materially conflict with a selected technical requirement, state the conflict rather than silently choosing one.
