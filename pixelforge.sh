#!/usr/bin/env bash
export PIXELFORGE_ROOT="${PIXELFORGE_ROOT:-$HOME/Workspace/projects/pixelForge}"

source "$PIXELFORGE_ROOT/src/core/index.sh"
source "$PIXELFORGE_ROOT/src/providers/index.sh"
source "$PIXELFORGE_ROOT/src/widgets/index.sh"

# Initialize PixelForge theme
pf_initialize

PROMPT_COMMAND="pf_prompt_update"
