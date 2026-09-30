<!-- GEURTS-AUDIENCE: AI-READ -->
# Geurts Git Attributes Technique

**Version:** 1.0.0
**Status:** Approved normative technique
**Required package path:** `GeurtsTechniques/GeurtsGitAttributesTechnique.md`
**Target path:** `<ProjectRoot>/.gitattributes`

## Purpose and authority

This technique owns the project-root FMOD line-ending template and its explicit Build Forge installation contract. The manifest selects it when provisioning or validating these attributes. The Technical Technique continues to own Windows CRLF authoring for first-party files; these narrow vendor rules retain FMOD's required LF endings. They do not select another build platform or add an FMOD dependency to God.

The two rules follow [FMOD's source-control guidance](https://fmod.com/docs/2.03/unity/user-guide.html#line-endings) for its default `Assets/Plugins/FMOD` installation. Relocated integrations need manually reviewed project-specific patterns. Git attributes affect future Git conversion; installing this file does not rewrite vendor files, renormalize tracked content or change the Git index.

## Template contract

Read the Markdown as strict UTF-8, permitting a leading BOM on the document only. Require exactly one begin marker, one end marker, and the immediately enclosed `gitattributes` fence below. The marked region ends the document, apart from its optional final newline. Copy only the enclosed payload. Normalize its newlines to LF for validation, with exactly one terminal LF. Its SHA-256 is `d051cf466ba5bffc055905a79ae76f93a60e27a3dbb8fcd16b968bb80c3e3d2d`, and it contains exactly two lines. Marker version, declared technique version and manifest registry version must all equal `1.0.0`. A missing, malformed, modified or unsupported template must preserve the target and explain that Documentation needs updating; there is no bundled fallback payload.

## Build Forge installation and verification

God 0.20.0 adds **Install FMOD .gitattributes** as the sixth independently actionable Build Forge step. Opening the window, polling or selecting **Recheck** only verifies state. Installation requires an explicit step action and the installed documentation template; Documentation Update never installs project attributes.

- Create a missing project-root `.gitattributes` from the validated payload as UTF-8 without BOM with CRLF newlines.
- For an existing valid UTF-8 file, preserve every existing byte, including BOM, comments, other rules and newline convention. Append the complete required rule pair after its contents, adding a separating newline only when needed. Prefer the existing CRLF or LF convention for the addition. An empty file uses CRLF.
- A file is complete when its final two nonblank, noncomment rules match the approved pair in order, allowing outer whitespace. Preserve its bytes and timestamp without rewriting. This conservative suffix check prevents later root rules from overriding the approved pair. An earlier pair may be repeated when necessary to establish this final precedence; subsequent runs append nothing.
- Fail without writing on invalid text, a directory occupying the target, read-only files, linked roots/ancestors/targets, or a changed target detected before appending. Use exclusive writer access during the append and recheck the result before reporting success.
- Never remove or reorder existing rules, execute documentation scripts, stage files, change Git configuration, alter scenes/settings or install FMOD. A failed write may retain an incomplete addition; report the failure and let the user review/retry it.

Completion is derived from current files and a valid documentation template. Both Forge windows withdraw stale completion while busy and observe the exact target/template paths. This is verification of the required root rules, not a complete Git attribute resolver: nested `.gitattributes`, `.git/info/attributes` and relocated FMOD content require separate manual review. [Git documents attribute precedence](https://git-scm.com/docs/gitattributes).

## Approved payload

<!-- GEURTS-GITATTRIBUTES-BEGIN version="1.0.0" target=".gitattributes" sha256="d051cf466ba5bffc055905a79ae76f93a60e27a3dbb8fcd16b968bb80c3e3d2d" -->
```gitattributes
Assets/Plugins/FMOD/**/*.bundle text eol=lf
Assets/Plugins/FMOD/**/Info.plist text eol=lf
```
<!-- GEURTS-GITATTRIBUTES-END -->
