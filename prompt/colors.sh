#!/usr/bin/env bash

# PixelForge colors
# ANSI escape sequences wrapped for safe Bash prompt rendering.

PF_RESET="\[\e[0m\]"
PF_BOLD="\[\e[1m\]"
PF_DIM="\[\e[2m\]"

# Foreground colors
PF_BLACK="\[\e[38;2;16;24;39m\]"
PF_WHITE="\[\e[38;2;248;248;242m\]"
PF_GRAY="\[\e[38;2;120;130;150m\]"

PF_RED="\[\e[38;2;255;92;122m\]"
PF_GREEN="\[\e[38;2;124;255;155m\]"
PF_YELLOW="\[\e[38;2;255;209;102m\]"
PF_BLUE="\[\e[38;2;92;200;255m\]"
PF_PURPLE="\[\e[38;2;199;125;255m\]"
PF_CYAN="\[\e[38;2;100;244;255m\]"

# Background colors
PF_BG_DARK="\[\e[48;2;11;16;32m\]"
PF_BG_PANEL="\[\e[48;2;24;32;52m\]"
PF_BG_ACCENT="\[\e[48;2;60;40;90m\]"