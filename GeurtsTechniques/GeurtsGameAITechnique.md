<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Game AI Technical Topic

**Version:** 0.1.0
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsGameAITechnique.md`

`GeurtsTechniqueManifest.md` alone selects this technical topic, its version and reading scope. The Technical Technique retains the shared priorities.

## AI Integration Technique

- **Modular AI Components:** Implement behaviours as separate scripts.
- **Data-Driven Design:** Use ScriptableObjects for AI configuration.
- **Validation:** Use Odin Inspector attributes and validation for serialized inputs, required references, safe ranges, and authoring constraints wherever the rule can be expressed clearly.
- **Explainability:** Add tooltips and comments for all AI-related fields.
- **Performance:** Optimise AI decision-making for FPS.

AI decision logic should be inspectable, testable, and separated from presentation or unrelated gameplay code where practical.
