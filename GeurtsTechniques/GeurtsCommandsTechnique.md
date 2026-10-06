<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Commands Technical Topic

**Version:** 0.1.0
**Unity target:** Unity 6.6 (6000.6.3f1)
**Status:** Draft normative technique
**Required package path:** `GeurtsTechniques/GeurtsCommandsTechnique.md`

`GeurtsTechniqueManifest.md` alone selects this technical topic, its version and reading scope. The Technical Technique retains the shared priorities.

## Runtime Console Integration

### Required Quantum Console Library and Optional Console Use

Quantum Console remains a required licensed library within the implementation scope defined by the Unity 6000.6.3f1 dependency baseline. Installing or enabling a runtime developer console is optional throughout setup and game development, including completed games. The library dependency does not require a console scene object or Diagnostics installation.

When a console is selected, use its `QFSW.QC` APIs, `[Command]`, `[CommandDescription]`, supported-platform controls and existing processor rather than a parallel command UI. Use the required EventSystem and SRP-compatible prefab/theme as applicable, and integrate its activate/deactivate events with the Input System. Validate the selected console in Play Mode and development builds; all-build access, classification, input ownership and permissions belong to the [Diagnostics Technique](GeurtsDiagnosticsTechnique.md#runtime-console-and-filters). Expose useful inspection, validation, tuning, recovery, performance, AI, and multiplayer diagnostics when safe, through the shared logging facade and supported commands. Projects without a console retain independent actionable status/health reporting.

### Accessibility

These requirements apply when the optional console is installed:

- Player and Developer tabs are freely switchable and are not an authentication boundary.
- The separate testing override is limited to Editor/designated internal builds and never bypasses host/server authority.
- Follow the Diagnostics Technique for all-build access, command classification, filters and safe output; the console is not an authentication boundary.

## Command Rules

### Full Names Only

Commands must use complete words. Do not use abbreviations.

Declare commands with Quantum Console's `[Command]` attribute and supply a useful description through the supported attribute API. Restrict supported platforms when a command is Editor- or development-only. Command parameters must be parseable, bounded, and validated before state changes.

Use:

```text
AI.GetState
Performance.ShowFPS
```

Do not use:

```text
AI.GS
Perf.FPS
```

### Naming Convention

- Use PascalCase.
- Prefix commands with a category.

Examples:

```text
AI.GetState
Performance.ToggleStats
Multiplayer.ShowNetworkStats
```

### Help Commands

Global help command:

```text
Help
```

Example output:

```text
Available Categories:
AI.Help
Performance.Help
Multiplayer.Help
```

Category-specific help command:

```text
AI.Help
```

Example output:

```text
AI Commands:
AI.GetState
AI.SetState
```

### Command Classification

Use God's `[ForgeCommand]` to explicitly classify Player or Developer commands and the independent `Cheat` flag alongside the real QC declaration. The Diagnostics Technique owns enforcement in help, suggestions and actual execution, including direct typing and nested expression rejection. Do not expose private data through a freely switchable Developer tab. Unclassified vendor commands need an explicit supported adapter; display filtering alone does not authorize execution.

### Cheat Commands

Commands that bypass rules or tune/test gameplay state must be flagged as `Cheat` and recheck gameplay-session and host/server permission immediately before mutation. Ordinary designed player actions are not automatically cheats. The game owns session boundaries, zone transitions and saved cheat provenance; the Diagnostics Technique owns their shared integration contract.
