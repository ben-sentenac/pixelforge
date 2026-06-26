#!usr/bin/env bash

pf_widget_git_render() {
      if [[ "$(pf_model_get "git.available")" != "true" ]]; then
        return
    fi

    local branch

    branch="$(pf_model_get "git.branch")"

    if [[ -z "$branch" ]]; then
        branch="detached"
    fi

    printf "🌿 %s\n" "$branch"
}