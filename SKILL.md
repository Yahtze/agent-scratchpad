---
name: agent-scratchpad
version: 0.1.0
description: Structured scratchpad for coding agents to think, plan, and track progress across sessions
---

# agent-scratchpad

Use when working on multi-step tasks, debugging complex issues, planning implementations, or when you need to persist thinking across turns. Creates a structured scratchpad file that survives context limits.

## When to use

- User asks you to "think step by step" or "plan this out"
- Task has 3+ steps or requires backtracking
- Debugging something that needs hypothesis tracking
- You need to remember findings across multiple tool calls
- User says "use a scratchpad" or "write this down"

## How it works

### 1. Create scratchpad

On first use in a session, create `scratchpad.md` in the working directory using the template from `schema/scratchpad-template.md`. If `scratchpad.md` already exists, read it first and continue from where you left off.

```bash
# Check if scratchpad exists
cat scratchpad.md 2>/dev/null || echo "CREATE_NEW"
```

### 2. Structure

The scratchpad has these sections:

```markdown
# Scratchpad: [task summary]

## Status: [planning | in-progress | blocked | complete]

## Goal
[What we're trying to accomplish]

## Plan
- [ ] Step 1: ...
- [ ] Step 2: ...
- [x] Step 3: ... (done)

## Findings
[Key discoveries, gotchas, relevant code locations]

## Hypotheses
[For debugging: what we think might be wrong]

## Notes
[Anything else worth remembering]
```

### 3. Update frequently

- Mark steps complete as you finish them
- Add findings as you discover them
- Update status when it changes
- Log hypotheses before testing them

### 4. Clean up

When the task is complete:
- Mark status as `complete`
- Leave the scratchpad for reference
- Or delete it if user prefers a clean workspace

## Rules

- Always read existing scratchpad before overwriting
- Keep entries concise — bullets over paragraphs
- Timestamp significant findings if context is long-running
- Reference file paths and line numbers in findings
- Never delete the scratchpad without asking user
