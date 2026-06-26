#!/usr/bin/env bash

pf_provider_git() {
    if ! command -v git >/dev/null 2>&1; then
        pf_model_set "git.available" "false"
        return
    fi

    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        pf_model_set "git.available" "false"
        return
    fi

    local branch
    local root
    local dirty

    branch="$(git branch --show-current 2>/dev/null || true)"
    root="$(git rev-parse --show-toplevel 2>/dev/null || true)"

    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
        dirty="true"
    else
        dirty="false"
    fi

    pf_model_set "git.available" "true"
    pf_model_set "git.branch" "$branch"
    pf_model_set "git.root" "$root"
    pf_model_set "git.dirty" "$dirty"
}