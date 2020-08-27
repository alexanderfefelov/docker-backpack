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
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume /:/host:ro \
    --env HOST_ETC=/host/etc \
    --env HOST_PROC=/host/proc \
    --env HOST_RUN=/host/run \
    --env HOST_SYS=/host/sys \
    --env HOST_VAR=/host/var \
    --env HOST_MOUNT_PREFIX=/host \
    "$DEFAULT_GO_SETTINGS" \
    "$DEFAULT_LOG_SETTINGS" \
    $IMAGE_NAME
}

run
print_container_info $CONTAINER_NAME
