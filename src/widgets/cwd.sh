#!usr/bin/env bash

pf_widget_cwd_render() {

     if ! pf_model_has "cwd.path"; then
        return
    fi

    printf "📁 %s\n" "$(pf_model_get "cwd.path")"

}