#!usr/bin/env bash

_pf_widget_cwd_home() {
    pf_model_get "cwd.home"
}

_pf_widget_cwd_basename() {
    pf_model_get "cwd.basename"
}

pf_widget_cwd_render() {
    if ! pf_model_has "cwd.home"; then
        return
    fi

    printf "📁 %s\n" "$(_pf_widget_cwd_home)"
}