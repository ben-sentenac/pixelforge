#!usr/bin/env bash

# PixelForge prompt
# Minimal first version

PIXELFORGE_DIR="${PIXELFORGE_DIR:-$HOME/Workspace/projects/PixelForge}"

source "$PIXELFORGE_DIR/prompt/colors.sh"

pf_prompt() {
    PS1="${PF_PURPLE}██${PF_RESET} ${PF_GREEN}\u${PF_WHITE}@${PF_CYAN}\h ${PF_BLUE}\w${PF_RESET}\n${PF_PURPLE}▓▓${PF_RESET}"
}

pf_prompt