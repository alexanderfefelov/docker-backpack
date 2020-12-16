#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh
. functions.sh

run_slave $BACKUP_CONTAINER_NAME $BACKUP_HOST_NAME $BACKUP_MYSQL_SERVER_ID $BACKUP_PORT $MASTER_HOST_NAME $MASTER_PORT
wait_for_container_ports $BACKUP_CONTAINER_NAME 3306 $WAIT_TIMEOUT
docker exec $BACKUP_CONTAINER_NAME cp /read-only.cnf /etc/mysql/conf.d/
docker restart $BACKUP_CONTAINER_NAME
wait_for_container_ports $BACKUP_CONTAINER_NAME 3306 $WAIT_TIMEOUT
print_container_info $BACKUP_CONTAINER_NAME
