#!/usr/bin/env bash

# Bootstrap
# Register enabled default componentsd

pf_bootstrap_components() {
    [[ "$PF_SHOW_USER" == "true" ]] && pf_register_component user
    [[ "$PF_SHOW_HOST" == "true" ]] && pf_register_component host
    [[ "$PF_SHOW_CWD" == "true" ]] && pf_register_component cwd
    [[ "$PF_SHOW_GIT" == "true" ]] && pf_register_component git
}