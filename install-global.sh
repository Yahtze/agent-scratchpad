#!/bin/bash
set -e

REPO_URL="git@github.com:Yahtze/agent-scratchpad.git"
GLOBAL_DIR="$HOME/.agent-scratchpad"
AGENTS_FILE="$HOME/.agents/AGENTS.md"

# Clone or update the global install
if [ -d "$GLOBAL_DIR" ]; then
  echo "agent-scratchpad already installed at $GLOBAL_DIR"
  echo "Updating..."
  cd "$GLOBAL_DIR"
  git pull --quiet
  cd - > /dev/null
else
  echo "Installing agent-scratchpad to $GLOBAL_DIR..."
  git clone --depth 1 "$REPO_URL" "$GLOBAL_DIR"
fi

# Ensure ~/.agents/ directory exists
mkdir -p "$(dirname "$AGENTS_FILE")"

# Add to global AGENTS.md
AGENT_BLOCK='## agent-scratchpad

This project uses agent-scratchpad for per-branch persistent memory.

Rules:
- At the start of every session on a branch, check for `scratchpad/<branch>/INDEX.md`
- If it exists, read it before doing anything else — it contains the full context of the branch
- If the `Active:` line points to a scoped file, read that file too
- If the scratchpad doesn'\''t exist, create it from `~/.agent-scratchpad/schema/index-template.md`
- Update the scratchpad continuously as you work — don'\''t wait until the end
- Use `/scope` to create focused scratchpads when work branches into multiple concerns
- Use `/todo` to add future work items to `scratchpad/TODO.md`
- Add `scratchpad/` to `.gitignore` if not already present'

if [ -f "$AGENTS_FILE" ]; then
  if grep -q "## agent-scratchpad" "$AGENTS_FILE"; then
    echo "agent-scratchpad section already in $AGENTS_FILE"
  else
    EXISTING=$(cat "$AGENTS_FILE")
    printf "%s\n\n%s\n" "$AGENT_BLOCK" "$EXISTING" > "$AGENTS_FILE"
    echo "Prepended agent-scratchpad section to $AGENTS_FILE"
  fi
else
  printf "%s\n" "$AGENT_BLOCK" > "$AGENTS_FILE"
  echo "Created $AGENTS_FILE with agent-scratchpad section"
fi

echo ""
echo "Done. agent-scratchpad is installed globally."
echo "It will be available in every repo automatically."
echo ""
echo "To update in the future, run:"
echo "  bash $0"
