#!/usr/bin/env bash

_pf_widget_git_is_available() {
    [[ "$(pf_model_get "git.available")" == "true" ]]
}

_pf_widget_git_branch() {
    local branch

    branch="$(pf_model_get "git.branch")"

    if [[ -z "$branch" ]]; then
        branch="detached"
    fi

    printf "%s" "$branch"
}

_pf_widget_git_dirty_marker() {
    if [[ "$(pf_model_get "git.dirty")" == "true" ]]; then
        printf "%s%s*%s"  "$PF_ICON_GAP" "$PF_COLOR_WARNING" "$PF_COLOR_RESET"
    fi
}


_pf_widget_git_sync_indicators() {
    local ahead
    local behind

    ahead="$(pf_model_get "git.ahead")"
    behind="$(pf_model_get "git.behind")"

    if [[ "$ahead" != "0" ]]; then
        printf "%s%s↑%s%s" "$PF_ICON_GAP" "$PF_COLOR_SUCCESS" "$ahead" "$PF_COLOR_RESET"
    fi

    if [[ "$behind" != "0" ]]; then
        printf "%s%s↓%s%s" "$PF_ICON_GAP" "$PF_COLOR_ERROR" "$behind" "$PF_COLOR_RESET"
    fi
}

_pf_widget_git_build_output() {
    local output=""
    local branch
    local dirty
    local sync

    branch="$(_pf_widget_git_branch)"
    dirty="$(_pf_widget_git_dirty_marker)"
    sync="$(_pf_widget_git_sync_indicators)"

    output+="${PF_COLOR_PRIMARY}${PF_ICON_GIT}${PF_COLOR_RESET}"
    output+="${PF_ICON_GAP}"
    output+="${PF_COLOR_SECONDARY}${branch}${PF_COLOR_RESET}"
    output+="${dirty}"
    output+="${sync}"

    printf "%s" "$output"

}


pf_widget_git_render() {
    if  ! _pf_widget_git_is_available ; then
        return
    fi

    printf "%s\n" "$(_pf_widget_git_build_output)"
}