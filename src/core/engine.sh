#!usr/bin/env bash

#Engine
# Orchestrate prompt rendering

source "${PIXELFORGE_ROOT}/src/core/config.sh"
source "${PIXELFORGE_ROOT}/src/core/registry.sh"
source "${PIXELFORGE_ROOT}/src/core/bootstrap.sh"
source "${PIXELFORGE_ROOT}/src/core/renderer.sh"

pf_engine_render() {
    pf_clear_components
    pf_bootstrap_components
    pf_renderer_render
}