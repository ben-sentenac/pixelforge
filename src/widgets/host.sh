#!usr/bin/env bash

pf_widget_host_render() {

 if ! pf_model_has "host.name"; then
        return
fi

    printf "%s%s%s\n" "$PF_ICON_HOST" "$PF_ICON_GAP" "$(pf_model_get "host.name")"

}