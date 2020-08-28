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
    --volume $CONTAINER_NAME-data:/var/lib/rabbitmq \
    --publish 1893:1883 \
    --publish 5673:5672 \
    --publish 5674:5671 \
    --publish 8883:8883 \
    --publish 15672:15672 \
    --publish 15674:15674 \
    --publish 15675:15675 \
    --publish 61623:61613 \
    --publish 61624:61614 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME
}

run
wait_for_container_ports $CONTAINER_NAME 5672 $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
