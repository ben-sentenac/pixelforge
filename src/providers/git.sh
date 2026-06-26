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
    local upstream
    local ahead="0"
    local behind="0"
    local counts

    branch="$(git branch --show-current 2>/dev/null || true)"
    root="$(git rev-parse --show-toplevel 2>/dev/null || true)"

    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
        dirty="true"
    else
        dirty="false"
    fi

    upstream="$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true)"

    if [[ -n "$upstream" ]]; then
        counts="$(git rev-list --left-right --count HEAD..."$upstream" 2>/dev/null || true)"

        if [[ -n "$counts" ]]; then
            ahead="${counts%%[[:space:]]*}"
            behind="${counts##*[[:space:]]}"
        fi
    fi

    pf_model_set "git.available" "true"
    pf_model_set "git.branch" "$branch"
    pf_model_set "git.root" "$root"
    pf_model_set "git.dirty" "$dirty"
    pf_model_set "git.upstream" "$upstream"
    pf_model_set "git.ahead" "$ahead"
    pf_model_set "git.behind" "$behind"
}