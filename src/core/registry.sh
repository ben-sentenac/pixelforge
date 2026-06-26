#!/usr/bin/env bash

declare -ag PF_COMPONENTS=()
declare -Ag PF_RENDER_MODEL=()

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

pf_model_set() {
    local key="$1"
    local value="$2"

    PF_RENDER_MODEL["$key"]="$value"
}

pf_model_get() {
    local key="$1"

    printf "%s" "${PF_RENDER_MODEL[$key]:-}"
}

pf_model_has() {
    local key="$1"

    [[ -n "${PF_RENDER_MODEL[$key]:-}" ]]
}

pf_model_clear() {
    PF_RENDER_MODEL=()
}