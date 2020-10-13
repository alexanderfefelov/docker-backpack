#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

(cd ../workload-automation/dkron/agent && ./run-agent-1.sh)
