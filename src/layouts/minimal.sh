#!/usr/bin/env bash

pf_layout_render() {
    printf "██ PixelForge\n\n"

    if pf_model_has user.name; then
        printf "USER     %s\n" "$(pf_model_get user.name)"
    fi

    if pf_model_has host.name; then
        printf "HOST     %s\n" "$(pf_model_get host.name)"
    fi

    if pf_model_has cwd.path; then
        printf "CWD      %s\n" "$(pf_model_get cwd.path)"
    fi

    printf "\n▶ "
}