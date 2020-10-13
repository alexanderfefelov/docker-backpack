#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh
. functions.sh

run_agent $AGENT_2_CONTAINER_NAME $AGENT_2_HOST_NAME
print_container_info $AGENT_2_CONTAINER_NAME
