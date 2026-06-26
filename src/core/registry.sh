#!usr/bin/env bash

# Register components

declare -ag PF_COMPONENTS=()

pf_register_component() {
    local component="$1"
    PF_COMPONENTS+=("$component")
}

pf_registered_components() {
     printf '%s\n' "${PF_COMPONENTS[@]}"
}