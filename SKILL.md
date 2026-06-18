---
name: agent-scratchpad
version: 0.4.0
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

**Always do this first.** Check for a scratchpad matching the current scope.

In a git repo, use the branch name:

```bash
BRANCH=$(git branch --show-current)
```

Outside a git repo, ask the user for a scope name (e.g. "auth-refactor", "api-v2") and use that as the filename.

Then:
1. Create `scratchpad/` directory if it does not exist
2. Check for `scratchpad/<scope>.md` — if it exists, read it
3. If it does not exist, create it from the template at `schema/scratchpad-template.md`
4. Add `scratchpad/` to `.gitignore` if not already present

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

Follow the template in `schema/scratchpad-template.md`. The scratchpad has these sections:

- **Status** — current state of work on this branch
- **Goal** — what this branch is trying to accomplish
- **Design Decisions** — choices made and rationale
- **Approaches Tried** — approaches tested, what worked/didn't, why
- **Architecture Notes** — how things fit together, relevant file locations
- **Open Questions** — unresolved issues that need human input or further exploration

### 5. Explicit writes

If a user asks to write something specific to the scratchpad, do it — even if it doesn't fit the standard sections. Add a new section if needed.

## Slash commands

### `/scope` — Fresh scratchpad within a branch

Sometimes you need a clean scratchpad without switching branches — e.g. pivoting to a different problem on the same branch, or scoping a sub-task. Use `/scope` to create a new scratchpad with a user-provided name.

```bash
# User runs: /scope auth-refactor
# Creates: scratchpad/auth-refactor.md
```

The previous scratchpad is preserved. This is useful when work branches into multiple concerns.

## Writing rules

- Reference file paths and line numbers
- Keep entries concise — bullets over paragraphs
- Record *why* something was rejected, not just *that* it was
- Timestamp significant findings for long-running branches
- Never overwrite existing content unless explicitly asked
- Never delete a scratchpad without asking user

## Relationship to other docs

- `README.md` and other high-level files are the **stable source of truth** for overall architecture
- These files are expected to be updated once work on a branch is complete and merged
- Scratchpad files remain intact for versioning and archival purposes
- Scratchpads capture the *journey*; README captures the *destination*
