#!/usr/bin/env bash

pf_theme_load() {
    local skin="${PF_SKIN:-cyber}"
    local skin_dir="${PIXELFORGE_ROOT}/src/skins/${skin}"

    if [[ ! -d "$skin_dir" ]]; then
        echo "PixelForge error: skin not found: $skin_dir" >&2
        return 1
    fi

    if [[ ! -f "$skin_dir/icons.sh" ]]; then
        echo "PixelForge error: missing icons.sh in $skin_dir" >&2
        return 1
    fi

    if [[ ! -f "$skin_dir/spacing.sh" ]]; then
        echo "PixelForge error: missing spacing.sh in $skin_dir" >&2
        return 1
    fi

    source "$skin_dir/icons.sh"
    source "$skin_dir/spacing.sh"
}