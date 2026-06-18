# Contributing to agent-scratchpad

Thanks for your interest in contributing!

## How to contribute

### Reporting issues

Use the issue templates to report bugs or suggest improvements.

### Suggesting changes to SKILL.md

The core skill file (`SKILL.md`) is the product. Changes should:
- Improve clarity for agent consumption
- Add missing workflow patterns
- Fix incorrect or ambiguous instructions
- Not add unnecessary complexity

### Adding examples

Example scratchpads in `examples/scratchpads/` help demonstrate the skill. Good examples:
- Show realistic usage patterns
- Cover different scenarios (debugging, planning, implementation)
- Are concise but complete enough to illustrate the format

### Template changes

Changes to `schema/scratchpad-template.md` should be backward-compatible. The template is what agents copy — changing it affects all new scratchpads.

## Development

1. Fork the repo
2. Make your changes
3. Test with your agent of choice
4. Submit a PR with a clear description

## Style

- Keep SKILL.md scannable — agents parse quickly
- Use bullets over paragraphs
- Be explicit about when/why to use each feature
