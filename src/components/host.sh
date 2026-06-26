#!usr/bin/env bash

pf_provider_host() {
    pf_model_set "host.name" "$(hostname)"
}