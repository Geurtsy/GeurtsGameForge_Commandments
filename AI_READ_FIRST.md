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

The manifest alone selects and orders techniques, resolves package versions, subject ownership and conflicts, and owns audience tags and the read-only section reader. This entry adds no alternate reading order or task-routing table. Read both files in full; apply the manifest's audience rules before loading other selected documents.

For game-platform scope and exceptions, apply the manifest's [primary game target](GeurtsTechniqueManifest.md#13-primary-game-target).

## Documentation Identity and Freshness

After reading this entry and its same-copy manifest, identify the source as authoritative source checkout, installed local snapshot, or unknown provenance. Use the manifest's package version, never a game or brick version. Record the exact revision only from existing local Git or trustworthy acquisition evidence; otherwise report Unknown. Determine Released, Pending or Unknown publication state from evidence for that exact revision, not a version number or local tag. Last-successful-install metadata is comparison-only, not local-integrity proof. Create no receipt or project file for this check.

A local snapshot cannot prove it is latest. Report Known outdated only when already available trustworthy authoritative evidence proves this copy is older; a different hash may indicate divergence. Otherwise report Freshness unknown, including when remote comparison is unauthorized. Identify the source/version before using an older copy, honor explicitly selected historical guidance, and never mix revisions or silently replace the selected source. This check performs no automatic network check, download or update. The Companion owner's [documentation identity and pre-download size](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#documentation-identity-and-pre-download-size) governs acquisition displays and evidence limits.

## Mandatory Reading and Version Bumps

Documentation is exclusively for AI agents; prioritize efficient, deterministic instructions. The manifest selects the Documentation Maintenance Technique for every approved Game Forge change, including BigBang. Game Forge integration is primary; StandardsOnly is an explicit secondary route. Runtime technical priorities are unchanged.

Before planning or editing any part of Geurts Game Forge, read the entry, manifest and selected current guidance. This includes package code, Editor UI, runtime code, tests, tools, catalogue data, configuration and documentation. Earlier-session memory is not a substitute.

**It is vital to bump the owning package or documentation version whenever an update occurs, no matter how small. Never publish changed content under the same version.** Text, visuals, catalogues, tests and small fixes all count. Bump within the same change before delivery; intermediate edits in one unreleased update may share its new version.

Use `MAJOR.MINOR.PATCH` (for example, `1.4.2`):

| Part | Increment for |
|---|---|
| Major | Incompatible changes to the public contract. |
| Minor | Compatible new functionality. |
| Patch | Bug fixes, documentation corrections and small compatible improvements. |

Reset lower components when increasing a higher component. Pre-1.0 packages still advance versions and clearly document breaking changes.

For completed game updates using GeurtsGameForge_Commandments, follow the Automation owner's [shared integration queue](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#shared-integration-queue): submit once, report the pending queue ID and end the worker turn. The processor owns versioning, validation, publication and recovery; each completed update receives its higher version before delivery. Forge package sources and this documentation retain their existing contribution/publication processes.

Bump every affected independently released package and the documentation package when its content changes. Synchronize package.json, runtime-reported versions, documentation manifest/contract/catalogue metadata and changelogs. Advance individually versioned techniques only when their rules change; preserve unchanged schemas and historical records. Catalogue pins must match exact published package identities and versions. Validate that the new version exceeds the previous published version before merging or publishing. Equal-number changed releases are not successful version updates.

## Standards Without GameForge

An explicit instruction to use these standards without GameForge selects the manifest's **StandardsOnly** profile and [Standards-Only Technique](GeurtsTechniques/GeurtsStandardsOnlyTechnique.md) before generic subjects. Source-only use requires no God, Angels, BigBang or companion; framework requirements are conditional. Steam, Odin Inspector and Quantum Console are optional, including Unity implementation. General standards remain binding. This entry authorizes no installation, update or project write.

## Local Package Boundary

`Geurtsy/GeurtsGameForge_Commandments` is the sole authority for generic Geurts Game Forge documentation. God's Editor Commandments service may fetch an archive-based snapshot into:

```text
<ProjectRoot>/GeurtsGameForgeCommandments/
```

God owns the service; the [Commandments Companion Technique](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md) owns its lifecycle and passive-adapter transition. The [Brick Contract](GeurtsTechniques/GeurtsBrickContract.md#identity-and-dependencies) owns package and licensed-library dependencies. Authoritative Markdown remains readable without God. This repository contains no implementation; package Documentation~/ contains only implementation-specific guidance. Project-specific design stays separate:

```text
<ProjectRoot>/Docs/GameDesign/
```

The manifest selects the package-membership and integration-lifecycle owners; this entry does not. Use only files from the active package's single validated commit. A confirmed companion Update may replace the complete documentation folder above and the contract's exact closed set of three project AI-routing files. All other paths remain outside that authority; the companion must not inspect or change `Docs/GameDesign/`.

## Session Boundary

Before implementation, use one current source checkout or fetched project-local copy and record its commit when available. Ordinary AI/session initialization reads the existing local copy without additional remote checks or updates. Direct source-repository and other-host sessions require no companion.

For Unity startup, views and metadata checks, apply the Companion owner's [offline startup and explicit checks](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#4-offline-startup-and-explicit-metadata-checks). For installed updates, apply the Brick owner's [explicit updates only](GeurtsTechniques/GeurtsBrickContract.md#explicit-updates-only), the Companion owner's [manual Update confirmation](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#5-explicit-in-editor-update) and [current action and legacy-caller rules](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#current-action-confirmation-and-legacy-automatic-callers) before acting. Every update requires a current explicit user Update action and its owning confirmation; this entry grants no consent or project-write authority. Do not inspect or select project GDD files here; the manifest first decides whether the GDD Technique applies.

## Pre-Code Lock

Do not create, modify, move, rename, or delete target-project files until:

1. the package entry files are available;
2. this file and `GeurtsTechniqueManifest.md` have been read from the same active package; and
3. every technique selected by the manifest for the task has been read.

After those conditions are satisfied, follow the manifest-selected subject authorities.
