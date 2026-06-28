#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/shellcheck.sh"
"$SCRIPT_DIR/format.sh"
"$SCRIPT_DIR/smoke.sh"

echo
echo "✓ All checks passed."
