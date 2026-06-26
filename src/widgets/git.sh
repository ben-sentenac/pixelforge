#!/usr/bin/env bash

pf_widget_git_render() {
    if [[ "$(pf_model_get "git.available")" != "true" ]]; then
        return
    fi

    local branch
    local dirty
    local marker=""

    branch="$(pf_model_get "git.branch")"
    dirty="$(pf_model_get "git.dirty")"

    if [[ -z "$branch" ]]; then
        branch="detached"
    fi

    if [[ "$dirty" == "true" ]]; then
        marker=" *"
    fi

    printf "🌿 %s%s\n" "$branch" "$marker"
}