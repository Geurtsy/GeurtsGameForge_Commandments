<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Documentation Maintenance Technique

**Version:** 1.0.1
**Audience:** AI agents only
**Status:** Normative maintenance requirement
**Required package path:** `GeurtsTechniques/GeurtsDocumentationMaintenanceTechnique.md`

## Scope and authority

Every approved Game Forge change requires a documentation impact check across all affected Game Forge repositories, including BigBang, God, every brick, tools, integrations and this documentation source. This scope does not include arbitrary unrelated repositories owned by the user. Approval to implement a change includes its necessary documentation maintenance within the authorized repositories; it does not authorize unrelated changes, project installation or publication contrary to the user's instructions.

The manifest alone selects documents, versions, reading order and subject owners. This technique owns documentation design and maintenance, not Unity runtime architecture, technical trade-offs, installation consent or project design. Apply it during planning, editing, review and delivery. A proposal is not an approved change or an applied edit.

## AI audience and efficiency

Documentation is exclusively for AI agents. AI efficiency is the first documentation-design priority: minimize required context, ambiguity, repeated reads and tool work while preserving every necessary constraint. Write concise literal instructions with explicit triggers, inputs, outputs, ownership and failure behavior. Keep one authoritative rule and link its consumers to it. Keep the full normative rule in its manifest-selected subject owner; consumer pointers name that owner, link directly to the applicable section and state when to apply it. Verify the target contains the complete rule; do not replace it with a circular or vague pointer. Prefer a small task-to-owner index and manifest-controlled sections over duplicate introductions, walkthroughs or current-version lists. Do not add human quick-starts or secondary-human audience requirements.

Efficiency never removes exact paths, dependency requirements, consent, preservation, safety, lifecycle or evidence boundaries. Retain concise entry/applicability instructions and permission boundaries, exact machine-readable contracts, self-contained templates and executable installation steps. Keep payloads intact and historical records unchanged; do not hide required rules behind optional history. Technical runtime priorities and their multiplayer override remain owned by the Technical Technique and are unchanged by this documentation priority. Product UI still serves its users; AI-only documentation does not remove no-code usability, accessibility or meaningful in-product Help.

Game Forge integration is the primary supported workflow. StandardsOnly and standalone installation are secondary, explicitly selected routes. Retain their documented dependency exemptions and limits without duplicating or weakening the primary workflow.

## Impact check and synchronized edits

1. Identify the approved behavior change, owning source revision and affected repositories. Map affected authoritative rules, public APIs, dependency declarations, usage guides, examples, installation instructions, entry routes and references. Inspect actual evidence; a search hit or absent match alone is not an impact conclusion.
2. Keep generic Game Forge rules in `Geurtsy/GeurtsGameForge_Commandments`. Keep implementation-specific APIs, recipes, release evidence and commands in their owning repository. Project-specific facts remain project-owned; this check grants no access to `Docs/GameDesign/`.
3. Edit documents only where documented behavior is affected. Update affected rules, examples, installation instructions and references together. For no impact, record the checked scope and reason; do not churn unrelated files or rewrite historical records.
4. For every changed brick public behavior, synchronize its AI usage contract: purpose/selection; exact identity, source, version and availability; prerequisites/tools; supported Editor/API/operation entry points; a minimal meaningful verified recipe; lifecycle/settings/dependencies; limits; and success/failure verification. Maintain the central [brick usage index](GeurtsBrickUsageGuide.md), Catalogue and owning guide links without creating competing authorities. Label declared requirements, source-verified implementation, tested behavior and unknown evidence separately. Planned bricks/features remain unavailable, with no invented API, action, install source or example.
5. Apply the entry's version rules to each affected release. Synchronize changed technique versions, package metadata, manifests, catalogues and changelogs. Preserve unchanged schemas, frozen payloads, immutable installer artifacts and published brick pins. Change a contract/schema only with verified compatible consumers and the owning coordinated release.
6. Validate references, declarations, ownership, dependencies and affected workflows. Review affected prose for contradictions and stale instructions, including examples and secondary routes. Use bounded negative regressions for material contract risks. A passing validator is evidence of its implemented checks, not proof that every semantic contradiction is absent. Documentation checks do not establish Unity/API/native compatibility.
7. Report actual edits, source revisions, versions, checks and limitations. List each cross-repository dependency as verified updated, unaffected, or outstanding with the exact owner/action. Verify every claimed edit in its owning repository. Never claim an inaccessible or unedited repository was updated or present an approved requirement or proposal as implemented without evidence. Follow each owner's delivery process and the current user's publication boundary.

## Completion evidence

Use one concise record: changed behavior; repositories/documents checked and edited; versions/references synchronized; actual validation and coverage; remaining owner work; publication and consumer-adoption state. If another owner is inaccessible or implementation is out of scope, finish independent authorized edits and identify the unresolved dependency. Do not silently weaken the requirement or invent completion.
