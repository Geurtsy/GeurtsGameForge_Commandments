<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Game Forge Automation Technique

**Version:** 0.9.2
**Status:** Draft normative technique
**Primary audience:** AI coding agents and automated development systems
**Secondary audience:** Human developers and compatible Unity integrations
**Required package path:** `GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md`

## Purpose

This technique defines concise, reusable operational behaviour for AI-assisted game development. It does not define a document resolver, technical priority system, integration lifecycle, or product feature. `GeurtsTechniqueManifest.md` alone decides when this technique applies, where it is read, and which subject owner resolves a conflict.

<!-- GEURTS-SECTION:BEGIN HUMAN-ONLY -->
### Provenance

Reusable operational guidance was selectively adapted from the supplied Game Forge Intelligence generated-project `AGENTS.md`. The adaptation is governed by the existing Geurts hierarchy and technical priorities. Product-specific policy was deliberately excluded, and the supplied file is not an authority for this package.

<!-- GEURTS-SECTION:END -->

## Active Request

The current explicit user instruction is the active request whether it arrives through an embedded game-development interface or a direct coding-agent prompt. The interface does not change its authority.

Use a host-provided pending automation objective only after the user explicitly asks to start or continue that pending work. A pending artifact does not silently override a newer direct request, the manifest-selected subject owners, project-specific design facts, or safety boundaries.

## Operational Behaviour

- Implement requested project changes when implementation is authorized; answer informational questions without unrelated mutation.
- Inspect the relevant project files and documentation before creating replacements.
- Follow the Technical Technique's Windows development and build workflow: work on Windows for Windows with Unity and Codex, use Windows-compatible host commands, and verify CRLF in authored text while preserving each file owner's mutation boundary.
- Reuse or extend suitable project systems and established folder conventions when doing so fits the project evidence.
- Work in small, reversible increments and validate after meaningful changes.
- Repair recoverable failures within scope, preserve working systems, and automate routine safe work the available environment can perform.
- Keep the user informed of genuine blockers, consequential decisions, validation results, material limitations, and any action only they can take.

## Codex Delivery to Main

Codex must always merge completed, appropriately validated changes into the owning repository's `main` branch unless the current user explicitly specifies another destination or asks to leave the work unmerged. Do not stop at a local edit, feature branch, draft or open pull request when the authorized work can be safely completed and merged. The user's request for implementation supplies standing authorization for this delivery step; do not ask for redundant merge permission.

Follow the repository's supported merge workflow, required checks and branch protections. Keep the merge scoped to the requested changes, preserve unrelated work and unsaved Unity state, and verify that the intended commit is present on remote `main` when a remote exists. This rule does not authorize force-pushing, bypassing failed checks or protections, or merging unrelated or incomplete work. If a real blocker prevents the merge, finish the safe work available and report the exact blocker and remaining delivery step without claiming a successful merge.

## Computer Control During Implementation and Tests

Avoid using the user's computer interactively for tests. By default, do not activate or focus application windows, inject mouse or keyboard input, manipulate the desktop, or use computer-use tools to run tests or gather test screenshots. Prefer background command-line checks, supported APIs and connectors, headless or batch tests, and isolated fixtures that preserve the user's live work. Ordinary local file operations and background tests remain allowed when they do not take over the desktop or disturb live application state.

Interactive testing requires the current user to explicitly request or authorize that exception. If a required test cannot be completed without interactive computer control, report that exact unverified surface and its practical verification path. Do not treat missing interactive evidence as a pass or silently waive the owning technique's acceptance gates.

Use the user's PC interactively for implementation only when it is absolutely necessary to complete the authorized change correctly. First use suitable file tools, supported APIs, connectors or command-line methods where they can perform the work correctly. When those methods cannot implement the required operation, use computer control for the minimum necessary implementation step, preserve open scenes, unsaved content, settings and application layout, and release control promptly. Necessary implementation control does not authorize incidental interactive testing. Continue to use validated Unity Editor APIs for Unity-owned serialization under the boundary below.

## Approach and Questions

Choose a reasonable implementation by applying project evidence and the manifest-selected Technical Technique. Do not add a separate decision framework or require a multi-option comparison for routine work.

Ask the user only when alternatives materially change gameplay, architecture, scope, safety, cost, or another genuinely consequential outcome, when a manifest-selected subject owner requires an answer, or when new authority is required. Otherwise proceed with reversible routine details that can be inferred safely.

## Unity-Owned Serialization

Prefer validated Unity Editor APIs for scenes, prefabs, assets, serialized references, and other Unity-owned data. Do not directly rewrite Unity YAML when an appropriate Editor API is available. If correct serialization requires unavailable Editor access, report the blocker rather than inventing unsafe file mutations.

This principle does not prescribe a plugin bridge, request schema, UI, runtime, or storage path. Those implementation details remain outside this generic technique.

## Product Boundary

Product-specific modes, services, APIs, credentials, feature policy, runtime settings, user-interface behaviour, and storage formats are not Geurts rules. A compatible product may apply its relevant conditional material only at the manifest-defined position and within that feature's scope.

## Definition of Done

Automation is complete when the active request is resolved within scope, relevant project evidence and manifest-selected authorities were used, safe routine work was completed, consequential uncertainty was surfaced, relevant validation passed, Codex completed the required delivery to main unless the user specified otherwise, and the result reports the change and a practical verification path. Any actual merge blocker or unavailable interactive validation remains explicitly reported.
