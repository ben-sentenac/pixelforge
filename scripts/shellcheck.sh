#!/usr/bin/env bash

set -euo pipefail

if ! command -v shellcheck >/dev/null 2>&1; then
    echo "Error: shellcheck is not installed." >&2
    exit 1
fi

echo "Running ShellCheck..."

find src -type f -name "*.sh" -print0 |
    xargs -0 shellcheck -x

shellcheck -x pixelforge.sh

echo
echo "✓ ShellCheck passed."
