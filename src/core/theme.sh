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

_pf_theme_required_files() {
    printf "%s\n" "icons.sh" "spacing.sh" "palette.sh"
}

_pf_theme_optional_files() {
     printf "%s\n" "init.sh" "borders.sh" "terminal.sh"
}

_pf_theme_require_file() {
    local file="$1"

    if [[ ! -f "$file" ]]; then
        echo "PixelForge error: missing $file" >&2
        return 1
    fi
}

_pf_load_theme_file() {
    local file="$1"

    # shellcheck source=/dev/null
    source "$file"
}

_pf_theme_load_required_files() {
    local skin_dir="$1"
    local file_name
    local file_path

    while IFS= read -r file_name; do
        file_path="$skin_dir/$file_name"

        _pf_theme_require_file "$file_path" || return 1
        _pf_load_theme_file "$file_path"
    done < <(_pf_theme_required_files)
}

_pf_theme_load_optional_files() {
    local skin_dir="$1"
    local file_name
    local file_path

     while IFS= read -r file_name; do
        file_path="$skin_dir/$file_name"
        if [[ -f "$file_path" ]]; then
            _pf_load_theme_file "$file_path"
        fi

    done < <(_pf_theme_optional_files)
}

pf_theme_initialize() {
    if declare -F pf_theme_on_initialize >/dev/null; then
        pf_theme_on_initialize
    fi
}

pf_theme_load() {
    local skin_dir
    skin_dir="$(_pf_theme_skin_dir)"

    _pf_theme_require_dir "$skin_dir" || return 1

   _pf_theme_load_required_files "$skin_dir" || return 1
   _pf_theme_load_optional_files "$skin_dir"
}
