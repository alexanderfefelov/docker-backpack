#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh
. functions.sh

run_master $MASTER_CONTAINER_NAME $MASTER_HOST_NAME $MASTER_SERVER_ID $MASTER_PORT
wait_for_container_ports $MASTER_CONTAINER_NAME 3306 $WAIT_TIMEOUT
print_container_info $MASTER_CONTAINER_NAME
