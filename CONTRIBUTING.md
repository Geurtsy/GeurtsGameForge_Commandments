<!-- GEURTS-AUDIENCE: FORGE-DEVELOPMENT-ONLY -->
# Contributing to Commandments

**Version:** 0.62.9

This repository owns generic development standards, contracts and their source-only maintenance tools. God, bricks and the compatibility adapter own their implementations. Project-specific design stays in the game's `Docs/GameDesign/`.

## Read and change

Start at [AI_READ_FIRST.md](AI_READ_FIRST.md), then the [manifest](GeurtsTechniqueManifest.md). Use `ForgeDevelopment` reading mode and select only the subjects needed for the change. Read one source commit; do not substitute remembered guidance or a managed project snapshot. Keep current requirements in their selected owner and link to them from other guides.

Use concise, literal instructions with explicit applicability, inputs, outputs and failure behavior. Prefer one authoritative rule over repeated prose. Keep historical evidence under `History/` and outside routine AI reading. Inspect existing code before extending it; avoid extra dependencies, network requests and repeated expensive checks.

Use the Automation owner's [Git-only source-control policy](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#git-source-control). Work on Windows in a short source checkout. Follow the [technical priorities, path preflight and CRLF policy](GeurtsTechniques/GeurtsTechnicalTechnique.md). Preserve unrelated work and all frozen payload bytes. Stage every intended new file so the validator can compare the complete Git inventory with the manifest registry.

Every delivered change needs an appropriate higher documentation version. Update the entry, manifest registry, current metadata, changed tool versions and changelog together. Bump a technique when its own guidance changes; keep unchanged schemas, installer artifacts, historical records and brick pins intact. The entry point owns the detailed version rules.

## Validate

Run from the source checkout:

```powershell
& ./Tools/ValidateGeurtsDocumentation.ps1 -RunAutomationTests
```

This runs offline source checks and isolated regressions. Windows CI also runs static validation with Windows PowerShell 5.1. Follow the Automation owner's [proportionate testing](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#proportionate-testing) and [efficient AI tool use](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#efficient-ai-tool-use). Apply that owner's unit-test necessity rule before adding or running unit tests. Use focused checks while iterating; the required successful PR CI supplies the complete suite for the final candidate without a duplicate local full-suite run. Preserve each required host/publication gate and rerun affected checks when source, inputs or environment change. These checks establish documentation/tool behavior, not Unity player or native-service acceptance.

Before catalogue publication, follow the [Brick Contract's source gate](GeurtsTechniques/GeurtsBrickContract.md#publish-before-installing-or-updating). Supply all released owners' Git checkouts with their exact objects already fetched. Identity, version, dependencies, capabilities and declared operations must agree. Missing private-source access is a publication blocker; ordinary CI does not claim to verify those repositories.

## Merge and publish

Completed updates to this repository must reach remote `main`. The same standing delivery authorization applies independently to every Geurts Game Forge package source repository; follow the [Automation Technique](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#codex-delivery-to-main) for the complete scope and blocker rules.

Commit the complete candidate, fetch the official history and release tags, then run:

```powershell
& ./Tools/ValidateGeurtsPublication.ps1
```

The offline publication gate compares committed content with the newest stable `vMAJOR.MINOR.PATCH` tag. Changed content must have a higher version. An unchanged release may be revalidated. Dirty or shallow checkouts, missing tags, mismatched tag metadata and downgrades fail visibly. Fetching and publication are separate operations; this gate performs neither.

Open a scoped pull request. Require the **Validate Commandments** check on the current candidate before merging to `main`; resolve required conversations and preserve branch protections. The [Automation Technique](GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#codex-delivery-to-main) owns delivery authorization and exceptions. Do not bypass failed checks or publish an intermediate commit. Verify the merged remote commit, create a new matching immutable version tag/release, and retain exact validation evidence. Never move or replace a released tag.

`main` is the God service's content feed, so every merged commit must be complete and validated. A Git release and specification maturity are separate: **Draft normative** does not mean that no Git release exists. Historical migration status describes its recorded release context. Consumer installation and confirmed content Update remain separate user operations.

## Reuse and contribution terms

No repository-wide licence has been declared. This maintenance change preserves the existing terms and adds no licence grant. Retain all existing copyright, licence and third-party notices; obtain the owner's agreement for reuse or contribution terms that are not already stated. Propose any licensing change separately rather than infer permission from public visibility.
