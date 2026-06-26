#!/usr/bin/env bash

pf_layout_render() {

    printf "██ PixelForge\n\n"

    pf_widget_user_render
    pf_widget_host_render
    pf_widget_cwd_render
    pf_widget_git_render

    printf "\n▶ "

}
