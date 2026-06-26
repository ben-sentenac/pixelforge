#!usr/bin/env bash

pf_widget_host_render() {

 if ! pf_model_has "host.name"; then
        return
    fi

    printf "🖥 %s\n" "$(pf_model_get "host.name")"

}