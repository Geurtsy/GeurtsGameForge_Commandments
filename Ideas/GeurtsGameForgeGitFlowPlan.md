<!-- GEURTS-AUDIENCE: FORGE-DEVELOPMENT-ONLY -->
# GeurtsGameForgeGitFlow — implementation reminder

**Version:** 0.1.0
**Status:** PLANNED — not implemented, available or installed
**Required package path:** `Ideas/GeurtsGameForgeGitFlowPlan.md`

Proposed brick name: **GeurtsGameForgeGitFlow**. This is a small planning reminder, not a scheduled task, package release, supported API or installation instruction. No repository URL, package ID, version pin or operation ID is reserved here. The [Automation Technique](../GeurtsTechniques/GeurtsGameForgeAutomationTechnique.md#shared-integration-queue) remains the normative workflow owner; this plan does not alter any repository's contribution or acceptance policy.

## Intended scope

Plan an Editor-only no-code workflow and documented public API over the **same deterministic controller**. It should offer idempotent submission, read-only queue/receipt viewing with refresh time, actual processor health, guarded same-ID recovery and explicit stopped-owner upgrades. The configured background host must not need an open AI chat or an open Editor. Integrate through existing God contracts and UI owners where applicable; inspect real supported capabilities before designing extensions. Preserve optional peer dependencies and manual consumer adoption.

AI repair is optional and separately user-authorized, with explicit project-selected model/reasoning, bounded context and truthful provenance. The controller and independent required gates remain outside proposal writes. Native derived-output owners are project adapters, not hardcoded game rules. This is queue recovery, not a general settings migration/rollback framework.

## Small implementation plan

| Priority | Deliverable | Acceptance milestone |
|---|---|---|
| 1 | Read-only repository/policy discovery and health/receipt viewer. | Distinguish unconfigured, stopped, busy, validating, retained failure and released lease; show source, actual phase, refresh time and actionable evidence without remote polling on every repaint. |
| 2 | One shared submit/publisher service with no-code controls and API. | Submit once returns a stable ID; one locally exclusive/fenced publisher performs project-owned versioning, required gates, native derived-output proofs and verified publication/pulls. No duplicate update/version on recovery. |
| 3 | Guarded retention, recovery and committed-runner upgrade. | Preserve exact candidate/index/history and settings/root, reject live/stale owners, honor known compatibility, restore normal all-requests mode after scoped maintenance. |
| 4 | Owning-source and UI/fault fixtures, then a separately authorized release. | Real disposable Git races/crashes, source-bound missing evidence, literal-safe whitespace, native proof drift, old/new helper flags and config restoration pass; Editor/API share results and guards. Verify startup silence, hidden/non-interactive children, no desktop focus/input takeover and honest unavailable surfaces. |

**Next action reminder:** before implementation, inspect existing God services and the current catalogue, select the owning source repository and applicable Technical/Unity/Code/Editor UI/Brick owners, then propose the smallest first milestone. Publish only after real implementation and source/UI/failure evidence; add catalogue metadata only under its real planned/released contract. Do not install this plan into games or claim these milestones already passed.
