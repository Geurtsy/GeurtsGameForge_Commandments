<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts AGENTS.md Technique

**Version:** 1.3.0
**Required package path:** `GeurtsTechniques/GeurtsAgentTechnique.md`

## Purpose and ownership

This technique owns the Codex guide templates for legacy selected-folder installation and portable root onboarding. The manifest selects it when installing, validating or explaining a Codex guide. The documentation entry point is `AI_READ_FIRST.md`, which routes to `GeurtsTechniqueManifest.md`; there is no intermediate documentation `AGENTS.md`.

## Legacy selected-folder guide

Angels exposes **Install Codex guide**. God navigates to the installed owner. The compatibility setup API delegates to Angels. The user chooses the destination through a folder picker. The installer creates `AGENTS.md`, the filename Codex automatically discovers in the project instruction chain. Do not edit Codex configuration automatically or claim that any location affects every Codex task.

Read the installed, manifest-registered technique and verify that the installed entry point exists before writing. Render the placeholder below as the absolute path to that Unity project's `GeurtsGameForgeCommandments/AI_READ_FIRST.md`, using forward slashes. A guide outside the project must still point to that exact project copy. Moving the project requires reinstalling the guide.

Show the exact destination and entry point before installation. Warn that installing will overwrite the selected existing guide and lose its local contents. Cancel is the default; Enter, Escape, closing either dialog and cancelling the folder picker must cause no write. Validate the source and selected destination, reject linked paths and directories in place of the file, and verify the final bytes. Use only the selected guide path. Never write inside the managed documentation copy or `Docs/GameDesign/`.

Documentation Update and the legacy native-entry manager must not create, overwrite or delete project-root `AGENT.md` or `AGENTS.md`. The separate installer may write AGENTS.md at the project root only when the user selects it explicitly. Existing user guides elsewhere remain user-owned. Old root guides can be replaced at their selected location with this installer; old guides are not silently removed.

Do not keep a standalone AGENTS.md template in the documentation package. The following marked block is the frozen legacy template; the portable root template is separately versioned below. Its version, manifest registry entry, installer validation and tests must change together if the format changes.

## Legacy template

<!-- GEURTS-CODEX-GUIDE-BEGIN version="1.1.0" -->
```markdown
# Geurts Game Forge AI guide

Before planning or changing any part of Geurts Game Forge, read this exact documentation entry point:

`{{GEURTS_DOCUMENTATION_ENTRY_POINT}}`

Continue to the sibling GeurtsTechniqueManifest.md and read every technique selected for the task from that same documentation copy. Treat the selected documentation as the source of truth. Do not substitute remembered rules or another checkout. If the entry point cannot be read, report its exact missing path and ask for the guide to be reinstalled before making changes.

Every update, however small, must bump the owning package or documentation version before publication. Follow the versioning and validation rules in AI_READ_FIRST.md.

Keep project-authored game design separate; access Docs/GameDesign only when the manifest-selected Game Design Documentation Technique and the user's task authorize it.
```
<!-- GEURTS-CODEX-GUIDE-END -->

## Codex discovery reference

[Official Codex instruction discovery](https://learn.chatgpt.com/docs/agent-configuration/agents-md) describes AGENTS.md discovery, directory scope and optional fallback filenames.

## Portable project-root onboarding

Angels 0.2.0 adds **Install portable project-root AGENTS.md**, a separate explicit action. It writes only `<ProjectRoot>/AGENTS.md`. The marked block below is version 1.0.0; the installed manifest must register this Agent technique as 1.3.0. Render no absolute project path. Moving the complete project preserves the relative route. Keep user instructions outside `GEURTS-CODEX-ROOT:BEGIN` / `GEURTS-CODEX-ROOT:END` byte-for-byte, including UTF-8 BOM and existing newlines. Use CRLF for a new guide. Reinstallation is idempotent.

Inspect local documentation compatibility and routing separately. Foundation readiness never implies that Codex routing is installed. Unsupported or duplicate markers, invalid UTF-8, linked destinations, excessive input and conflicting unmanaged routes fail closed. Only an exact known legacy generated payload may be migrated automatically; preserve other guides for manual reconciliation. Show the exact root destination and preservation scope in a cancel-default confirmation. Enter, Escape and closing cancel. Recheck source/target bytes after review, replace the directory entry atomically and verify final bytes. Never install on startup or as part of Commandments Update. The three Copilot routes and four-target updater authority remain unchanged.

<!-- GEURTS-CODEX-ROOT-TEMPLATE:BEGIN version="1.0.0" -->
```markdown
Before planning or changing Geurts Game Forge, resolve this route relative to the directory containing this AGENTS.md and read it:

`./GeurtsGameForgeCommandments/AI_READ_FIRST.md`

Continue to the sibling GeurtsTechniqueManifest.md and read every technique selected for this task from the same validated documentation copy. If the route is unavailable, report that missing project-relative path before making changes. Follow AI_READ_FIRST.md versioning and validation rules for every update. Access Docs/GameDesign only when the selected Game Design Documentation Technique and the user's task authorize it.
```
<!-- GEURTS-CODEX-ROOT-TEMPLATE:END -->
