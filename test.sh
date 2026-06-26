#!/usr/bin/env bash

set -euo pipefail

export PIXELFORGE_ROOT="$PWD"

source src/core/engine.sh
source src/components/user.sh
source src/components/host.sh
source src/components/cwd.sh

pf_engine_render
echo