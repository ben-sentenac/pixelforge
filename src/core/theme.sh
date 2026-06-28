#!/usr/bin/env bash

_pf_theme_skin_dir() {
    local skin="${PF_SKIN:-cyber}"
    local skin_dir="${PIXELFORGE_ROOT}/src/skins/${skin}"

    printf "%s" "${skin_dir}"
}

_pf_theme_require_dir() {
    local dir="$1"

    if [[ ! -d "$dir" ]]; then
        echo "PixelForge error: skin not found: $dir" >&2
        return 1
    fi
}

_pf_theme_require_file() {
    local file="$1"

    if [[ ! -f "$file" ]]; then
        echo "PixelForge error: missing $file" >&2
        return 1
    fi
}

pf_theme_load() {
    local skin_dir="$(_pf_theme_skin_dir)"

    _pf_theme_require_dir "$skin_dir" || return 1

    _pf_theme_require_file "$skin_dir/icons.sh" || return 1
    _pf_theme_require_file "$skin_dir/spacing.sh" || return 1
    _pf_theme_require_file "$skin_dir/palette.sh" || return 1

    source "$skin_dir/icons.sh"
    source "$skin_dir/spacing.sh"
    source "$skin_dir/palette.sh"
}