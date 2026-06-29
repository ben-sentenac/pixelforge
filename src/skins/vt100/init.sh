#!/usr/bin/env bash

pf_theme_on_initialize() {
   local current_time
    current_time="$(date '+%a %b %d %H:%M:%S')"

    printf '\n'
    printf 'Digital Equipment Corporation\n'
    printf '\n'
    printf 'VT100 Video Terminal\n'
    printf '\n'
    printf 'READY\n'
    printf '\n'
    printf 'Last login: %s\n' "$current_time"
    printf '\n'
    printf '%s@%s\n' "$USER" "$(hostname -s 2>/dev/null || hostname)"
    printf '\n'
}
