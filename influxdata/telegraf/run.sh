#!/usr/bin/env bash

set -e

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

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
    --env GOGC=$GO_GOGC --env GOMAXPROCS=$GO_GOMAXPROCS \
    --log-opt max-size=$LOG_MAX_SIZE --log-opt max-file=$LOG_MAX_FILE \
    $IMAGE_NAME
}

run
docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME
