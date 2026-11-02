<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Game Forge AI Entry Point

**Version:** 0.67.1
**Documentation source:** [Geurtsy/GeurtsGameForge_Commandments](https://github.com/Geurtsy/GeurtsGameForge_Commandments)
**Purpose:** First documentation entry and session boundary.
**Required package path:** `AI_READ_FIRST.md`

## Entry Sequence

Read this file first and immediately continue to its same-copy `GeurtsTechniqueManifest.md` fully. The manifest alone resolves files, versions, profiles, applicability, subject ownership, audience/section selection, reading order and conflicts. Follow its [primary game target](GeurtsTechniqueManifest.md#13-primary-game-target) and selected owners before work.

## Documentation Identity and Freshness

After reading this entry and its same-copy manifest, identify the documentation source kind: authoritative source checkout, installed local snapshot, or unknown provenance. Use the manifest's package version, never a game or brick version. Record the exact documentation revision only when existing local Git or trustworthy acquisition evidence supplies it; otherwise report Unknown. Distinguish Released, Pending and Unknown publication state using evidence for that exact revision; a version number or local tag alone does not prove release. Existing last-successful-install metadata is comparison-only and does not prove local integrity. Do not create a receipt or project file for this check.

A local snapshot alone cannot prove it is latest. Report Known outdated only when already available trustworthy authoritative evidence establishes that this documentation copy is older; a different hash alone may mean divergence. Otherwise report Freshness unknown, including when no remote comparison has been authorized. Identify the source/version before relying on an older copy, honor explicitly selected historical guidance and do not mix revisions or silently replace the selected source. This local identity check performs no automatic network check, download or update. The Companion owner's [documentation identity and pre-download size](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#documentation-identity-and-pre-download-size) governs acquisition displays and their evidence limits.

## Mandatory Reading and Version Bumps

Before planning or editing any part of Geurts Game Forge, read this chain and every selected owner, including for code, Editor/runtime, tests, tools, catalogue, configuration and documentation. Memory is no substitute. Documentation Maintenance applies to every approved change, including BigBang. AI-only documentation prioritizes efficiency and Forge integration; Technical retains runtime priorities.

**Bump every affected independent package and changed documentation package, no matter how small. Never publish changed content under the same version.** Bump before delivery; one unreleased change's intermediate edits share its version. `MAJOR.MINOR.PATCH`: incompatible public contracts / compatible functionality / compatible fixes or corrections; reset lower parts. Pre-1.0 advances and documents breaking changes.

Synchronize package.json, runtime, manifest/contract/catalogue metadata and changelogs. Advance techniques for changed rules, retaining unchanged schemas/history. Catalogue pins require exact published identity/version. Validate that the new version exceeds the previous published version; changed equal-version content is not a successful update.

Game updates use Automation's [shared integration queue](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#shared-integration-queue): submit once, report pending ID and end the worker turn; processor owns final higher version, validation, publication and recovery. Forge/documentation sources retain their contribution process.

## Standards Without GameForge

Explicit use without GameForge selects the manifest's StandardsOnly profile and [Standards-Only owner](GeurtsTechniques/GeurtsStandardsOnlyTechnique.md) before generic subjects. No God, Angels, BigBang or companion is required for source-only use. Framework requirements are conditional; Steam, Odin Inspector and Quantum Console are optional, including Unity implementation. General standards remain binding. No installation, update or project-write authority is granted.

## Local Package Boundary

`Geurtsy/GeurtsGameForge_Commandments` alone owns generic documentation. God owns the Editor service; [Companion](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md) owns lifecycle/adapter transition, [Brick](GeurtsTechniques/GeurtsBrickContract.md#identity-and-dependencies) dependencies. Markdown requires no God. Brick implementation stays outside this repository; package Documentation~/ is implementation-specific.

Installed content: `<ProjectRoot>/GeurtsGameForgeCommandments/`. Project design: `<ProjectRoot>/Docs/GameDesign/`. Select files/registry from the active package's single validated commit. Confirmed content Update replaces only that complete content folder and exactly three contract AI routes; no unlisted path, especially Docs/GameDesign, may be inspected/changed by the service.

## Session Boundary

Before implementation select one current checkout/local copy; record its commit when available. AI/session initialization stays local/offline; direct source/other hosts require no companion. Apply [offline startup/views/checks](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#4-offline-startup-and-explicit-metadata-checks). Before installed updates apply [explicit-only updates](GeurtsTechniques/GeurtsBrickContract.md#explicit-updates-only), [manual confirmation](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#5-explicit-in-editor-update) and [legacy-caller limits](GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#current-action-confirmation-and-legacy-automatic-callers): Every update requires a current explicit user Update action and its owning confirmation. This entry grants no consent/project writes. Do not inspect or select project GDD files here; the manifest first decides whether the GDD Technique applies.

## Pre-Code Lock

Do not create, modify, move, rename or delete target-project files until entry files are available, this entry and the manifest have been fully read from the same package, and every task-selected technique has been read. Then follow the selected subject authorities.
