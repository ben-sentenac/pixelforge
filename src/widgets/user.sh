#!/usr/bin/env bash

pf_widget_user_render() {
    if ! pf_model_has "user.name"; then
        return
    fi

    printf "%s %s\n" "${PF_ICON_USER:-👤}" "$(pf_model_get "user.name")"
}