#!/usr/bin/env bash

pf_prompt_update() {
    PS1="$(pf_engine_render)"
}