#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../../../lib/lib.sh
. lib.sh

check_containers "$REQUIRED_CONTAINERS"
run
wait_for_container_ports $CONTAINER_NAME 8080 $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
