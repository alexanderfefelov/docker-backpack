#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/var/lib/postgresql/data \
    --publish 5432:5432 \
    --env POSTGRES_USER=$POSTGRES_USERNAME \
    --env POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
    --env POSTGRES_DB=$POSTGRES_DATABASE \
    --env HEALTHCHECK_USERNAME=$HEALTHCHECK_USERNAME \
    --env HEALTHCHECK_PASSWORD=$HEALTHCHECK_PASSWORD \
    --env TELEGRAF_USERNAME=$TELEGRAF_USERNAME \
    --env TELEGRAF_PASSWORD=$TELEGRAF_PASSWORD \
    "$DEFAULT_HEALTH_SETTINGS" \
    "$DEFAULT_LOG_SETTINGS" \
    $IMAGE_NAME
}

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
