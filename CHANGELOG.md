# Changelog

All notable changes to agent-scratchpad will be documented in this file.

## [0.5.0] - 2026-06-18

### Changed
- Scratchpads now use per-branch folders: `scratchpad/<branch>/INDEX.md`
- Active scope tracked via `Active:` line at top of INDEX.md — no separate pointer file
- `/scope` creates scoped scratchpad inside branch folder, updates INDEX.md
- Scope conclusion workflow: mark complete, update `Active:` back to INDEX.md, add summary
- Updated examples to show folder structure with scopes

## [0.4.0] - 2026-06-18

### Changed
- Replaced "Context for Next Session" with "Open Questions" — captures unresolved issues needing human input
- Renamed "Patches Tried" to "Approaches Tried" — more universal, covers features not just fixes
- Added `/scope` slash command for creating fresh scratchpads within a branch
- Expanded frontmatter description to be more explicit about when to trigger
- Added non-git fallback: prompt user for scope name instead of using branch
- Simplified bash block: removed fragile `echo "CREATE_NEW"` pattern, use prose instead

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
