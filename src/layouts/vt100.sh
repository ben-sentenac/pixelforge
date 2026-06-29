#!/usr/bin/env bash

pf_layout_vt100_render() {
  local cwd
    local git

    cwd="$(pf_widget_cwd_render)"
    git="$(pf_widget_git_render)"

    if [[ -n "$cwd" ]]; then
        printf "%s\n\n" "$cwd"
    fi

    if [[ -n "$git" ]]; then
        printf "%s\n\n" "$git"
    fi

    printf "%s " "${PF_ICON_PROMPT:->}"
}
