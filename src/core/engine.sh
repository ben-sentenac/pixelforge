#!usr/bin/env bash

#Engine
# Orchestrate prompt rendering

#!/usr/bin/env bash

source "${PIXELFORGE_ROOT}/src/core/config.sh"
source "${PIXELFORGE_ROOT}/src/core/registry.sh"
source "${PIXELFORGE_ROOT}/src/core/bootstrap.sh"

# ANSI ENGINE
source "${PIXELFORGE_ROOT}/src/ansi/index.sh"

# Theme and renderer
source "${PIXELFORGE_ROOT}/src/core/theme.sh"
source "${PIXELFORGE_ROOT}/src/core/init.sh"
source "${PIXELFORGE_ROOT}/src/layouts/minimal.sh"
source "${PIXELFORGE_ROOT}/src/core/renderer.sh"


pf_engine_render() {
    pf_clear_components
    pf_bootstrap_components
    pf_renderer_render
}