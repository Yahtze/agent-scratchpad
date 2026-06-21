---
name: agent-scratchpad
version: 0.9.0
description: >
  Per-branch persistent memory for agent sessions. Use this skill
  at the start of every session on a branch, before any other action.
  Also use when making design decisions, trying new approaches, hitting
  dead ends, or any time context should be preserved for future sessions.
---

# agent-scratchpad

A per-branch scratchpad that serves as the primary memory point for understanding the full context of a branch throughout its lifecycle. It is both a place to write and a place to learn — every agent session should read it first to understand what has happened, what has been tried, what decisions were made, and what remains. Without it, each new session starts cold and risks repeating failed approaches or missing critical context.

The scratchpad captures the evolving state of work: what the branch is trying to accomplish, which approaches were explored and why they were accepted or rejected, how the architecture is being shaped, and what open questions remain. It is a living document that grows with the branch, not a one-time dump.

## Hardening rules

**These rules prevent common failure modes. Follow them strictly.**

1. **INDEX.md is a pointer file only.** It contains metadata (Status, Overview one-liner, Goal one-liner, Scopes list) and nothing else. NEVER write content into INDEX.md.

2. **All content goes in the Active file.** The `Active:` line in INDEX.md points to the file where you write. On branch init, this defaults to `work.md` but can be named anything appropriate — the `Active:` line is what matters, not the filename.

3. **NEVER create new .md files unless the user explicitly runs `/scope`.** Do not create files like `auth.md`, `api-design.md`, `debugging.md` etc. on your own initiative. If you need to organize work, use sections in the Active file.

4. **Write to the Active file only.** Check the `Active:` line in INDEX.md. Write to that file. Do not write to INDEX.md or other files.

5. **One scratchpad per branch by default.** The default setup is INDEX.md + one content file (typically `work.md`). Additional files require explicit `/scope` command.

## When to use

### Always read the scratchpad when:

- Starting any work on a branch — even if you think you know the context
- Resuming work after a context switch or new session
- Encountering unexpected behavior — the scratchpad may explain why
- Before proposing a solution — check if it was already tried and rejected
- Onboarding to someone else's branch — the scratchpad is your briefing

### Always write to the scratchpad when:

- Making a design decision that affects the branch direction
- Trying or testing an approach (even if it fails — especially if it fails)
- Discovering non-obvious behavior, constraints, or gotchas
- Hitting a dead end and pivoting to a new approach
- Finding that existing documentation is wrong or incomplete
- User explicitly asks to write something to the scratchpad

## How it works

### 1. Locate or create the scratchpad

**Always do this first.** The scratchpad lives in a per-branch folder.

```
scratchpad/
└── <branch>/
    ├── INDEX.md          ← pointer file (metadata only)
    └── work.md           ← all content goes here
```

In a git repo, use the branch name as the folder name:

```bash
BRANCH=$(git branch --show-current)
```

Outside a git repo, ask the user for a scope name (e.g. "auth-refactor", "api-v2") and use that.

Then:
1. Create `scratchpad/<branch>/` directory if it does not exist
2. If `INDEX.md` does not exist, create it from `<skill-dir>/schema/index-template.md`
3. If `work.md` does not exist, create it from `<skill-dir>/schema/work-template.md`
4. Read `INDEX.md` — check the `Active:` line at the top
5. Read the file pointed to by `Active:` (usually `work.md`)
6. Add `scratchpad/` to `.gitignore` if not already present

**Note:** All template paths (`schema/...`) are relative to the SKILL.md file location. When installed globally at `~/.agent-scratchpad/`, use `~/.agent-scratchpad/schema/`.

### 2. Read the scratchpad

Before doing anything else on a branch, read the scratchpad. It tells you:

- What work has already been done
- What approaches were tried and why they failed (so you don't repeat them)
- What design decisions were made and their rationale
- What the current blockers or open questions are
- Where the important code lives

The scratchpad is the fastest way to get up to speed. Use it to avoid re-exploring paths that were already walked.

### 3. Write as you work

Update the scratchpad continuously as you work, not just at the end. Record decisions as they happen, log failed attempts immediately, and note new findings in real-time. A scratchpad that is only updated at session end will lose nuance and detail.

### 4. Structure

Three templates in `schema/`:

**INDEX.md** (`schema/index-template.md`) — pointer file, metadata only:

- **Active** — which file to read/write (default: `work.md`)
- **Status** — one word: planning, in-progress, blocked, complete
- **Overview** — one sentence max
- **Goal** — one sentence max
- **Scopes** — list of scoped scratchpads (only added via `/scope`)

**work.md** (`schema/work-template.md`) — default scratchpad, all content goes here:

- **Status** — current state of work
- **Key Decisions** — design decisions and rationale
- **Approaches Tried** — what was tested, what failed, what worked
- **Architecture Notes** — file locations, dependencies, gotchas
- **Work Log** — running log of what was done
- **Open Questions** — unresolved issues

**Scoped scratchpads** (`schema/scope-template.md`) — created only via `/scope`:

- Same structure as work.md, focused on a specific area

### 5. Explicit writes

If a user asks to write something specific to the scratchpad, do it — even if it doesn't fit the standard sections. Add a new section if needed.

## Slash commands

### `/scope` — Focus on a specific area within a branch

**This is the ONLY way to create new .md files.** Do not create files without explicit `/scope` command.

When work branches into multiple concerns on the same branch, use `/scope` to create a focused scratchpad.

1. Ask the user for the scope name
2. Create `scratchpad/<branch>/<scope-name>.md` from `schema/scope-template.md`
3. Update `INDEX.md`'s `Active:` line to point to the new file
4. Update `INDEX.md`'s `Overview:` to reflect the current focus
5. Add a stub entry in `INDEX.md`'s Scopes listing this scope

Example `INDEX.md` after running `/scope auth-refactor`:

```markdown
Active: auth-refactor.md

# Scratchpad: feat/dark-mode

## Status: in-progress

## Overview
Refactoring auth middleware for theme persistence.

## Goal
Add dark mode toggle with session-persisted preference.

## Scopes
- [auth-refactor.md](auth-refactor.md) — refactoring auth middleware to support theme persistence
```

### Concluding a scope

When work on a scoped scratchpad is complete:

1. Mark its status as `complete`
2. Update `INDEX.md`'s `Active:` line back to `INDEX.md`
3. Add a summary of the scope's outcome to `INDEX.md` under the relevant section

### `/todo` — Log future work items

When the agent suggests potential future work, bug fixes, or improvements that are out of scope for the current version, use `/todo` to add them to a shared backlog.

The TODO file lives at `scratchpad/TODO.md` — shared across all branches.

1. If `scratchpad/TODO.md` does not exist, create it from `schema/todo-template.md`
2. Add a new entry with enough detail to act on later (like a ticket)
3. Each entry should include: what, why, acceptance criteria, and any relevant context

Format for a new entry:

```markdown
### TODO-XXX: [Short title]

- **Added:** [date]
- **Added by:** [branch name]
- **Priority:** [low | medium | high]

[Description of the problem or opportunity. Why it matters. What should be done.]

**Acceptance criteria:**
- [ ] [What does "done" look like?]
- [ ] [Specific, testable conditions]
```

When a TODO item is completed:

1. Mark it with `[x]` checkboxes in the acceptance criteria
2. Add a `- **Completed:** [date]` line at the top of the entry
3. Optionally add a note about the solution or which branch/PR addressed it

Read `scratchpad/TODO.md` at the start of a session if it exists — it may contain work relevant to the current branch.

## Writing rules

- **Write to the Active file only** — check `Active:` line in INDEX.md
- **INDEX.md is pointer-only** — never write content into it
- **No file creation without `/scope`** — use sections in Active file instead
- Reference file paths and line numbers
- Keep entries concise — bullets over paragraphs
- Record *why* something was rejected, not just *that* it was
- Timestamp significant findings for long-running branches
- Never overwrite existing content unless explicitly asked
- Never delete a scratchpad without asking user

