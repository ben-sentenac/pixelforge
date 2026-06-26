#!usr/bin/env bash

pf_provider_cwd() {
      local full="$PWD"
    local home="$PWD"
    local basename
    local parent
    local depth

    if [[ "$full" == "$HOME"* ]]; then
        home="~${full#$HOME}"
    fi

    basename="$(basename "$full")"
    parent="$(dirname "$full")"

    depth="$(awk -F'/' '{print NF-1}' <<< "$full")"

    pf_model_set "cwd.full" "$full"
    pf_model_set "cwd.home" "$home"
    pf_model_set "cwd.basename" "$basename"
    pf_model_set "cwd.parent" "$parent"
    pf_model_set "cwd.depth" "$depth"
}