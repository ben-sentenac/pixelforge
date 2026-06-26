#!/usr/bin/env bash

set -euo pipefail

export PIXELFORGE_ROOT="$PWD"

source src/core/engine.sh
source src/components/user.sh
source src/components/host.sh
source src/components/cwd.sh

pf_register_component user
pf_register_component host
pf_register_component cwd

pf_engine_render
echo