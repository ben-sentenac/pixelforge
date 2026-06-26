#!/usr/bin/env bash

export PIXELFORGE_ROOT="$PWD"

source src/core/engine.sh

pf_register_component user
pf_register_component cwd
pf_register_component git

pf_engine_render

echo