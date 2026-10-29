<!-- GEURTS-AUDIENCE: AI-READ -->
# StandardsOnly Windows installer

**Version:** 1.0.1
**Audience:** AI agents only

Secondary optional route. This guide documents the unchanged installer artifact 1.0.0. The [approved standalone replacement requirement](../../GeurtsTechniques/GeurtsCommandmentsCompanionTechnique.md#secondary-standalone-documentation-routes) is a separate unverified implementation; do not claim this artifact replaces existing documentation or the three Copilot routes.

[Download GeurtsStandardsOnlyInstaller-1.0.0.zip](https://github.com/Geurtsy/GeurtsGameForge_Commandments/raw/main/Tools/StandardsOnlyInstaller/GeurtsStandardsOnlyInstaller-1.0.0.zip)

Extract the complete ZIP, run `InstallStandardsOnly.bat`, select the existing Unity project root containing `Assets`, `Packages` and `ProjectSettings`, then type `INSTALL` to confirm the displayed destinations. Start a new coding-agent session in the project and ask it to read `AGENTS.md`.

The ZIP contains the batch launcher, readable PowerShell source, instructions, snapshot inventory and complete documentation **0.61.1**, pinned to commit `6f1454494e5f773633c2107154d3527fae9e8b15`. Installer and repository versions are independent: this artifact keeps that exact snapshot even when the repository advances. Extract the archive to use it; the ZIP is not executed by the documentation reader or God service.

Installation works offline with Windows PowerShell 5.1. It needs no administrator access, Git, GameForge, Steam, Odin Inspector or Quantum Console. It copies documentation into `GeurtsGameForgeCommandments/` and adds a StandardsOnly block to root `AGENTS.md`. Existing supported UTF-8 instructions are preserved byte-for-byte and backed up before modification. An identical repeat run is idempotent.

Different or edited documentation, conflicting Geurts routes, opt-outs, `AGENTS.override.md`, unsupported guide encodings and linked paths cause installation to stop. This is an initial installer, not an updater. Assets, scenes, dependencies, game-design files, project settings and Copilot routes are unchanged. An existing project's broader standards migration remains a separate task. Tools that do not discover `AGENTS.md` require the documentation entry path explicitly.

Twelve installation-engine checks passed, plus batch-launcher installation with a spaced project path and cancellation without mutation. The graphical folder picker was not interactively tested; Windows junction fixtures were unavailable. Read the bundled `ReadMe.txt` for recovery, automation and preservation details.

## Maintaining the artifact

The versioned ZIP is the exact previously delivered installer, including its editable source files; do not replace it with changed bytes under the same version. Publish changes as a new installer version, test its extracted launcher and preservation paths, record its documentation commit, and update the package registry and download links. Do not recursively bundle the current repository into this existing snapshot.
