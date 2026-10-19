<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Game Forge Automation Technique

**Version:** 0.12.0
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

**For games we work on that use GeurtsGameForge_Commandments as their technical documentation, route every completed game update through one shared integration queue per owning game Git repository.** This applies to human contributors and AI chats/agents on every machine working on those games, including StandardsOnly adoption without Forge packages. Contributors prepare changes independently and submit once; one designated background processor integrates, assigns final versions and publishes to `main`. Worker chats end their turn after a verified submission. This game workflow does not change the contribution or publication process for Forge package sources or the Commandments documentation repository.

Use the repository's documented queue commands or contributor procedure. A scoped pull-request queue processed serially by a named integrator is sufficient when dedicated automation is absent. Keep queue order, ownership and outcomes visible to all contributors; a machine-local lock alone cannot coordinate multiple machines. This documentation adds no queue service or GitHub enforcement. Do not change repository permissions, accounts, apps or branch protections merely to adopt it.

### Contributor handoff

- Work on a focused task branch in an isolated worktree or clone, preserving the original checkout, index, uncommitted changes and live Unity state.
- Submit the exact source commit, base/dependencies, scope, proposed version increment and reason, implementation details, validation results and evidence, tested inputs/environment, and every unverified check with its next step.
- After the submission is confirmed, report its ID as **Queued - awaiting integration** and end the worker turn. If that snapshot was already submitted, reuse its ID rather than resubmitting or repeating unchanged validation. Do not operate a processor, poll its status, wait through unrelated integrations, automatically retry/requeue failures, or create replacement processor checkouts. This handoff ends the worker turn; it does not claim the game update is delivered.
- Leave the final version assignment, shared release metadata/history and publication to the integrator. Task-specific documentation remains part of the task. Every update still needs its own appropriate higher version before delivery, including small edits without a build; use the entry point's SemVer rules or an explicit owning-project version policy.
- Continue independent work without repeatedly rebasing, renumbering or rerunning unchanged checks solely because unrelated `main` work landed. Refresh a queued submission when its own content, relevant dependencies, acceptance conditions or required checks change. Respect required branch-current gates.

### Integration and completion

Run integration as an ordinary deterministic background program or supported repository automation, without an AI chat continually reasoning, monitoring or waking on a schedule. Keep one processor checkout per configured processor and enforce exclusive local checkout ownership as well as the shared cross-machine publication lock. Multiple worker submissions may wake the same processor; they must not launch competing publishers. A busy shared lock may use bounded background backoff without waking worker chats. Record actual process state and logs; do not promise automatic operation when the processor is unconfigured or stopped.

1. Preflight the processor checkout and required tools before claiming a queued task, then claim the next ready submission through the shared queue's exclusive ownership mechanism. Preserve recorded dependencies and deterministic order. Do not process simultaneously from another machine or take over an active integrator; failed ownership recovery must follow the repository's documented procedure. A dirty or retained processor checkout is a processor failure, not evidence that another worker's task failed.
2. Fetch current `main` and release/version history, integrate the exact queued source, and resolve actual overlaps in the isolated integration checkout. Assign the next version from the final scope and current shared history, accounting for all contributors' previously unaccounted changes once. Keep affected source, runtime/build metadata and tracked version history consistent. Never reuse a released version for changed content. Missing or conflicting version evidence blocks assignment.
3. Validate the final combined candidate with the required repository checks, reviews and protections. Reuse prior evidence only where its relevant source, inputs, dependencies and environment remain unchanged; record what it covers. Run affected checks for real changes or failures, plus unavoidable final gates. An unrelated upstream commit alone does not justify repeating every worker's validation.
4. Publish the completed candidate to remote `main` through the supported non-force push or approved pull-request process. If upstream moves, reconcile the integration candidate and version there, rerunning affected checks; return only genuine task conflicts or failures to their owner. After publication, explicitly pull `main` from the same remote with `git pull --ff-only <remote> main` in the integration checkout. Also pull into the original checkout when it is already on `main` and its index/local changes can be preserved. Never switch the user's branch, auto-stash unrelated work, discard edits or reset a checkout to make synchronization succeed.
5. Record the delivered source and verified remote-main commits, assigned version, validation evidence, unverified checks and post-publication pull results in the queue outcome. Verify that remote `main` contains the intended changes and complete required immutable releases. A queued submission, successful worker check or candidate push is not delivery. Report a blocked pull, merge, version assignment or release with its exact remaining step; do not claim completion or consume the same update/version twice on retry.

Retain real failures and produce one actionable operator alert with the exact request, operation, exception type, evidence and remaining step; an empty error is insufficient. Follow the owning repository's documented validation and bounded recovery policy below. Benign ownership contention and safely proven abandoned modern leases follow [automated publisher leases and recovery](#automated-publisher-leases-and-recovery); they are not failed tasks. Do not cycle through fresh roots, requeue unchanged failures or make workers babysit the queue. Preserve already published receipts so recovery completes the original version and commit instead of delivering the same update again. Unknown dirty work, unsafe ownership, missing access, failed required gates and uncertain publication/pulls cannot be converted into passes.

The processor records completed delivery and any remaining task handoff. A later explicit task follow-up may read its receipt once and finish the owning project's required status/validation handoff. Do not mark a queued task complete or advance an external task to a delivered/testing status before verified publication, and do not schedule recurring AI checks merely to maintain that status. Versioning, validation, pushing to `main` and pulling afterward remain mandatory processor responsibilities.

Queue tooling, storage, the implementation of the lease requirements below, version-history format and build delivery remain owned by each repository. Document their supported contributor steps there. This workflow does not itself require a player build, install dependencies or update consumer copies.

### Automated publisher leases and recovery

**Games with automated cross-machine publishers must implement renewable, bounded ownership leases and automatic abandoned-lease recovery**, including StandardsOnly projects. The named-integrator pull-request queue above remains valid without dedicated automation. Adopt this workflow in the game's own tooling; reading or installing these documents does not implement or certify it.

- Keep one persistent Git coordination ref with a versioned lease record and fast-forward commit lineage for claim, renewal, takeover and release. Concurrent contenders propose children of the exact observed predecessor; ordinary non-force Git arbitration must reject the losing sibling. Never delete/recreate the ref, force-push, bypass protections or replace processor roots to recover ownership. A released record is available; viewers must not label it busy merely because the ref exists.
- Renew independently throughout long validation, runtime checks and publication. Give the owner a local monotonic deadline anchored conservatively to renewal dispatch and last proven ownership; a late acknowledgement must not extend it. Bound every transport comfortably below the ownership interval. Immediately before each outbound publication, after any object preparation/transfer, reserve the full configured write allowance under the current local deadline. Verification crossing that prior deadline cannot revive ownership. A paused, expired, released or uncertain owner is permanently fenced from further integration writes and cannot resume using an old lease object.
- Observe an unchanged, successfully read remote lease object over a documented local monotonic interval before automatic takeover. Keep observations across passes of the same healthy processor; reset them when the object changes, the process restarts, or access fails. Remote timestamps, clock differences, an unreachable host and missing local PIDs do not prove expiry. A healthy renewal resets contenders' observations; ordinary lost-claim races back off as busy without turning the queued task into a permanent failure.
- Fence each publication atomically with an advance of the same lease ref, covering `main`, queue results, checkpoints and retained work-in-progress refs, including exception cleanup. Check current ownership and the local deadline under the same owner guard. Require the remote's all-or-nothing transaction capability; never fall back to sequential target/lease pushes. A rejected, timed-out or ambiguously acknowledged operation must stop that owner's writes and retain actionable local evidence. See [Git's atomic push and fast-forward rules](https://git-scm.com/docs/git-push).
- Verify successful coordination pushes by fetching the exact ref and committed object, not by trusting the push acknowledgement. Use separate inspection refs or exact-object fetches that avoid shared `FETCH_HEAD` writes across heartbeat, queue/viewer inspection, submission and controller operations. Resolve the advertised exact object, verify it is a commit and fail actionably if its ref is absent or changed. Status inspection must not race a code pull's internal fetch/merge. Claim/renewal must prove the expected current child; release verification may accept a proven descendant of its released child. Failed or uncertain verification fences the owner. Control-ref fetches never replace a required post-publication code pull.
- Never automatically expire a legacy lock lacking this fencing protocol. Migration requires explicit confirmation that its owner stopped and a fresh exact-SHA comparison; append a fast-forward released child only while that same lock remains current. Refuse a changed owner. Malformed metadata, unknown/future protocol versions and incompatible timing policies remain visible, actionable blockers rather than assumed free ownership.
- Document one compatible policy for lease format, observation/owner intervals, renewal cadence, transport bounds and upgrades on every participating machine. Honor explicitly supported older records' recorded durations; reject unknown timings/versions rather than guessing expiry. Size actual subprocess deadlines and write reserves consistently with the owner interval. Transport, declared/native checks, model repair and operator observation have distinct documented budgets; changing one must not silently extend another or reset retry evidence. An observation limit reports the same operation's actual owner/phase; it is not permission to duplicate a healthy call. Diagnose timeout stage and acknowledgement uncertainty without weakening fencing, hooks or authentication. Use the [committed-runner upgrade procedure](#committed-runner-upgrades-and-operator-recovery); ordinary worker wakes must not silently switch runners or reset configuration.
- Validate concurrent claims/takeovers, healthy checks spanning multiple renewals, paused-owner resume and each fenced publication target, uncertain transport/verification, malformed/future/legacy records, exact-SHA migration races and actual queue progress after abandonment. Preserve candidate bytes, failure evidence and published receipts through recovery. Keep the existing deterministic, non-interactive background and desktop-input boundaries; do not add recurring AI monitoring.

Automatic recovery needs at least one healthy, upgraded, configured processor with repository access. Turning off every machine runs no work. Unknown dirty work, authentication failures, failed runtime/validation checks and blocked required pulls remain real blockers; lease recovery does not waive them.

### Candidate repair and validation evidence

These requirements govern implementations of the game queue above. Forge/package sources and other owning repositories retain their chosen contribution, review and validation workflows. Document the actual adopted policy; no example silently changes a repository into an advisory or game-runs mode.

- Preserve the immutable submitted source, request ID, history and exact retained candidate HEAD, raw bytes and index. A processor may retain its own proven candidate on a remotely verified WIP ref and continue independent ready tasks in the same configured checkout. Unknown work is never disposable. Recover a delivered receipt under its original version; reconcile a superseded request only with exact submitted-source ancestry in verified remote main, never a matching title.
- Retry only through the documented policy on genuine changed inputs/policy or an explicitly reviewed operator continuation. Record why it is eligible, actual attempt times, source/main/policy and remaining budget. Require source-tree progress and stop unchanged failures. Never forge a key, input fingerprint, date or successful check, reset a repair budget, or create another request to evade a failure.
- Use bounded exact-edit proposals against fresh raw candidate hashes, unique old-text matches and an explicit task-owned path allowlist. Supply complete ordinary/diff3 conflict blocks and every arm before optional surrounding context; include necessary read-only dependency/diagnostic context. If a whole required block cannot fit the documented file/global bounds, report its path and needed/available bytes before invoking AI. Exclude binary and Unity-serialized payloads from text proposals; their owner and adopted project policy decide resolution. Never hide omitted content behind marker-only snippets or request whole-file replacements that predictably truncate.
- Keep publication/lease controllers, validation-policy enforcement and independent runtime gates immutable to repair proposals and fallback selection, including their owner entry points. Optional AI repair needs user authorization and an explicitly pinned project-selected model/reasoning level, with no silent fallback. Record model, policy, original response hash, raw candidate hashes and applied edits. Reused or operator-derived proposals retain truthful provenance (`model_invoked=false` when applicable); an augmented response is not the byte-identical original model answer. A blocked answer is evidence, not permission to apply its edits.
- Bind each declared command to relevant source/configuration/dependency inputs and environment, with available result/manifests and artifact hashes. Store versioned repository evidence or durable artifacts retrievable by the integrator and other participating machines, or regenerate through the owner before validation. A relative path into ignored worker Logs alone is not portable; a vanished absolute temporary directory is not evidence. Verify the referenced reports exist, match the actual candidate and cover the claimed checks. Regenerate stale/missing evidence through the owning validator when required, or report it failed/unverified with the concrete next step. Historical worker results retain their original source/environment scope.
- Rerun checks affected by merged or repaired inputs and the required final gates; do not rerun full feature checks solely for an unrelated version stamp. Strict required checks remain blockers. Only explicit owning-project/user policy may classify secondary failures as advisory under a separately enforced game-runs gate. Preserve their actual failures and unverified feature coverage; compilation or playable frames cannot be relabelled as the missing specialist check. Never add a blanket waiver or weaken assertions to make a queue clear.
- Keep validation-generated reports/caches out of authored source unless their contract requires them. Capture evidence and restore only proven owned original bytes, including known generated session settings/caches. New, deleted, binary or genuinely changed source and unknown index/worktree divergence remain visible; no blind reset, force-add of ignored evidence or repository-wide cleanup.

### Deterministic whitespace correction

Before AI repair, and after applying a proposal before the existing whitespace guard, automatically correct only proven-safe trailing ASCII spaces/tabs on supported added/modified first-party task-owned lines. Compare the integrated base with the actual candidate, including a successful auto-committed merge; do not assume its staged diff is nonempty. Also consider staged task source outside the proposal's write set.

Conservatively exclude multiline/raw/verbatim string payloads, templates/here-strings, Markdown fences and intentional hard breaks, binary/vendor/generated/Unity-serialized files, symlinks/reparse paths and protected/managed/exact-payload content. Unsupported or ambiguous syntax is unchanged and actionable. Preserve BOM, valid encoding, CRLF/LF, final-newline state and all other bytes. Require exact expected index/HEAD/worktree agreement and normal Git clean-filter identity; invalid decoding or divergent inputs must not be silently changed.

Record paths, line ranges and before/after hashes in the receipt without rewriting the submitted source identity. Commit the correction into the candidate and rerun the unchanged guard and affected validation. Preserve original guard scope: newly checking an entire merge must not reject untouched serialized payloads, Markdown semantics or unrelated formatting. Do not disable checks, globally ignore whitespace, blanket-format the repository or spend AI attempts on an already proven deterministic correction.

### Native derived compatibility identities

When a project declares a generated compatibility/content identity, give its exact output and input contract one supported native owner. This is a derived output, never an AI edit, copied parent digest or branch-selection fallback. Resolve other source conflicts first, then run the compiled owner through a guarded callback before the unresolved-output/commit guard; a pure identity conflict needs no AI, including in strict/no-AI mode. Missing/deleted output does not disable a still-present owner contract.

Provide a content-only owner operation that shares the real generation service without creating, saving or reserializing unrelated prefabs/assets. Generate from actual merged publisher bytes before affected evidence comparison/checks, and again after final version/metadata synchronization. A separate fixture is useful validation but does not prove byte parity with the publisher. Do not hand-rewrite Unity YAML or normalize source merely to match a fixture's digest.

Capture complete native ordered input membership, original path spelling/order, raw-file hashes, output digest, source/version, generator identity and exact native environment in a durable manifest/proof. Independently verify actual membership and every current raw byte using the native owner's ordering contract; normalized path sorting in another runtime is not interchangeable. Stage only the known derived output and expressly authorized owner changes. Unexpected input/output drift and failed generation remain real failures, never a guessed hash.

Reverify proof against current inputs after the native host restores known session caches, after the actual game gate and on the final committed candidate before publication. A digest over a temporary imported/cache mutation is stale even if a later restoration appears harmless. Receipts retain proof references/hashes and every verification phase. Record native generator/compiler failures and resolve them through the normal bounded source-repair path; no production test-skip condition, fabricated manifest or repeated model call for identity alone.

### Committed-runner upgrades and operator recovery

Publication does not update an already configured executable. Stop gracefully between requests, verify the actual OS owner and owned descendants have stopped, preserve exact candidate/index/configuration/evidence, and verify current trusted committed tooling contains the required behavior before explicitly resuming through that launcher. Preserve the existing root, tool paths, model/acceptance policy and all other settings. Missing host access is not stopped-owner proof; use the fenced lease protocol. Do not replace a processor checkout or edit a running runner to deploy a fix.

Keep self-hosting upgrades compatible: an older controller may integrate a newer native helper. Gate new helper side effects/proof generation behind an explicit supported flag/contract that only the upgraded controller supplies; old invocations retain their prior behavior. The new controller must require the new proof, never silently skip it. Document known lease/proof compatibility and fail closed on unknown protocols.

An authorized operator may recover a finite named set under fresh exclusive OS/lease ownership using original IDs, sources, receipts and versions. Preserve failed attempts and exact owned candidate evidence; reuse successful checks only for unchanged verified inputs. Restore the normal all-requests selector and preserved settings after a scoped run, then verify the actual configured committed runner, OS owner, final remote ancestry/receipts and required pulls. Take a fresh final queue snapshot; disclose new arrivals separately instead of chasing an unbounded stream or claiming an old viewer is current. Operators observe bounded native/log events, not recurring AI monitoring. Do not interrupt another healthy publisher or treat an observation timeout as a new invocation.

For queue implementations, validate real Git auto-committed and conflicted merges, identity-only/no-AI and mixed source/identity paths, generation failure/deleted output, final-version restamping, post-restoration/post-game tamper detection, literal-safe whitespace and outside-proposal staged source, protected controllers, source-bound missing/stale evidence, old/new runner flags and exact configuration restoration. Reuse existing tests; add only cases needed for material behavior risks under [proportionate testing](#proportionate-testing). These documentation rules neither install a processor nor certify any game's implementation.

## Codex Delivery to Main

This rule applies independently to **every Geurts Game Forge package source repository**, including God, BigBang, the passive Commandments compatibility adapter, and every current or future brick owner, as well as **`Geurtsy/GeurtsGameForge_Commandments` itself**. For a task that changes multiple owners, commit and deliver each changed repository to its own remote `main`. A Unity test or consumer project is not a substitute delivery destination for those sources.

Codex must always merge completed, appropriately validated changes into the owning repository's `main` branch unless the current user explicitly specifies another destination or asks to leave the work unmerged. Do not stop at a local edit, feature branch, draft or open pull request when the authorized work can be safely completed and merged. The user's request for implementation supplies standing authorization for this delivery step; do not ask for redundant merge permission.

Follow the repository's supported merge workflow, required checks and branch protections. Keep the merge scoped to the requested changes, preserve unrelated work and unsaved Unity state, and verify that the intended commit is present on remote `main` when a remote exists. This rule does not authorize force-pushing, bypassing failed checks or protections, or merging unrelated or incomplete work. If a real blocker prevents the merge, finish the safe work available and report the exact blocker and remaining delivery step without claiming a successful merge.

### Remote publication and consumer installation

Never report a local-only commit, local `main` merge or isolated checkout as completed delivery. Local commits are allowed as intermediate work, but the verified intended changes must reach remote `main` and their immutable higher-version Git release before completion unless the current user explicitly asks to leave work unpublished. Preserve incomplete work on a clearly identified remote candidate branch and report remaining acceptance gates; that branch is not a released or installed package.

For every brick feature or maintenance change, follow the Brick Contract's publish-first sequence: keep the consuming project on its old Git version, develop and validate separately using Git candidate sources, publish the newer Git release and update the authoritative catalogue, then update and verify the consumer through Unity Package Manager. Do not install live local copies, overwrite source folders, downgrade packages or reuse a release version. Report source validation, remote publication/catalogue status and actual consumer installation separately, with exact versions and commits. Resolve simultaneous work against current remote state and preserve all intended changes before merging.

## Computer Control During Implementation and Tests

Avoid using the user's computer interactively for tests. By default, do not activate or focus application windows, inject mouse or keyboard input, manipulate the desktop, or use computer-use tools to run tests or gather test screenshots. Prefer background command-line checks, supported APIs and connectors, headless or batch tests, and isolated fixtures that preserve the user's live work. Ordinary local file operations and background tests remain allowed when they do not take over the desktop or disturb live application state.

Interactive testing requires the current user to explicitly request or authorize that exception. If a required test cannot be completed without interactive computer control, report that exact unverified surface and its practical verification path. Do not treat missing interactive evidence as a pass or silently waive the owning technique's acceptance gates.

### Background processes must preserve desktop input

**Background automation must not open foreground windows, steal keyboard focus, capture input or interrupt the user's desktop.** This applies to all games using these standards, including future games and StandardsOnly projects, and to supporting Forge tools. Cover the complete process tree: queue processors, Git and its helpers, shells, credential prompts, validation tools and unattended Editor/player tests, from startup through failure handling and shutdown. A hidden or detached parent, redirected output, batch mode or loss of focus alone does not establish that child processes remain hidden.

- Suppress console creation at launch for every console subprocess. On Windows, use `CREATE_NO_WINDOW` or the host API's supported equivalent. Do not combine it with `DETACHED_PROCESS` or `CREATE_NEW_CONSOLE`; Windows ignores the no-window flag in those combinations. Do not open a window and hide or minimize it afterwards. The flag does not hide GUI applications; they need their own supported headless/non-interactive mode or an isolated test environment.
- Keep background Git and credential helpers non-interactive, capture output in logs and report missing access as a concrete blocker. Do not open terminal, browser sign-in or credential dialogs from an unattended job. User-authorized authentication is a separate explicit foreground action.
- Do not activate windows, inject input, block desktop input or change global focus/input settings to make automation work. Preserve the user's normal Editor, game and other application sessions. If a tool cannot guarantee this boundary, do not launch it unattended; record the exact blocked check and its supported verification path.
- Before deploying or materially changing a background launcher, verify it from a genuinely detached/background parent with no inherited console. Exercise representative children, including Git/helpers and validation commands, and applicable startup/failure paths. Record evidence of console/window suppression and absence of focus/input takeover without injecting input into the user's desktop. An attached terminal run or one idle-window sample alone is insufficient evidence; retain any unverified GUI/helper path explicitly.

Windows flag behavior is defined by [Microsoft's process creation flags](https://learn.microsoft.com/en-us/windows/win32/procthread/process-creation-flags). The owning repository implements and validates its launch mechanism; this documentation does not install one or certify existing launchers.

Use the user's PC interactively for implementation only when it is absolutely necessary to complete the authorized change correctly. First use suitable file tools, supported APIs, connectors or command-line methods where they can perform the work correctly. When those methods cannot implement the required operation, use computer control for the minimum necessary implementation step, preserve open scenes, unsaved content, settings and application layout, and release control promptly. Necessary implementation control does not authorize incidental interactive testing. Continue to use validated Unity Editor APIs for Unity-owned serialization under the boundary below.

### Silence throughout unattended testing

Background Editor Play Mode, player, video, UI/effects and multiplayer tests must be silent from process startup through failure handling and shutdown. Establish supported launch-time audio suppression or a verified isolated non-audible output route before any playback; cover every participating game process and output path. Batch/headless mode, a hidden window, loss of focus or muting after launch is insufficient. If silence cannot be guaranteed, do not launch that test; report the exact unverified check. Do not mute the OS globally, change saved user volumes/devices, affect unrelated sessions or disable normal delivered game audio. Actual audible listening requires explicit user authorization; muted execution does not certify listening quality.

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
