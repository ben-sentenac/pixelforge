#!/usr/bin/env bash

pf_widget_git_render() {
    if [[ "$(pf_model_get "git.available")" != "true" ]]; then
        return
    fi

    local branch
    local dirty
    local ahead
    local behind
    local marker=""
    local sync=""

    branch="$(pf_model_get "git.branch")"
    dirty="$(pf_model_get "git.dirty")"
    ahead="$(pf_model_get "git.ahead")"
    behind="$(pf_model_get "git.behind")"

    if [[ -z "$branch" ]]; then
        branch="detached"
    fi

    if [[ "$dirty" == "true" ]]; then
        marker=" *"
    fi

    if [[ "$ahead" != "0" ]]; then
        sync+=" ↑${ahead}"
    fi

    if [[ "$behind" != "0" ]]; then
        sync+=" ↓${behind}"
    fi

    printf "🌿 %s%s%s\n" "$branch" "$marker" "$sync"
}