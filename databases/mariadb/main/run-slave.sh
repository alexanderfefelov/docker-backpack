#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh
. lib.sh

run_slave $SLAVE_CONTAINER_NAME $SLAVE_HOST_NAME $SLAVE_SERVER_ID $SLAVE_PORT $MASTER_HOST_NAME $MASTER_PORT
wait_for_container_ports $SLAVE_CONTAINER_NAME 3306 $WAIT_TIMEOUT
docker exec $SLAVE_CONTAINER_NAME cp /read-only.cnf /etc/mysql/conf.d/
docker restart $SLAVE_CONTAINER_NAME
wait_for_container_ports $SLAVE_CONTAINER_NAME 3306 $WAIT_TIMEOUT
print_container_info $SLAVE_CONTAINER_NAME
