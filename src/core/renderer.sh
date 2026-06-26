#!usr/bin/env bash

# Renderer
# Build the final prompt


pf_renderer_render() {
    local output=""

    while IFS= read -r component; do
        output+="${component} "
    done < <(pf_registered_components)

    printf "%s" "$output"
}