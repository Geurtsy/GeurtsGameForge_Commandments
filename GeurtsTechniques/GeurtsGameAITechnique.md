<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Game AI Technical Topic

**Version:** 0.2.0
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsGameAITechnique.md`

## AI Integration Technique

- **Modular AI Components:** Implement behaviours as separate scripts.
- **Data-Driven Design:** Use ScriptableObjects for AI configuration.
- **Validation:** Use Odin Inspector attributes and validation for serialized inputs, required references, safe ranges, and authoring constraints wherever the rule can be expressed clearly.
- **Explainability:** Add tooltips and comments for all AI-related fields.
- **Performance:** Optimise AI decision-making for FPS.

AI decision logic should be inspectable, testable, and separated from presentation or unrelated gameplay code where practical.

## Repeatable performance acceptance

Before releasing affected game-agent decision behavior, measure a repeatable representative workload in the intended Windows player/backend on identified hardware. Record the build, agent count, decision frequency, scene/workload, seed or repeatable inputs, warm-up, measurement duration and repeated runs. Include expected peak load and meaningful failure/stress cases; profile the actual decision/update work and allocations instead of relying on an overall FPS impression.

Choose CPU-time, allocation and frame-stability budgets from project requirements and a measured baseline; do not invent universal FPS or agent-count limits. Compare the same workload before and after the change, reporting typical and worst/tail behavior, sample counts and relevant variation. Verify correct decisions, bounded work and stable cleanup alongside performance. A target-budget breach blocks the affected release until resolved or explicitly revised by the project owner with evidence. Editor-only measurements remain labelled; missing player/hardware coverage is unverified. The requirement creates no mandatory runtime AI tooling, extra Diagnostics metrics or project design facts.
