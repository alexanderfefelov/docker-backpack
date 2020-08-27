#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. functions.sh

run_slave $SLAVE_CONTAINER_NAME $SLAVE_HOST_NAME $SLAVE_MYSQL_SERVER_ID $SLAVE_PORT $MASTER_PORT
echo $SLAVE_CONTAINER_NAME is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $SLAVE_CONTAINER_NAME)
