#!usr/bin/env bash

pf_provider_cwd() {
    if [[ "$PWD" == "$HOME"* ]]; then
        pf_model_set "cwd.path" "~${PWD#$HOME}"
    else
        pf_model_set "cwd.path" "$PWD"
    fi
}