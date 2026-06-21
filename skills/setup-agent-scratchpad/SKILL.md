---
name: setup-agent-scratchpad
description: Configure agent-scratchpad for your coding agent. Adds the rules to AGENTS.md so agents automatically use the scratchpad at session start. Run once after installing the skill.
disable-model-invocation: true
---

# Setup agent-scratchpad

Bootstrap agent-scratchpad by adding the rules to AGENTS.md. Without these rules, agents won't automatically read/write the scratchpad at session start.

This is a prompt-driven skill. Explore, present findings, confirm with user, then write.

## Process

### 1. Explore

Check current state. Read whatever exists; don't assume:

- `~/.agents/AGENTS.md` — global rules file (used by Pi and other agents)
- `AGENTS.md` at repo root — project-level rules file
- `CLAUDE.md` at repo root — alternative project-level file (used by Claude Code)
- Check if `## agent-scratchpad` section already exists in any of these

### 2. Present findings

Summarise what's present and what's missing. Then ask the user one question:

> agent-scratchpad needs rules in AGENTS.md so agents know when to use it. Where do you want to add these rules?
>
> - **Global** (`~/.agents/AGENTS.md`) — works across all repos, recommended for most users
> - **Project** (`AGENTS.md` in this repo) — only affects this repo
> - **Both** — global + project (useful if different agents look in different places)
> - **Skip** — rules already exist, or you'll add them manually

### 3. Write

The agent-scratchpad block to add:

```markdown
## agent-scratchpad

This project uses agent-scratchpad for per-branch persistent memory.

Rules:
- At the start of every session on a branch, check for `scratchpad/<branch>/INDEX.md`
- If it exists, read it before doing anything else — it contains the full context of the branch
- If the `Active:` line points to a scoped file, read that file too
- If the scratchpad doesn't exist, create it from the template at `<skill-dir>/schema/index-template.md`
- Also create the content file from `<skill-dir>/schema/work-template.md` if it doesn't exist
- Update the scratchpad continuously as you work — don't wait until the end
- Use `/scope` to create focused scratchpads when work branches into multiple concerns
- Use `/todo` to add future work items to `scratchpad/TODO.md`
- Add `scratchpad/` to `.gitignore` if not already present
```

**Note:** Replace `<skill-dir>` with the actual path to the skill directory. When installed via `npx skills`, this is typically `~/.agents/skills/agent-scratchpad/`.

**For global setup (`~/.agents/AGENTS.md`):**
- Create file if it doesn't exist
- Prepend the block if file exists but has no `## agent-scratchpad` section
- Skip if section already exists

**For project setup (`AGENTS.md`):**
- Same logic as global
- If `CLAUDE.md` exists instead, ask user which file to edit (don't create AGENTS.md when CLAUDE.md exists)

### 4. Done

Tell the user:
- Which files were created/updated
- That agent-scratchpad will now activate automatically on branch work
- They can re-run this skill if they need to move rules between global/project

## Template paths

The `<skill-dir>` placeholder in the rules block should resolve to:

| Install method | Path |
|---|---|
| `npx skills` (global) | `~/.agents/skills/agent-scratchpad/` |
| `npx skills` (project) | `.agents/skills/agent-scratchpad/` |
| Manual clone | Path where you cloned the repo |
