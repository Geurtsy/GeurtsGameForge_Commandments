<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Game Forge AI Entry Point

**Version:** 0.65.0
**Documentation source:** [Geurtsy/GeurtsGameForge_Commandments](https://github.com/Geurtsy/GeurtsGameForge_Commandments)
**Purpose:** First documentation entry and session boundary, before manifest resolution.
**Required package path:** `AI_READ_FIRST.md`

## Entry Sequence

Read this file first and immediately continue to:

```text
GeurtsTechniqueManifest.md
```

The manifest alone selects and orders applicable techniques, owns package version resolution and subject ownership, and resolves cross-document conflicts. This file does not provide an alternate reading order or task-routing table.

The manifest also owns `AI-READ`, `HUMAN-ONLY` and `FORGE-DEVELOPMENT-ONLY` audience tags and the read-only section reader. Read this entry and the manifest in full; apply their audience rules before loading the other selected documents.

For game-platform scope and its exceptions, apply the manifest's [primary game target](GeurtsTechniqueManifest.md#13-primary-game-target).

## Documentation Identity and Freshness

After reading this entry and its same-copy manifest, identify the documentation source kind: authoritative source checkout, installed local snapshot, or unknown provenance. Use the manifest's package version, never a game or brick version. Record the exact documentation revision only when existing local Git or trustworthy acquisition evidence supplies it; otherwise report Unknown. Distinguish Released, Pending and Unknown publication state using evidence for that exact revision; a version number or local tag alone does not prove release. Existing last-successful-install metadata is comparison-only and does not prove local integrity. Do not create a receipt or project file for this check.

A local snapshot alone cannot prove it is latest. Report Known outdated only when already available trustworthy authoritative evidence establishes that this documentation copy is older; a different hash alone may mean divergence. Otherwise report Freshness unknown, including when no remote comparison has been authorized. Identify the source/version before relying on an older copy, honor explicitly selected historical guidance and do not mix revisions or silently replace the selected source. This local identity check performs no automatic network check, download or update. The Companion owner's [documentation identity and pre-download size](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#documentation-identity-and-pre-download-size) governs acquisition displays and their evidence limits.

## Mandatory Reading and Version Bumps

Documentation is exclusively for AI agents; prioritize efficient, deterministic reading and instructions. The manifest selects the Documentation Maintenance Technique for every approved Game Forge change, including BigBang. Game Forge integration is primary; StandardsOnly remains an explicit secondary route. This does not reorder runtime technical priorities.

Before planning or editing any part of Geurts Game Forge, read this documentation through the entry and manifest chain above. This includes package code, Editor UI, runtime code, tests, tools, catalogue data, configuration and documentation. Memory of an earlier session is not a substitute for reading the applicable current guidance.

**It is vital to bump the owning package or documentation version whenever an update occurs, no matter how small. Never publish changed content under the same version.** Text corrections, visual adjustments, catalogue changes, tests and small fixes all count. Apply the bump within the same change before delivery; intermediate edits belonging to that one unreleased update can share its new version.

Use `MAJOR.MINOR.PATCH` (for example, `1.4.2`):

| Part | Increment for | Example |
|---|---|---|
| Major | Incompatible changes that break the existing public contract. | Replace the package architecture with an incompatible API. |
| Minor | New functionality that keeps the existing public contract compatible. | Add a save system or scene loading. |
| Patch | Bug fixes, documentation corrections and small compatible improvements. | Fix a version display or clarify instructions. |

Reset the lower components when increasing a higher component. For pre-1.0 packages, continue to increment versions and clearly document breaking changes.

For completed updates to games using GeurtsGameForge_Commandments, follow the Automation owner's [shared integration queue](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#shared-integration-queue) for submission, processor-owned versioning, validation, publication and recovery. Workers submit once, report the pending queue ID and end their turn. Each completed game update still receives its higher version before delivery. Forge package sources and this documentation repository retain their existing contribution and publication processes.

Bump each affected independently released package and the documentation package when its content changes. Keep package.json, runtime-reported versions, documentation manifest/contract/catalogue metadata and changelogs consistent. Individually versioned techniques advance when their own rules change; unchanged schema versions and historical records do not need artificial changes. A catalogue pin must resolve to the exact published package identity and version. Validate that the new version exceeds the previous published version before merging or publishing. Do not describe an equal-number changed release as a normal successful version update.

## Standards Without GameForge

The Commandments may be adopted as development standards without installing or using Geurts Game Forge packages. An explicit instruction to use documentation without GameForge selects the manifest's **StandardsOnly** usage profile and its [Standards-Only Technique](GeurtsTechniques/GeurtsStandardsOnlyTechnique.md). The manifest selects the profile before generic subjects. Source-only use requires no God, Angels, BigBang or companion; framework-specific requirements are conditional. Steam, Odin Inspector and Quantum Console are optional in StandardsOnly, including Unity implementation. General standards remain binding. This entry grants no installation, update or project-write authority.

## Local Package Boundary

`Geurtsy/GeurtsGameForge_Commandments` is the sole source and authority for all generic Geurts Game Forge documentation. God's Editor Commandments service may fetch an archive-based, project-local snapshot into:

```text
<ProjectRoot>/GeurtsGameForgeCommandments/
```

God owns the Commandments Editor service; the [Commandments Companion Technique](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md) owns its lifecycle and passive-adapter transition. The [Brick Contract](GeurtsTechniques/GeurtsBrickContract.md#identity-and-dependencies) owns package and licensed-library dependencies. Authoritative Markdown content remains readable without God. No implementation belongs in this documentation repository; package Documentation~/ contains only implementation-specific guidance. Project-specific design documents remain separate under:

```text
<ProjectRoot>/Docs/GameDesign/
```

Package membership and any integration lifecycle are outside this router's subject. The manifest selects the applicable owner. Do not substitute files from outside the active package's single validated commit. A confirmed companion Update may replace the complete project-local documentation folder above and the contract's exact closed set of three project AI-routing files. Every non-listed path remains outside that authority; in particular, the companion must not inspect or change `Docs/GameDesign/`.

## Session Boundary

Before implementation, use one current source checkout or project-local fetched copy and record its commit when available. Ordinary AI/session initialization reads the existing local copy and performs no additional remote check or update. A direct source-repository AI session or another host does not require the companion.

For the God-owned service's Unity startup behavior, views or metadata checks, apply the Companion owner's [offline startup and explicit checks](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#4-offline-startup-and-explicit-metadata-checks). For installed package/content updates, apply the Brick owner's [explicit updates only](GeurtsTechniques/GeurtsBrickContract.md#explicit-updates-only) and the Companion owner's [manual Update confirmation](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#5-explicit-in-editor-update) and [current action and legacy-caller rules](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#current-action-confirmation-and-legacy-automatic-callers) before any action. Every update requires a current explicit user Update action and its owning confirmation. This entry grants no update consent or project-write authority. Do not inspect or select project GDD files here; the manifest first decides whether the GDD Technique applies.

## Pre-Code Lock

Do not create, modify, move, rename, or delete target-project files until:

1. the package entry files are available;
2. this file and `GeurtsTechniqueManifest.md` have been read from the same active package; and
3. every technique selected by the manifest for the task has been read.

After those conditions are satisfied, follow the manifest-selected subject authorities.
