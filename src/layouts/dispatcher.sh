#!/usr/bin/env bash

pf_layout_render() {
    local layout="${PF_LAYOUT:-minimal}"

    case "$layout" in
        minimal)
            pf_layout_minimal_render
            ;;
        vt100)
            pf_layout_vt100_render
            ;;
        *)
            pf_layout_minimal_render
            ;;
    esac
}
