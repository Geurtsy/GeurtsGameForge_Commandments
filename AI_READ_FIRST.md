<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Game Forge AI Entry Point

**Version:** 0.65.1
**Documentation source:** [Geurtsy/GeurtsGameForge_Commandments](https://github.com/Geurtsy/GeurtsGameForge_Commandments)
**Purpose:** First documentation entry and session boundary, before manifest resolution.
**Required package path:** `AI_READ_FIRST.md`

## Entry Sequence

Read this file first and immediately continue to:

```text
GeurtsTechniqueManifest.md
```

The manifest alone selects and orders techniques, resolves package versions, subject ownership and cross-document conflicts, and owns the `AI-READ`, `HUMAN-ONLY` and `FORGE-DEVELOPMENT-ONLY` tags and read-only section reader. Read this entry and the manifest in full; apply their audience rules before loading other selected documents.

For game-platform scope and exceptions, apply the manifest's [primary game target](GeurtsTechniqueManifest.md#13-primary-game-target).

## Documentation Identity and Freshness

After reading this entry and its same-copy manifest, identify the source: authoritative source checkout, installed local snapshot, or unknown provenance. Use the manifest's package version, never a game or brick version. Record the exact revision only from existing local Git or trustworthy acquisition evidence; otherwise report Unknown. Report Released, Pending or Unknown using evidence for that revision, not a version number or local tag alone. Last-successful-install metadata is comparison-only, not proof of local integrity. Create no receipt or project file for this check.

A local snapshot alone cannot prove freshness. Report Known outdated only when already available trustworthy authoritative evidence proves this copy older; a different hash alone may mean divergence. Otherwise report Freshness unknown, including without authorized remote comparison. Identify the source/version before relying on an older copy; honor explicitly selected historical guidance. Never mix revisions or silently replace the source. This check performs no automatic network check, download or update. The Companion owner's [documentation identity and pre-download size](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#documentation-identity-and-pre-download-size) governs acquisition displays and evidence limits.

## Mandatory Reading and Version Bumps

Documentation is exclusively for AI agents; prioritize efficient, deterministic instructions. The manifest selects the Documentation Maintenance Technique for every approved Game Forge change, including BigBang. Game Forge integration is primary; StandardsOnly is an explicit secondary route. Runtime technical priorities are unchanged.

Before planning or editing any part of Geurts Game Forge, read the current entry/manifest chain and all selected guidance. This includes package/runtime code, Editor UI, tests, tools, catalogue data, configuration and documentation; session memory is not a substitute.

**Bump the owning package or documentation version for every update, no matter how small. Never publish changed content under the same version.** Text corrections, visual adjustments, catalogue changes, tests and small fixes all count. Bump within the same change before delivery; intermediate edits in one unreleased update may share its new version.

Use `MAJOR.MINOR.PATCH`:

| Part | Increment for |
|---|---|
| Major | Incompatible public-contract changes. |
| Minor | Compatible new functionality. |
| Patch | Bug fixes, documentation corrections and small compatible improvements. |

Reset lower components when increasing a higher component. Pre-1.0 packages still increment versions and explicitly document breaking changes.

Completed game updates using GeurtsGameForge_Commandments follow the Automation owner's [shared integration queue](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#shared-integration-queue) for submission, processor-owned versioning, validation, publication and recovery. Workers submit once, report the pending queue ID and end their turn. Each game update receives its higher version before delivery. Forge package sources and this repository retain their contribution and publication processes.

Bump each affected independently released package and changed documentation package. Keep package.json, runtime-reported versions, documentation manifest/contract/catalogue metadata and changelogs consistent. Advance individual technique versions when their rules change; do not artificially bump unchanged schemas or historical records. Catalogue pins must resolve to the exact published package identity and version. Validate that the new version exceeds the previous published version before merging or publishing. An equal-number changed release is not a successful version update.

## Standards Without GameForge

Explicit use of the Commandments without GameForge selects the manifest's **StandardsOnly** profile and [Standards-Only Technique](GeurtsTechniques/GeurtsStandardsOnlyTechnique.md) before generic subjects. Source-only use requires no God, Angels, BigBang or companion; framework requirements are conditional. Steam, Odin Inspector and Quantum Console are optional in StandardsOnly, including Unity implementation. General standards remain binding. This entry grants no installation, update or project-write authority.

## Local Package Boundary

`Geurtsy/GeurtsGameForge_Commandments` is the sole source and authority for generic Geurts Game Forge documentation. God's Editor Commandments service may fetch an archive-based local snapshot into:

```text
<ProjectRoot>/GeurtsGameForgeCommandments/
```

God owns the service; the [Commandments Companion Technique](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md) owns its lifecycle and passive-adapter transition. The [Brick Contract](GeurtsTechniques/GeurtsBrickContract.md#identity-and-dependencies) owns package and licensed-library dependencies. Authoritative Markdown remains readable without God. No implementation belongs in this repository; package Documentation~/ contains only implementation-specific guidance. Project-specific design stays separate under:

```text
<ProjectRoot>/Docs/GameDesign/
```

The manifest selects package membership and lifecycle owners. Never substitute files from outside the active package's single validated commit. A confirmed companion Update may replace only the complete local documentation folder above and the contract's exact three project AI-routing files. Every non-listed path is outside that authority; the companion must not inspect or change `Docs/GameDesign/`.

## Session Boundary

Before implementation, use one current source checkout or local fetched copy and record its commit when available. Ordinary AI/session initialization reads that copy without an additional remote check or update. Direct source-repository sessions and other hosts do not require the companion.

For God-owned Unity startup, views or metadata checks, apply the Companion owner's [offline startup and explicit checks](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#4-offline-startup-and-explicit-metadata-checks). Before installed package/content updates, apply the Brick owner's [explicit updates only](GeurtsTechniques/GeurtsBrickContract.md#explicit-updates-only) and the Companion owner's [manual Update confirmation](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#5-explicit-in-editor-update) and [current action and legacy-caller rules](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#current-action-confirmation-and-legacy-automatic-callers). Every update requires a current explicit user Update action and its owning confirmation. This entry grants no update consent or project-write authority. Do not inspect or select project GDD files here; the manifest first decides whether the GDD Technique applies.

## Pre-Code Lock

Do not create, modify, move, rename, or delete target-project files until:

1. the package entry files are available;
2. this file and `GeurtsTechniqueManifest.md` have been read from the same active package; and
3. every technique selected by the manifest for the task has been read.

After those conditions are satisfied, follow the manifest-selected subject authorities.
