<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Game Forge Automation Technique

**Version:** 0.11.6
**Status:** Draft normative technique
**Primary audience:** AI coding agents and automated development systems
**Secondary audience:** Human developers and compatible Unity integrations
**Required package path:** `GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md`

## Purpose

This technique defines concise, reusable operational behaviour for AI-assisted game development. It does not define a document resolver, technical priority system, product integration lifecycle, or product feature. `GeurtsTechniqueManifest.md` alone decides when this technique applies, where it is read, and which subject owner resolves a conflict.

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

## Git Source Control

**Git is the only permitted source-control system for first-party games, Forge packages, tools, documentation and authored assets.** Do not use Unity Version Control/Plastic SCM, Perforce, Subversion/SVN, Mercurial or another VCS, including parallel VCS tracking of the same work.

Use Git directly or through a Git client/IDE integration; clients must operate on Git repositories and history. Git LFS is permitted as a Git extension for suitable large assets. Hosting services and clients do not replace Git. Preserve existing branch protections, immutable release identities, asset GUIDs and unrelated work.

If Git is unavailable or another VCS controls the target, stop the affected source-control operation and report the blocker; do not fall back to another VCS. Initialization or migration requires its own authorized scope. Do not automatically initialize nested repositories, remove VCS metadata, rewrite history, change global settings or convert existing projects. Forge's supported initialization action retains the [Setup owner's explicit Git boundary](GeurtsForgeSetupTechnique.md#tool-preservation-and-failure-rules).

Fetched documentation snapshots and offline installers remain inert content; this rule adds no Git metadata or installation prerequisite to them. Existing defensive ignore patterns for other clients do not authorize using those clients as source-control systems.

## Proportionate Testing

**Do not write, expand or run unit tests unless absolutely necessary.** Reduce AI tool compute by preferring existing evidence, inspection, static validation, compilation or a small smoke/integration check when these adequately verify the change at lower cost.

An exception must address a concrete material correctness or regression risk that adequate lower-cost checks cannot cover, or an unavoidable required acceptance gate. Briefly record the risk, why cheaper evidence is insufficient, and the smallest useful unit test or subset. Reuse existing tests where possible. Do not create test infrastructure, chase coverage percentages or run a whole unit suite by habit. A changed method, new class or generic best-practice claim alone does not establish necessity.

**Add tests for distinct behaviour or credible regression risks, not to increase test counts.** Inspect and reuse existing coverage before writing a new case. Extend an existing test or use representative parameterized cases when they exercise the same contract. Retain separate cases for meaningfully different boundaries, failure modes, lifecycle or supported environments; do not duplicate assertions under different names or mirror implementation details.

Do not add automated tests solely for reversible, low-impact prose, formatting or cosmetic changes when inspection and existing checks adequately verify them. For behaviour changes, choose the smallest useful checks of observable outcomes and relevant failures. A bug regression should fail when the bug is reintroduced. Avoid speculative test infrastructure and exhaustive combinations without a concrete risk.

Use focused checks while editing. Run required final validation once for the completed candidate in an accepted environment; successful required CI can supply that evidence without a duplicate local full-suite run. Reuse evidence only for the identical source tree, relevant inputs and tested environment. Changes, failures, stale evidence or an unresolved concern justify affected reruns or broader checks; repeating an unchanged successful run needs a concrete reason. Keep actual source/environment coverage explicit. Required repository, platform and publication gates remain binding; do not delete useful coverage or bypass checks to reduce compute.

## Efficient AI Tool Use

**Minimise avoidable tool calls, compute, output and repeated work while completing the authorized outcome.**

- Follow manifest selection and audience/section filters. Search relevant paths with `rg` before broad reads; retain already-read unchanged content within the current task, and refresh it when its source or applicability changes. Never substitute stale memory for required current reading.
- Prefer a suitable supported API, connector or CLI. Batch independent searches and reads; parallelize only independent, safe operations. Keep dependent work, mutations and approvals in their required order.
- Request concise results and read only the relevant ranges, fields or diagnostics. Preserve complete required evidence in files when useful; do not dump large logs or generated data into context. Detect truncation and retrieve missing relevant content before relying on it.
- Reuse validated discoveries and results with their source/version and freshness limits. Avoid duplicate scans, downloads, builds, speculative dependencies and overlapping work. Stop expanding validation after the requested outcome and required checks are satisfied unless new evidence identifies a gap.
- Wait for asynchronous work with bounded waits and backoff or change notifications. Avoid tight polling, repeated unchanged status reads and automatic expensive retries without diagnosing the cause. Report meaningful progress and blockers concisely.

## Codex Project and GameForge Path Preflight

Apply the [Technical Technique's complete path preflight](GeurtsTechnicalTechnique.md#absolute-path-length-and-workspace-roots) to every Codex and GameForge project before creating, copying, extracting or moving content. Check foreseeable dependency/cache/temporary/generated descendants, report the exact offending path and length, and use a shorter location for new task-owned work. Existing user content requires explicit authorization to move. This guidance installs no automatic path checker.

## Shared Integration Queue

**Route every completed update through one shared integration queue per owning Git repository.** This applies to human contributors and AI chats/agents on every machine, including game, Forge package and Commandments source work. Contributors prepare changes independently; one integration owner at a time integrates, assigns final versions and publishes to `main`. A contributor may also act as integrator, but must follow the same queue and completion checks.

Use the repository's documented queue commands or contributor procedure. A scoped pull-request queue processed serially by a named integrator is sufficient when dedicated automation is absent. Keep queue order, ownership and outcomes visible to all contributors; a machine-local lock alone cannot coordinate multiple machines. This documentation adds no queue service or GitHub enforcement. Do not change repository permissions, accounts, apps or branch protections merely to adopt it.

### Contributor handoff

- Work on a focused task branch in an isolated worktree or clone, preserving the original checkout, index, uncommitted changes and live Unity state.
- Submit the exact source commit, base/dependencies, scope, proposed version increment and reason, implementation details, validation results and evidence, tested inputs/environment, and every unverified check with its next step.
- Leave the final version assignment, shared release metadata/history and publication to the integrator. Task-specific documentation remains part of the task. Every update still needs its own appropriate higher version before delivery, including small edits without a build; use the entry point's SemVer rules or an explicit owning-project version policy.
- Continue independent work without repeatedly rebasing, renumbering or rerunning unchanged checks solely because unrelated `main` work landed. Refresh a queued submission when its own content, relevant dependencies, acceptance conditions or required checks change. Respect required branch-current gates.

### Integration and completion

1. Claim the next ready submission through the shared queue's exclusive ownership mechanism. Preserve recorded dependencies and deterministic order. Do not process simultaneously from another machine or take over an active integrator; failed ownership recovery must follow the repository's documented procedure.
2. Fetch current `main` and release/version history, integrate the exact queued source, and resolve actual overlaps in the isolated integration checkout. Assign the next version from the final scope and current shared history, accounting for all contributors' previously unaccounted changes once. Keep affected source, runtime/build metadata and tracked version history consistent. Never reuse a released version for changed content. Missing or conflicting version evidence blocks assignment.
3. Validate the final combined candidate with the required repository checks, reviews and protections. Reuse prior evidence only where its relevant source, inputs, dependencies and environment remain unchanged; record what it covers. Run affected checks for real changes or failures, plus unavoidable final gates. An unrelated upstream commit alone does not justify repeating every worker's validation.
4. Publish the completed candidate to remote `main` through the supported non-force push or approved pull-request process. If upstream moves, reconcile the integration candidate and version there, rerunning affected checks; return only genuine task conflicts or failures to their owner. After publication, explicitly pull `main` from the same remote with `git pull --ff-only <remote> main` in the integration checkout. Also pull into the original checkout when it is already on `main` and its index/local changes can be preserved. Never switch the user's branch, auto-stash unrelated work, discard edits or reset a checkout to make synchronization succeed.
5. Record the delivered source and verified remote-main commits, assigned version, validation evidence, unverified checks and post-publication pull results in the queue outcome. Verify that remote `main` contains the intended changes and complete required immutable releases. A queued submission, successful worker check or candidate push is not delivery. Report a blocked pull, merge, version assignment or release with its exact remaining step; do not claim completion or consume the same update/version twice on retry.

Queue tooling, storage, lock recovery, version-history format and build delivery remain owned by each repository. Document their supported contributor steps there. This workflow does not itself require a player build, install dependencies or update consumer copies.

## Codex Delivery to Main

This rule applies independently to **every Geurts Game Forge package source repository**, including God, BigBang, the passive Commandments compatibility adapter, and every current or future brick owner, as well as **`Geurtsy/GeurtsGameForge_Commandments` itself**. For a task that changes multiple owners, commit and deliver each changed repository to its own remote `main`. A Unity test or consumer project is not a substitute delivery destination for those sources.

Codex must always merge completed, appropriately validated changes into the owning repository's `main` branch unless the current user explicitly specifies another destination or asks to leave the work unmerged. Do not stop at a local edit, feature branch, draft or open pull request when the authorized work can be safely completed and merged. The user's request for implementation supplies standing authorization for this delivery step; do not ask for redundant merge permission.

Use the [shared integration queue](#shared-integration-queue) for this delivery, preserving the repository's supported merge workflow, required checks and branch protections. Keep the merge scoped to the requested changes, preserve unrelated work and unsaved Unity state, and verify that the intended commit is present on remote `main` when a remote exists. This rule does not authorize force-pushing, bypassing failed checks or protections, or merging unrelated or incomplete work. If a real blocker prevents the merge, finish the safe work available and report the exact blocker and remaining delivery step without claiming a successful merge.

### Remote publication and consumer installation

Never report a local-only commit, local `main` merge or isolated checkout as completed delivery. Local commits are allowed as intermediate work, but the verified intended changes must reach remote `main` and their immutable higher-version Git release before completion unless the current user explicitly asks to leave work unpublished. Preserve incomplete work on a clearly identified remote candidate branch and report remaining acceptance gates; that branch is not a released or installed package.

For every brick feature or maintenance change, follow the Brick Contract's publish-first sequence: keep the consuming project on its old Git version, develop and validate separately using Git candidate sources, publish the newer Git release and update the authoritative catalogue, then update and verify the consumer through Unity Package Manager. Do not install live local copies, overwrite source folders, downgrade packages or reuse a release version. Report source validation, remote publication/catalogue status and actual consumer installation separately, with exact versions and commits. Resolve simultaneous work against current remote state and preserve all intended changes before merging.

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

## Supported operations and inspection evidence

Use the installed owner's supported APIs. God 0.35.0 provides the additive Editor `ForgeOperations` 1.0.0 contract and `ForgeProjectReport` schema 1.0.0. Discovery is local; no remote code is executed. Inspect is read-only. Execute is a separate explicit request and retains the owning lifecycle, preflight, Undo and consent rules. Await asynchronous actions on Unity's synchronization context. Never block that thread to wait for them. Typed drafts/reviews remain caller-owned and must pass the owner's stale-review validation.

Operation outcomes are `succeeded`, `cancelled`, `failed`, `partial`, `blocked` or `unavailable`, with separate verification `verified`, `unknown` or `not_applicable`. Partial completion retains actual changed targets; no rollback is implied. Failure with unknown verification may have changed state. Supported methods remain available directly; do not invent an operation when the installed owner does not provide it.

Findings use stable owner-defined rule IDs and owning package IDs. Preserve the Unity object identity, asset/scene path, exact SerializedProperty path, severity and remedy when actually resolved. An unsaved object, aggregate rule or unresolved property remains explicitly unknown; display labels and instance IDs are not persistent identities. A read-only project report covers owned project assets and loaded scenes, or only the supplied selection. Unopened scenes, native/runtime behavior and game-design context are outside that scope. Do not infer whole-project health from checked source metadata. Failed providers and uninspected objects remain visible.

Every release carries `ForgeCapabilities.json` schema 1.0.0 with exact package identity/version, prerequisites, implemented/planned features, maturity, supported operation IDs and validation coverage. Compare it with the actual installed package and provider availability. A declaration does not establish readiness. Planned features never acquire supported operations. Use the current Save and Load release's declared local gameplay persistence; cloud/account and game-specific restore policy retain separate evidence. God remains the only mandatory shared brick; BigBang and the passive adapter remain independent.

Before publishing, run the owner's documentation/capability gate and compile supported examples with the candidate Git package. Current guides, dependency claims and operation declarations must match the release. Explicitly label historical evidence and keep it separate from current validation. Record exact tested source fingerprints and unverified surfaces. Preserve manual consumer installation.
