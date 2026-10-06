<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Audio Technical Topic

**Version:** 0.1.0
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsAudioTechnique.md`

`GeurtsTechniqueManifest.md` alone selects this technical topic, its version and reading scope. The Technical Technique retains the shared priorities.

## Game Audio and Sound Design

**FMOD is completely optional** for games made with Geurts Game Forge. It is not a required feature, standard sound-design tool or prerequisite for using Forge. Projects may use Unity's built-in audio for sound effects, music and ambience without installing FMOD. Add an FMOD integration only when the project explicitly opts in; do not install it automatically or treat its absence as a general Forge setup blocker.

**Future updates to the Audio brick must support Unity's built-in audio and use it by default.** FMOD must remain an optional, explicitly selected backend or separate integration. The default Audio implementation must compile, initialize and provide playback without FMOD installed; FMOD-specific assemblies, assets, bank preparation and configuration must be isolated to the opted-in integration.

Use the current released Audio package and immutable source selected by the catalogue. Its supported default is Unity clip playback; FMOD is a separately opted-in Audio integration with separate event/bank assignments. Verify the actual installed version and supported backend capabilities before reuse. Preserve audio assets and references, and validate affected playback in the Windows Editor and player. Existing-installation migration belongs to the current Audio package's migration guide and is read only for a requested migration.

FMOD-specific source-control guidance applies only when an FMOD integration is chosen. The manifest-selected Git Attributes Technique supplies the two vendor LF exceptions, installed only by an explicit action while preserving existing attributes. The comprehensive Git Ignore template may retain passive FMOD exclusions for compatibility; those patterns do not require installing FMOD. First-party CRLF authoring remains unchanged. Keep opted-in FMOD dependencies within their audio integration; they must not become dependencies of God, unrelated bricks, Editor-only documentation tooling or this documentation repository.
