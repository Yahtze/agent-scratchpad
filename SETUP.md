# Setup Instructions

## Option 1: Quick install (any harness)

Uses the [skills](https://github.com/vercel-labs/skills) CLI — works with Pi, Claude Code, Codex, Cursor, and 50+ other agents:

```bash
npx skills@latest add Yahtze/agent-scratchpad
```

Pick the skills you want and which coding agents to install them on.

## Option 2: Per-repo install

Install into a single repository (works with any harness).

```bash
bash <(curl -s https://raw.githubusercontent.com/Yahtze/agent-scratchpad/main/install.sh)
```

The script will:
1. Clone agent-scratchpad into `agent-scratchpad/` in your repo
2. Add `agent-scratchpad/` to `.gitignore`
3. Add the agent-scratchpad rules to `AGENTS.md`

## Option 3: LLM setup

Give this file to your LLM. It contains the instructions to install agent-scratchpad in your repository.

---

### Instructions for the LLM

You are setting up the `agent-scratchpad` skill for this repository. Follow these steps:

#### 1. Clone the repository

```bash
git clone --depth 1 git@github.com:Yahtze/agent-scratchpad.git agent-scratchpad
rm -rf agent-scratchpad/.git
```

#### 2. Add to AGENTS.md

Read the existing `AGENTS.md` file in the repo root (create it if it doesn't exist). Add the following to the top of the file, before any existing content:

```markdown
## agent-scratchpad

This project uses agent-scratchpad for per-branch persistent memory.

Rules:
- At the start of every session on a branch, check for `scratchpad/<branch>/INDEX.md`
- If it exists, read it before doing anything else — it contains the full context of the branch
- If the `Active:` line points to a scoped file, read that file too
- If the scratchpad doesn't exist, create it from `agent-scratchpad/schema/index-template.md`
- Update the scratchpad continuously as you work — don't wait until the end
- Use `/scope` to create focused scratchpads when work branches into multiple concerns
- Use `/todo` to add future work items to `scratchpad/TODO.md`
- Add `scratchpad/` to `.gitignore` if not already present
```

If `AGENTS.md` already has content, do not overwrite it. Prepend the block above and keep the existing content below it.

#### 3. Update .gitignore

Check if `.gitignore` exists and contains `agent-scratchpad/`. If not, add it:

```
# Agent scratchpad (per-branch working memory)
agent-scratchpad/
```

#### 4. Confirm setup

After completing the above, confirm to the user:
- Which files were created/updated
- That the scratchpad is ready to use
- That the next time they work on a branch, a scratchpad will be created automatically

---

## Option 4: Manual setup

1. Clone or download this repository into your repo as `agent-scratchpad/`
2. Add the agent-scratchpad rules to your `AGENTS.md` (see block in Option 3)
3. Add `agent-scratchpad/` to `.gitignore`
