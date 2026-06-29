#!/usr/bin/env bash

pf_layout_vt100_render() {
    local cwd
    local git_line

    cwd="$(pf_widget_cwd_render)"
    git_line="$(pf_widget_git_render)"

    PS1=""

    if [[ -n "$cwd" ]]; then
        PS1+="${cwd}"$'\n'
    fi

    if [[ -n "$git_line" ]]; then
        PS1+=$'\n'"${git_line}"$'\n'
    fi

    PS1+=$'\n'"${PF_COLOR_PRIMARY}${PF_ICON_PROMPT}${PF_COLOR_RESET} "
}
