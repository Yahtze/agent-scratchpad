# agent-scratchpad

Per-branch persistent memory for coding agents. Gives agents a structured place to write design decisions, approaches tried, architecture notes, and open questions — then read it all back on the next session.

## What it does

Creates a per-branch scratchpad that serves as the primary memory point for understanding the full context of a branch throughout its lifecycle.

```
scratchpad/
├── TODO.md              ← shared backlog across all branches
└── <branch>/
    ├── INDEX.md          ← branch overview, always read first
    ├── auth-refactor.md  ← scoped scratchpad
    └── api-design.md     ← another scope
```

- **Read on session start** — agents learn what's been done, what failed, what decisions were made
- **Write as you work** — decisions, failed approaches, architecture notes captured in real-time
- **Scoped scratchpads** — focus on specific areas within a branch via `/scope`
- **Survives context limits** — persists between sessions and agent restarts

## Install

### Quick install (any harness)

Uses the [skills](https://github.com/vercel-labs/skills) CLI — works with Pi, Claude Code, Codex, Cursor, and 50+ other agents:

```bash
npx skills@latest add Yahtze/agent-scratchpad
```

Pick the skills you want and which coding agents to install them on.

### Bootstrap

After installing, run the setup skill to add the rules to AGENTS.md:

```
/setup-agent-scratchpad
```

This adds the rules that tell agents to automatically read/write the scratchpad at session start.

### Per-repo (any harness)

Install into a single repository:

```bash
bash <(curl -s https://raw.githubusercontent.com/Yahtze/agent-scratchpad/main/install.sh)
```

See [SETUP.md](SETUP.md) for manual setup and LLM-based setup instructions.

## How it works

1. Agent checks for `scratchpad/<branch>/INDEX.md`
2. If it exists, reads it — learns the branch context
3. If `Active:` points to a scoped file, reads that too
4. Writes to the active scratchpad as work progresses
5. On `/scope`, creates a focused scratchpad and updates INDEX.md

## File structure

| File | Purpose |
|---|---|
| `SKILL.md` | The skill file |
| `skills/setup-agent-scratchpad/` | Bootstrap skill — adds AGENTS.md rules |
| `install.sh` | Per-repo install script (any harness) |
| `SETUP.md` | Setup instructions for LLMs and manual install |
| `schema/index-template.md` | Template for INDEX.md (pointer file) |
| `schema/work-template.md` | Template for default scratchpad (content lives here) |
| `schema/scope-template.md` | Template for scoped scratchpads |
| `schema/todo-template.md` | Template for shared TODO backlog |
| `examples/scratchpads/` | Example scratchpads showing real usage |

## Slash commands

**`/scope`** — Create a focused scratchpad within a branch. Useful when work branches into multiple concerns. The INDEX.md tracks which scope is active.

**`/todo`** — Add a future work item to the shared backlog (`scratchpad/TODO.md`). Useful for logging bugs, improvements, or ideas that come up during a session but are out of scope for the current version.

## License

MIT
