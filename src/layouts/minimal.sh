#!/usr/bin/env bash

pf_layout_minimal_render() {

    printf "\n%s\n\n" "${PF_SEPARATOR:-────────────────────────────}"
    printf "%s PixelForge\n\n" "${PF_ICON_LOGO:-██}"

    pf_widget_user_render
    pf_widget_host_render
    pf_widget_cwd_render
    pf_widget_git_render

    printf "\n%s\n\n" "${PF_SEPARATOR:-────────────────────────────}"
    printf "%s " "${PF_ICON_PROMPT:-▶}"

}
