---
name: agent-scratchpad
version: 0.6.0
description: >
  Per-branch persistent memory for agent sessions. Use this skill
  at the start of every session on a branch, before any other action.
  Also use when making design decisions, trying new approaches, hitting
  dead ends, or any time context should be preserved for future sessions.
---

# agent-scratchpad

A per-branch scratchpad that serves as the primary memory point for understanding the full context of a branch throughout its lifecycle. It is both a place to write and a place to learn — every agent session should read it first to understand what has happened, what has been tried, what decisions were made, and what remains. Without it, each new session starts cold and risks repeating failed approaches or missing critical context.

The scratchpad captures the evolving state of work: what the branch is trying to accomplish, which approaches were explored and why they were accepted or rejected, how the architecture is being shaped, and what open questions remain. It is a living document that grows with the branch, not a one-time dump.

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
    ├── INDEX.md          ← always read this first
    ├── <scope-a>.md      ← scoped scratchpads
    └── <scope-b>.md
```

In a git repo, use the branch name as the folder name:

```bash
BRANCH=$(git branch --show-current)
```

Outside a git repo, ask the user for a scope name (e.g. "auth-refactor", "api-v2") and use that.

Then:
1. Create `scratchpad/<branch>/` directory if it does not exist
2. If `INDEX.md` does not exist, create it from `schema/index-template.md`
3. Read `INDEX.md` — check the `Active:` line at the top
4. If `Active:` points to a scoped file, read that file too
5. Add `scratchpad/` to `.gitignore` if not already present

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

Two templates in `schema/`:

**INDEX.md** (`schema/index-template.md`) — the branch overview:

- **Status** — current state of work on this branch
- **Overview** — high-level summary of the branch: what, why, current state. Updated on scope changes.
- **Goal** — what this branch is trying to accomplish
- **Scopes** — list of scoped scratchpads with one-line descriptions
- **Key Decisions** — branch-level design decisions
- **Architecture Notes** — branch-level architecture, key file locations
- **Open Questions** — branch-level unresolved issues

**Scoped scratchpads** (`schema/scope-template.md`) — focused on a specific area:

- **Status** — current state of this scope
- **Goal** — what this scope is trying to accomplish
- **Design Decisions** — choices made within this scope
- **Approaches Tried** — approaches tested, outcomes, reasons for rejection
- **Architecture Notes** — how this scope fits into the codebase
- **Open Questions** — unresolved issues within this scope

### 5. Explicit writes

If a user asks to write something specific to the scratchpad, do it — even if it doesn't fit the standard sections. Add a new section if needed.

## Slash commands

### `/scope` — Focus on a specific area within a branch

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
Adding dark mode to the app. Currently refactoring auth middleware to support theme persistence in session tokens.

## Goal
Add dark mode toggle...

## Scopes
- [auth-refactor.md](auth-refactor.md) — refactoring auth middleware to support theme persistence
```

### Concluding a scope

When work on a scoped scratchpad is complete:

1. Mark its status as `complete`
2. Update `INDEX.md`'s `Active:` line back to `INDEX.md`
3. Add a summary of the scope's outcome to `INDEX.md` under the relevant section

## Writing rules

- Reference file paths and line numbers
- Keep entries concise — bullets over paragraphs
- Record *why* something was rejected, not just *that* it was
- Timestamp significant findings for long-running branches
- Never overwrite existing content unless explicitly asked
- Never delete a scratchpad without asking user

