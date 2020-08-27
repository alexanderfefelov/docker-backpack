#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. functions.sh

run_master $MASTER_CONTAINER_NAME $MASTER_HOST_NAME $MASTER_MYSQL_SERVER_ID $MASTER_PORT
echo $MASTER_CONTAINER_NAME is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $MASTER_CONTAINER_NAME)
