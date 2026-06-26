#!usr/bin/env bash

# Register components

declare -ag PF_COMPONENTS=()

pf_register_component() {
    local component="$1"
    local existing=""

    for existing in "${PF_COMPONENTS[@]}"; do
        if [[ "$existing" == "$component" ]]; then
            return 0
        fi
    done

    PF_COMPONENTS+=("$component")
}

pf_registered_components() {
     printf '%s\n' "${PF_COMPONENTS[@]}"
}

pf_clear_components() {
    PF_COMPONENTS=()
}