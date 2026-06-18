---
name: agent-scratchpad
version: 0.2.0
description: Per-branch scratchpad for agents to persist design decisions, patches, architecture context across sessions
---

# agent-scratchpad

A per-branch scratchpad that gives agents a place to write design decisions, patches tried/tested, architecture overviews, and any context useful to a freshly loaded agent session or other agents working in the repository.

## When to use

- Starting work on a branch (check for existing scratchpad)
- Making architectural decisions that future agents should know about
- Trying/testing patches or approaches that may need revisiting
- Documenting context that would be lost between sessions
- User explicitly asks to write something to the scratchpad
- User says "use a scratchpad" or "write this down"

## How it works

### 1. Locate or create the scratchpad

**Always do this first.** Check for a scratchpad matching the current branch.

```bash
# Get current branch name
BRANCH=$(git branch --show-current)

# Check for scratchpad directory
ls scratchpad/ 2>/dev/null || mkdir scratchpad

# Check for branch-specific scratchpad
cat "scratchpad/${BRANCH}.md" 2>/dev/null || echo "CREATE_NEW"
```

If the scratchpad does not exist:
1. Create `scratchpad/` directory if missing
2. Create `scratchpad/<branch-name>.md` from the template at `schema/scratchpad-template.md`
3. Add `scratchpad/` to `.gitignore` if not already present

### 2. Read before writing

Always read the current scratchpad file first. Read the template to understand the expected structure. Append new information in the correct sections — never overwrite existing content unless explicitly asked.

### 3. Structure

Follow the template in `schema/scratchpad-template.md`. The scratchpad has these sections:

- **Status** — current state of work on this branch
- **Goal** — what this branch is trying to accomplish
- **Design Decisions** — choices made and rationale
- **Patches Tried** — approaches tested, what worked/didn't, why
- **Architecture Notes** — how things fit together, relevant file locations
- **Context for Next Session** — anything a fresh agent session needs to know

### 4. Writing rules

- Reference file paths and line numbers
- Keep entries concise — bullets over paragraphs
- Timestamp significant findings for long-running branches
- Never delete a scratchpad without asking user

### 5. Explicit writes

If a user asks to write something specific to the scratchpad, do it — even if it doesn't fit the standard sections. Add a new section if needed.

## Relationship to other docs

- `README.md` and other high-level files are the **stable source of truth** for overall architecture
- These files are expected to be updated once work on a branch is complete and merged
- Scratchpad files remain intact for versioning and archival purposes
- Scratchpads capture the *journey*; README captures the *destination*
