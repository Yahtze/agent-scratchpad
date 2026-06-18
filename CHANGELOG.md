# Changelog

All notable changes to agent-scratchpad will be documented in this file.

## [0.3.0] - 2026-06-18

### Changed
- Expanded scratchpad role as primary memory point for branch context
- Added explicit "Always read" and "Always write" trigger lists
- Emphasized reading before writing — agents must learn existing context before acting
- Added rule to record *why* approaches were rejected, not just *that* they were

## [0.2.0] - 2026-06-18

### Changed
- Scratchpads are now per-branch: `scratchpad/<branch-name>.md`
- `scratchpad/` folder auto-created and added to `.gitignore`
- Sections redesigned: Design Decisions, Patches Tried, Architecture Notes, Context for Next Session
- Clarified relationship between scratchpads (journey) and README (destination)

## [0.1.0] - 2026-06-18

### Added
- Initial release
- Core SKILL.md with scratchpad workflow
- Template schema for scratchpad creation
- Example scratchpads for common scenarios
- Contributing guidelines
- Issue templates
