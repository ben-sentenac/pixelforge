#!usr/bin/env bash

# Renderer
# Build the final prompt from registered components.

pf_renderer_render_component() {
    local component="$1"
    local function_name="pf_component_${component}_render"

    if declare -F "$function_name" > /dev/null; then
        "$function_name"
    else
        printf "[missing:%s]" "$component"
    fi
}


pf_renderer_render() {
    local output=""
    local rendered=""

    while IFS= read -r component; do
        rendered="$(pf_renderer_render_component "$component")"
        output+="${rendered} "
    done < <(pf_registered_components)

    printf "%s" "$output"
}