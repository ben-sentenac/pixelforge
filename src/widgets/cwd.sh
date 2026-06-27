#!usr/bin/env bash

_pf_widget_cwd_home() {
    pf_model_get "cwd.home"
}


pf_widget_cwd_render() {
    if ! pf_model_has "cwd.home"; then
        return
    fi

    printf "%s%s%s\n" "$PF_ICON_CWD" "$PF_ICON_GAP" "$(_pf_widget_cwd_home)"
}