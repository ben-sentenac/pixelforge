#!/usr/bin/env bash

set -euo pipefail

echo "Running smoke tests..."

source ./pixelforge.sh

pf_initialize
pf_prompt_update >/dev/null

echo "✓ Smoke tests passed."
