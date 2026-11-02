<!-- GEURTS-AUDIENCE: HUMAN-ONLY -->
# Reading-efficiency upgrade evidence

**Version:** 0.67.0
**Status:** Non-normative source evidence with a verified published consumer cohort; no consumer-install claim.

Baseline source: 436239b82e99c3beca2ed0aeaab0b3c6b278b863, documentation 0.65.0. Implementation uses a separate Windows checkout, ForgeDevelopment profile/mode. The original workspace is untouched. Current source has no tracked AGENTS.md; AI_READ_FIRST is its first entry. The older workspace AGENTS/AI_READ_FIRST/manifest were read before selecting this separate authoritative package.

## Architecture and obligations

One schema-1.0.0 JSON holds the mechanically transferred 87 original file path/version/role records and 34 exact section document/ID/heading/condition records, plus new package members. It is data owned by the manifest. Registry/package version and changed file versions advance together; unchanged schemas, historical records, pinned brick identities and frozen templates remain unchanged.

| Obligation | Final owner and guaranteed trigger |
|---|---|
| Entry, source/revision identity, freshness, no automatic acquisition, pre-edit lock | AI_READ_FIRST, always fully read before work. |
| SemVer, all affected release metadata, no equal-version changed publication | AI_READ_FIRST, always read; CONTRIBUTING required for source delivery. |
| Profiles and dependencies, primary game target | Manifest sections 1.2/1.3, always fully read; StandardsOnly owner first when explicitly selected. |
| Every task-to-owner trigger, subject ownership, ordering and conflicts | Manifest sections 1/2; all task rows, numbered read sequence and conflict bullets retained verbatim from baseline. |
| Audience filtering and optional history | Manifest 1.1, always read; same reader audience implementation and source-line map. IncludeHuman never enables Forge-only content. |
| Section conditions, shared/core, preamble and unknown new rules | Manifest 1.1/4 plus only selected documents' registry records via Preview/plain-file lookup. Every unmapped section remains required; uncertainty forces a full selected read. |
| Exact payloads and protected files | Manifest 1.1/3.1, always read; reader rejects partial selection for entries, installer techniques and templates. Data/code cannot be partially selected. |
| Installation consent, exact targets and project-design boundaries | Entry permission limits always read; Companion/contract and Brick owner selected before installed lifecycle work. Source publication grants no installation. |
| Complete inventory and registry failures | Shared parser used by reader and validator; exact Git inventory gate, same-copy versions, safe paths, duplicates and protected maps checked. No fallback to another checkout or legacy table. |
| Publication/version-source gates | CONTRIBUTING for source changes; existing committed publication check and required Windows CI retained. |

The removed Markdown storage markers are replaced by one explicit GEURTS-REGISTRY declaration. Existing section headings/anchors remain. Literal assertions referring to tables now inspect the same records through the shared parser: exact inventory, frozen document versions, Catalogue role and controlled brick usage coverage remain enforced. New-format fixtures retain the old section-selection, heading/fence, hidden-boundary, source-line and payload tests. Added cases are necessary because malformed registry data can otherwise hide required rules or escape package boundaries; cheaper static assertions do not exercise those failures.

## Supported-consumer inspection and publication block

Exact published God 0.39.4 source b7a001234dd5b149cc767dd1ab305df4c6e876d7:

- Editor/Commandments/DocumentationContractReader.cs LoadAndValidate accepts a safe later validationEntries list and matching later packageVersion under unchanged schema 3.0.0. However ValidateManifestRegistry requires GEURTS-PACKAGE-FILES markers, parses Markdown rows, and compares them with every archive file. Removing them fails before mutation.
- Editor/CommandmentsIntegration.cs InspectLocalFoundationAt calls LoadAndValidate, so readiness also depends on that old inventory. Foundation's setup contract compares packageVersion with the same-copy manifest; the candidate synchronizes it.
- Editor/BuildForgeStatus.cs WatchedPaths parses manifest Markdown rows for invalidation; it needs the registry and its listed paths instead.
- Editor/Commandments/GitVersionMetadata.cs only parses the manifest Version header, which is retained. DocumentationPackageConstants.cs retains the exact documentation folder, three native routes, confirmation and schema. Those boundaries are unchanged here.

Additional exact published Angels 0.9.7 source 67f76582819b48ea1091582d9e7ff2a4fdd93cb1:

- Editor/AngelsCodexProjectContext.cs Capture requires one Markdown registry, then matches every selected document version against its table row before reading the primary GDD. It must instead validate the same-copy JSON, select only relevant file/section records, fingerprint the registry as part of context identity, retain full entry/manifest and applicable rules, and preserve existing context bounds/consent. No project GDD was read during this source audit.
- Editor/CodexGuideInstaller.cs Load requires the Agent Technique table version before extracting its pinned template. Editor/PortableCodexGuide.cs Render can invoke that legacy loader while assessing existing root guides, so portable guide use inherits the dependency too. Preserve every frozen payload byte and current target/confirmation rules.
- Editor/GitIgnoreTemplateReader.cs Extract requires the inventory marker block and matching technique version before checking its exact payload hash/line count.
- Editor/BuildForgeGitAttributes.cs ReadPayload requires the exact technique/version table row alongside its existing hash/marker checks.
- Editor/AngelsAssetMoves.cs and AngelsSetupProvider.cs fingerprint fixed guidance paths including the manifest/definition; compatible owner changes must include the indispensable registry wherever source identity/invalidations depend on it. The remaining package-scoped source search and inspected implementations found no independent content updater to migrate.

Required second owner: Geurtsy/com.geurts.gameforge.angels. Publish registry-aware context, guide, Git Ignore and Git Attributes readers with their existing payload/consent/regular-path/version checks intact, plus bounded old/new-format and malformed-new-format regressions. Retain support for currently published old content during the coordinated transition without silently falling back after malformed new data. Verify the affected no-code/API workflows through that owner's acceptance gates. No Angels source is edited here.

Required owner: Geurtsy/com.geurts.gameforge.god. Publish a compatible higher God version supporting an explicitly selected JSON registry format for archive equality and readiness, update status watching, reject malformed new data without legacy fallback, and validate both currently supported old content and the new candidate through the owner's gates. After both God and Angels publish compatible releases and their combined acceptance is verified, pin that compatible cohort in this repository's Catalogue, refresh main/version collisions, rerun required candidate gates, merge this PR and create its new immutable content release. No God or Angels source is edited by this repository-only task. Existing installations still need their explicit package/content Update actions; no fleet compatibility is implied.

Passive adapter 0.16.0 at 705d00078f8b5bad797dd297f99296fd59476451 was inspected in Editor/DocumentationIntegration.cs: its GodForwarder resolves God public members and forwards requests, with no manifest parser. BigBang 0.8.9 at eb291ef5e6d2a1e9b16104d04f8b97f6dac9cc53 was inspected in Editor/FoundationBridge.cs: it resolves God by reflection and calls InspectLocalFoundation/UpdateCommandments; it inherits the God failure and has no independent inventory parser. Neither needs a separate content engine or source change for this format; compatible God support remains required. The initial guessed BigBang repository URL was unavailable; inspection used the Catalogue exact repository instead. Immutable StandardsOnlyInstaller 1.0.0 retains its embedded 0.61.1 source/tools and snapshot contract; it is not updated or a consumer of this new feed format. Native routes contain only entry pointers; their source bytes remain unchanged.

## Prior work and release identity

PR #109 remains intact and open. Its reviewed diff informs shorter repeated entry explanations; this candidate independently extracts the larger inventory/section overhead, preserving its useful simplification intent without merging its mixed 0.65.1 metadata. PR #110 and every other draft remain untouched. Published releases/tags topped at 0.65.0; another open change uses 0.66.0 and an unrelated release draft reserves 0.62.16. This candidate selects unused 0.67.0 for the pre-1.0 supported-format change; tool reader/fixture interfaces advance to 2.0.0. No release is reserved before a committed candidate.

## Measurement method and practical limits

Counts use Unicode characters after CRLF/CR normalization to LF, including final newlines; not bytes or estimated tokens. Baseline Git blobs are LF, and both reader outputs use the same normalization. The JSON companion records six explicit selection fixtures with document order/sections, returned content, targeted metadata and complete preview sizes. Project-specific GDD and pinned external owner guide bytes are not read or measured; their identical conditional obligations remain external and must be added for an actual project task. The figures therefore cover the package-owned required context for the named fixtures, not a universal cost for arbitrary project work. Linked conditional owners are represented by explicitly selected fixture lists; links do not automatically require every linked document.

Entry/manifest are fully charged to every task. Candidate per-document metadata projections are also charged; the entire supporting inventory is not compulsory. One Preview and one content read per selected Markdown is the measured conservative workflow (JSON owners use plain full reads); previews internally validate the complete local registry but print only selected-document data. Full-document callers can still use one call; batching independent previews is allowed. No cache, classifier, second routing engine, network or new dependency is added. Registry parsing is repeated locally per call; metadata overhead and output growth are reported separately, not hidden as free reading.

## Measured results

| Mandatory entry file | Baseline | Candidate |
|---|---:|---:|
| AI_READ_FIRST.md | 9,483 | 6,395 |
| GeurtsTechniqueManifest.md | 39,065 | 22,243 |
| Combined | 48,548 | 28,638 |

Reduction: **41.01%**. The 50% design target was missed. The candidate retains the full 9,413-character subject/applicability table, the numbered read sequence, conflict bullets and all 34 exact conditional records rather than trading obligation certainty for the metric. Existing identity/consent wording consumed by negative regressions is also retained. More reduction requires a separately reviewed editorial pass on routing/identity prose; it is not concealed by moving mandatory policy into data. The inventory and section map are no longer compulsory full-file reads.

| Selection fixture | Baseline entry + content | Candidate + targeted metadata | Candidate + full previews | Candidate preview output | Preview/content calls |
|---|---:|---:|---:|---:|---:|
| ordinary_game_scripting | 217,991 | 203,456 | 225,787 | 27,663 | 17 |
| brick_integration_audio | 207,970 | 192,625 | 212,373 | 24,270 | 17 |
| documentation_maintenance | 150,685 | 134,955 | 151,598 | 19,733 | 10 |
| standards_only_script | 169,205 | 151,210 | 164,664 | 15,369 | 12 |
| mixed_forge_maintenance | 209,465 | 194,193 | 217,103 | 26,401 | 15 |
| historical_reference | 68,158 | 48,452 | 51,112 | 2,864 | 2 |

Baseline entry + content is the package-owned selection cost without optional previews (the conditions were already in the fully read manifest). Candidate + targeted metadata adds each selected Markdown's exact file/version/role/conditional records; candidate + full previews instead charges all actual preview output, including heading indexes/counts/conditions and JSON formatting. Do not add both metadata and preview columns together. These are package-context figures with the external guidance/GDD limitation above. The full JSON preserves baseline preview output too. The candidate call count includes one metadata preview plus one actual read per Markdown and one full read per JSON, excluding the two always-read entry files; a direct full read can omit its preview. No tokens or latency measurements are claimed. The parser avoids per-key JSON deserialization for ordinary unescaped keys and whole-tail string copies; escaped keys still decode before duplicate checks, covered by a dedicated alias regression. No persistent cache is introduced.

Mechanical equivalence checks confirmed all baseline inventory paths/roles, all 34 section records, the complete subject table/conflicts and numbered read sequence. Selected owner order/section arrays match across all six fixtures. Final candidate totals include the current CONTRIBUTING, Usage Guide and compatibility guidance, along with JSON completeness data. Original owner order, routing conditions and section selections remain unchanged. Profile wording was shortened with the same explicit triggers, exemptions, modes and permission boundaries, as mapped above.

## Validation and delivery boundaries

- PowerShell 7 static documentation validation: 112 checks passed on the candidate code before final evidence assembly.
- Focused audience/registry regression suite: 148 passed, zero failed, including escaped duplicate property aliases. No skipped check is counted as passed.
- Full Windows PowerShell 5.1/static, PowerShell 7 automation and committed publication gates remain required on the completed committed candidate. Their exact results are retained in the PR checks and final delivery report, rather than predicting success here.
- Initial documentation-only stage did not run Unity. The coordinated follow-up uses the published owner acceptance linked below; it does not claim player/native or supported-stock library acceptance.
- The initial owner publication hold is resolved by the verified cohort below. Final content main/release publication still requires the completed candidate checks and verified immutable release. No installed-consumer claim follows from source publication.

## Coordinated owner compatibility completion

The initial owner publication blockers above describe the original documentation-only stage. The follow-up publishes God 0.42.0 and Angels 0.10.0, whose immutable sources are pinned in the Catalogue and whose source-matched Unity evidence is linked in the Usage Guide. God owns the shared validated registry reader; Angels consumes it without duplicating task routing. Old/new inventories, malformed-new refusal, exact archive acquisition, installer preservation and registry-dependent context invalidation are covered by owner acceptance.

Stock Quantum Console 2.6.7 produced the same six compiler diagnostics on Unity 6000.6.3f1 and 6000.6.7f1. Successful owner acceptance uses only the private disposable QC-2.6.7-private-Unity6000.6-compat03 profile. No vendor bytes enter a source release, and supported-stock or live-project adoption is not claimed. The original Unity failure logs, corrected fixture compilation and successful final XML/log hashes remain in owner evidence. Final documentation gates must pass for this completed cohort before main/release publication.
