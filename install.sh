#!/usr/bin/env bash
# ==============================================================================
# Antigravity Ultimate Skill Pack Installer
# Installs 171+ optimized agent skills into ~/.gemini/config/skills/
# ==============================================================================

set -e

SKILLS_DEST="$HOME/.gemini/config/skills"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SKILLS_SRC="$SCRIPT_DIR/skills"

echo "🚀 Installing Antigravity Ultimate Skill Pack..."

if [ ! -d "$SKILLS_SRC" ]; then
  echo "❌ Error: skills directory not found at $SKILLS_SRC"
  exit 1
fi

mkdir -p "$SKILLS_DEST"

# Copy all skills
cp -R "$SKILLS_SRC/"* "$SKILLS_DEST/"

TOTAL_SKILLS=$(ls -l "$SKILLS_DEST" | grep "^d" | wc -l | xargs)

echo "======================================================"
echo "✅ SUCCESS: Installed $TOTAL_SKILLS skills into $SKILLS_DEST!"
echo "======================================================"
echo "Restart your Antigravity session or reload skills to activate."
