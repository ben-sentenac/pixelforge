#!/usr/bin/env bash
PIXELFORGE_ENTRYPOINT="${BASH_SOURCE[0]}"
PIXELFORGE_ROOT="$(cd "$(dirname "$PIXELFORGE_ENTRYPOINT")" && pwd)"
export PIXELFORGE_ROOT

source "$PIXELFORGE_ROOT/src/core/index.sh"
source "$PIXELFORGE_ROOT/src/providers/index.sh"
source "$PIXELFORGE_ROOT/src/widgets/index.sh"

# Initialize PixelForge theme
pf_initialize

PROMPT_COMMAND="pf_prompt_update"
