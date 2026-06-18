#!/bin/bash
set -e

REPO_URL="git@github.com:Yahtze/agent-scratchpad.git"
TARGET_DIR="agent-scratchpad"
AGENTS_FILE="AGENTS.md"
GITIGNORE=".gitignore"

# Check we're in a git repo
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "Error: Not inside a git repository."
  exit 1
fi

# Get repo root
REPO_ROOT=$(git rev-parse --show-toplevel)

# Clone if not already present
if [ -d "$REPO_ROOT/$TARGET_DIR" ]; then
  echo "agent-scratchpad already exists at $TARGET_DIR/"
else
  echo "Cloning agent-scratchpad..."
  git clone --depth 1 "$REPO_URL" "$REPO_ROOT/$TARGET_DIR"
  rm -rf "$REPO_ROOT/$TARGET_DIR/.git"
fi

# Add to .gitignore
if [ -f "$REPO_ROOT/$GITIGNORE" ]; then
  if ! grep -q "^agent-scratchpad/$" "$REPO_ROOT/$GITIGNORE"; then
    echo "" >> "$REPO_ROOT/$GITIGNORE"
    echo "# Agent scratchpad (per-branch working memory)" >> "$REPO_ROOT/$GITIGNORE"
    echo "agent-scratchpad/" >> "$REPO_ROOT/$GITIGNORE"
    echo "Added agent-scratchpad/ to .gitignore"
  else
    echo "agent-scratchpad/ already in .gitignore"
  fi
else
  echo "# Agent scratchpad (per-branch working memory)" > "$REPO_ROOT/$GITIGNORE"
  echo "agent-scratchpad/" >> "$REPO_ROOT/$GITIGNORE"
  echo "Created .gitignore with agent-scratchpad/"
fi

# Add to AGENTS.md
AGENT_BLOCK='## agent-scratchpad

This project uses agent-scratchpad for per-branch persistent memory.

Rules:
- At the start of every session on a branch, check for `scratchpad/<branch>/INDEX.md`
- If it exists, read it before doing anything else — it contains the full context of the branch
- If the `Active:` line points to a scoped file, read that file too
- If the scratchpad doesn'\''t exist, create it from `agent-scratchpad/schema/index-template.md`
- Update the scratchpad continuously as you work — don'\''t wait until the end
- Use `/scope` to create focused scratchpads when work branches into multiple concerns
- Add `scratchpad/` to `.gitignore` if not already present'

if [ -f "$REPO_ROOT/$AGENTS_FILE" ]; then
  if grep -q "## agent-scratchpad" "$REPO_ROOT/$AGENTS_FILE"; then
    echo "agent-scratchpad section already in $AGENTS_FILE"
  else
    EXISTING=$(cat "$REPO_ROOT/$AGENTS_FILE")
    printf "%s\n\n%s\n" "$AGENT_BLOCK" "$EXISTING" > "$REPO_ROOT/$AGENTS_FILE"
    echo "Prepended agent-scratchpad section to $AGENTS_FILE"
  fi
else
  printf "%s\n" "$AGENT_BLOCK" > "$REPO_ROOT/$AGENTS_FILE"
  echo "Created $AGENTS_FILE with agent-scratchpad section"
fi

echo ""
echo "Done. agent-scratchpad is installed."
echo "Next time you work on a branch, a scratchpad will be created automatically."
