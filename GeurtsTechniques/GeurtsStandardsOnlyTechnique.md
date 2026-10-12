<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Standards-Only Technique

**Version:** 1.0.0
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsStandardsOnlyTechnique.md`

## Purpose and Authority

Use **StandardsOnly** when a project adopts the Commandments as development standards without using Geurts Game Forge packages. `GeurtsTechniqueManifest.md` selects this technique before the task's generic subjects and owns all reading order, version resolution and conflicts. This technique owns only the standards-only applicability boundary; each selected subject retains its actual technical rules.

StandardsOnly is a usage profile, not a new PowerShell reader mode, a package, an installer or a claim that a game has been migrated. The existing `GameUse` audience filter is suitable for reading selected shared documents. Audience filtering alone does not remove framework-specific sentences; apply this profile's boundary as well.

## Select the Profile Explicitly

An explicit user instruction or project-authored instruction selects StandardsOnly. For example:

```text
Use GeurtsGameForge_Commandments in the StandardsOnly profile.
Read GeurtsGameForgeCommandments/AI_READ_FIRST.md and its manifest.
Apply the selected development standards without installing or using GeurtsGameForge packages.
```

Keep the profile choice in an existing user-owned project guide or technical document when persistence is requested. Preserve unrelated instructions. A conversation instruction applies within that conversation; it does not edit a project guide automatically. No particular instruction filename is required, and a tool must support its chosen instruction surface or receive the instruction explicitly.

Do not infer package adoption from the documentation's name, the presence of a documentation folder, missing packages or the `GameUse` reader mode. An instruction to use the documentation without GameForge selects StandardsOnly. An existing Forge integration is not removed or disabled by selecting this profile. When scope is unclear, inspect the relevant project evidence and clarify before changing dependencies.

## General Standards Remain Applicable

Select task-relevant Technical, Unity, Code, Authoring, Naming, Folder Structure, Bootstrap, Audio, GameAI, Multiplayer, Automation, Game Design Documentation and Git subject techniques through the manifest. Their general requirements remain binding, including technical priorities, supported APIs, documentation, naming and script exemptions, ownership, preservation, bootstrap scene lifetime, safe serialized changes, validation and truthful evidence.

The required `SCN_BigBang` and `SCN_DevPlayground` scenes, folder placement and build order remain project standards. The name `SCN_BigBang` does not require the BigBang installer or God: the standalone project implements its own bootstrap using the documented retained-scene lifetime rules.

Steam, Odin Inspector and Quantum Console are optional in StandardsOnly, including Unity implementation. This profile takes precedence over subject-level mandatory dependency, installation-blocker and no-fallback clauses for these integrations. Missing libraries, licences, accounts or platform credentials do not block standalone development or standards compliance. Integration-specific rules apply only when explicitly selected. Selection does not itself authorize installing or removing dependencies. The Windows target baseline remains unless separately changed.

| Optional integration | StandardsOnly behaviour |
|---|---|
| Steam and Steamworks.NET | No Steam SDK, Steam client, Steamworks account, App ID, Steamworks.NET package or Steam startup integration is required. Select Steam Integration only for an explicitly requested integration. |
| Odin Inspector | No Odin package, licence, Odin attributes, Odin base classes or Odin-only authoring APIs are required. Native Unity inspectors, serialization, tooltips, validation, custom editors and UI Toolkit are valid ways to meet applicable authoring standards. Odin-specific no-fallback clauses do not prohibit these choices. |
| Quantum Console | No Quantum Console package, licence, runtime console, QC APIs or command attributes are required. Use project-owned diagnostics and commands when needed; a console is optional. General command naming, help and execution-permission standards apply when commands are implemented. |

Reading documentation and running source-only PowerShell tools requires none of these assemblies.

## Framework Requirements Are Conditional

No Geurts Unity packages are required by StandardsOnly. God, Angels, BigBang, Diagnostics, Audio and the passive Commandments Compatibility adapter are not prerequisites for this profile.

| Framework-specific requirement | StandardsOnly behaviour |
|---|---|
| Brick Contract, Catalogue, brick reuse and catalogue source/version checks | Do not select them for ordinary standalone game work. Reuse suitable existing project systems; no brick inventory, catalogue query, installation request or replacement is required. |
| God lifecycle, `IBrick`, `BrickContext`, logging/session/settings contracts and public Editor operation APIs | Do not reference, imitate or implement these contracts merely to satisfy the standards. Use the project's established systems and apply the general ownership, cleanup and validation rules. |
| God-owned Commandments viewer, check/update service, companion confirmation and passive adapter | Not required. Source-only documentation acquisition is described below. Existing service integrations retain their exact consent and target boundaries when explicitly used. |
| Forge Setup, BigBang/BigCrunch, Angels helpers, Forge-owned Editor Theme/Appearance and Forge capability/publication gates | Not selected for ordinary standalone work. Do not install framework tools or introduce their shared APIs. UI Toolkit and meaningful authoring standards still apply through Authoring. |
| Audio brick and Scene Loading brick reuse | Not required. Use the project's selected audio and scene systems with the general Audio and Bootstrap rules. FMOD remains optional. |
| Diagnostics and God's `[ForgeCommand]` classification | Not required. If commands are in scope, retain full names, categories, help, safe output and actual execution permissions. Use project-owned command mechanisms and Player/Developer/cheat policy without God or Quantum Console references. Neither command attributes nor Forge classification attributes are required. If Quantum Console is explicitly selected, use its supported APIs. A display filter alone never authorizes execution. Genuine failures must remain independently visible; absence of Diagnostics does not require standalone project logs to be no-op. |
| God Commandments Update before full folder setup | Not required in StandardsOnly. Use the selected complete source copy and its matching folder definition; run the existing create-only PowerShell tool only as an explicit folder operation. Retain containment, path, ownership, idempotence and preservation checks. |

Package requirements apply again to any explicitly adopted Forge integration and to work maintaining Forge itself, including this documentation repository. Select the relevant framework owners for that scope; StandardsOnly is not an exemption for developing a Forge brick or changing an installed package. Do not silently switch a whole project to framework use or remove packages. This boundary does not authorize a parallel Forge updater or change the four-target companion contract, frozen templates, schema versions or existing installer APIs.

## Use the Documentation Without Unity Packages

Read a complete official source checkout or download one complete official source snapshot at a recorded exact commit. Use one validated package throughout the session. `GeurtsGameForgeCommandments/` is the conventional project-local location; an explicitly selected external checkout is also valid. Start at its `AI_READ_FIRST.md`, then its manifest. Do not mix remembered rules, partial copied techniques or files from another version.

This manual source acquisition is not the God-owned project content Update operation. It invokes no Unity package or managed route replacement. Do not overwrite an existing documentation copy, edit user AI routes, create folders, inspect game design, install dependencies or perform setup merely because the standards were selected. Updating an existing copy or configuring a supported agent route is a separate authorized task that preserves user content; it must not impersonate the companion or expand its permissions. Normal session initialization reads the selected local copy without a remote check.

An AI agent can follow the standards directly; no Editor viewer, integration plugin, runtime AI or live Unity connector is required. Reading successfully does not certify agent compliance, existing assets, compilation or gameplay behaviour. Validate the actual changed scope through its selected subject owners.
