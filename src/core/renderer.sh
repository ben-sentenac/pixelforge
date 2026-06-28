#!/usr/bin/env bash

# Renderer
# Build the final prompt from registered components.

pf_renderer_run_provider() {
    local component="$1"
    local function_name="pf_provider_${component}"
    local value=""

    if declare -F "$function_name" > /dev/null; then
       "$function_name"
    else
        pf_model_set "${component}.error" "missing provider"
    fi
}


pf_renderer_render() {
     pf_model_clear

    while IFS= read -r component; do
        pf_renderer_run_provider "$component"
    done < <(pf_registered_components)

    pf_layout_render
}