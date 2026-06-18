# agent-scratchpad

A structured scratchpad skill for coding agents. Gives agents a persistent workspace to think, plan, and track progress across sessions.

## Quick Start

### Installation

```bash
# Copy SKILL.md to your agent's skills directory
cp SKILL.md ~/.pi/agent/skills/agent-scratchpad/SKILL.md
```

### Usage

Once installed, the agent will use the scratchpad automatically when:
- Working on multi-step tasks
- Debugging complex issues
- Planning implementations
- Tracking progress across sessions

### Harness Setup

**Pi:**
```bash
mkdir -p ~/.pi/agent/skills/agent-scratchpad
cp SKILL.md ~/.pi/agent/skills/agent-scratchpad/
```

**Claude Code / Cursor / Windsurf:**
Add to your project's agent instructions or `.cursorrules`:
```
Use the agent-scratchpad skill for multi-step tasks. See SKILL.md for usage.
```

## What It Does

- Creates a `scratchpad.md` file in your working directory
- Provides structured sections for thinking, planning, and tracking
- Persists across sessions so agents can resume where they left off
- Auto-cleans when work is complete

## License

MIT
