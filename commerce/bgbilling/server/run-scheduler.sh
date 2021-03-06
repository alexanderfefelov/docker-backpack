#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh
. lib.sh

check_containers "$REQUIRED_CONTAINERS"
run_scheduler
wait_for_all_container_ports $SCHEDULER_CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $SCHEDULER_CONTAINER_NAME
