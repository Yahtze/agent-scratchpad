# agent-scratchpad

Per-branch persistent memory for coding agents. Gives agents a structured place to write design decisions, approaches tried, architecture notes, and open questions — then read it all back on the next session.

## What it does

Creates a per-branch scratchpad that serves as the primary memory point for understanding the full context of a branch throughout its lifecycle.

```
scratchpad/
└── <branch>/
    ├── INDEX.md          ← branch overview, always read first
    ├── auth-refactor.md  ← scoped scratchpad
    └── api-design.md     ← another scope
```

- **Read on session start** — agents learn what's been done, what failed, what decisions were made
- **Write as you work** — decisions, failed approaches, architecture notes captured in real-time
- **Scoped scratchpads** — focus on specific areas within a branch via `/scope`
- **Survives context limits** — persists between sessions and agent restarts

## How it works

1. Agent checks for `scratchpad/<branch>/INDEX.md`
2. If it exists, reads it — learns the branch context
3. If `Active:` points to a scoped file, reads that too
4. Writes to the active scratchpad as work progresses
5. On `/scope`, creates a focused scratchpad and updates INDEX.md

## File structure

| File | Purpose |
|---|---|
| `SKILL.md` | The skill file — install this |
| `schema/index-template.md` | Template for INDEX.md (branch overview) |
| `schema/scope-template.md` | Template for scoped scratchpads |
| `examples/scratchpads/` | Example scratchpads showing real usage |

## Slash commands

**`/scope`** — Create a focused scratchpad within a branch. Useful when work branches into multiple concerns. The INDEX.md tracks which scope is active.

## License

MIT
