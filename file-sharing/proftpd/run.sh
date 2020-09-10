#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../lib/lib.sh

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/etc/proftpd \
    --volume $CONTAINER_NAME-data:/home \
    --volume $CONTAINER_NAME-log:/var/log/proftpd \
    --publish 20:20 \
    --publish 21:21 \
    --publish 65021-65042:65021-65042 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME
}

run
wait_for_container_ports $CONTAINER_NAME 21 $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
