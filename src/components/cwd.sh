#!usr/bin/env bash

pf_component_cwd_render() {
    if [[ "$PWD" == "$HOME"* ]]; then
        printf "~%s" "${PWD#$HOME}"
    else
        printf "%s" "$PWD"
    fi
}