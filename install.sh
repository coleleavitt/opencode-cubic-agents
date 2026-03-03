#!/bin/bash

# OpenCode Cubic Agents Installer

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS_DIR="$SCRIPT_DIR/agents"
TARGET_DIR="${1:-$HOME/.config/opencode/agents}"

echo "OpenCode Cubic Agents Installer"
echo "================================"
echo ""
echo "Source: $AGENTS_DIR"
echo "Target: $TARGET_DIR"
echo ""

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Count agents
AGENT_COUNT=$(ls -1 "$AGENTS_DIR"/*.md 2>/dev/null | wc -l)

if [ "$AGENT_COUNT" -eq 0 ]; then
    echo "Error: No agent files found in $AGENTS_DIR"
    exit 1
fi

echo "Installing $AGENT_COUNT agents..."
echo ""

# Copy each agent
for agent in "$AGENTS_DIR"/*.md; do
    name=$(basename "$agent")
    if [ -f "$TARGET_DIR/$name" ]; then
        echo "  [UPDATE] $name"
    else
        echo "  [NEW]    $name"
    fi
    cp "$agent" "$TARGET_DIR/$name"
done

echo ""
echo "Installation complete!"
echo ""
echo "Installed agents:"
for agent in "$AGENTS_DIR"/*.md; do
    name=$(basename "$agent" .md)
    echo "  - @$name"
done

echo ""
echo "Usage:"
echo "  @cubic-review Review my changes"
echo "  @cubic-security Run security audit"
echo "  @cubic-plan (Tab to switch primary agent)"
echo ""
echo "Restart OpenCode to load the new agents."
