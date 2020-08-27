#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --restart unless-stopped \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume $CONTAINER_NAME-data:/data \
    --publish 9000:9000 \
    "$DEFAULT_GO_SETTINGS" \
    "$DEFAULT_LOG_SETTINGS" \
    $IMAGE_NAME \
      --admin-password=$(htpasswd -B -C 13 -nb $ADMIN_USERNAME $ADMIN_PASSWORD | cut --delimiter=: --fields=2)
}

wait_for_ports() {
  docker run --rm --link $CONTAINER_NAME:foobar martin/wait -t $WAIT_TIMEOUT
}

print_info() {
  echo $CONTAINER_NAME is ready at $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME)
}

run
wait_for_ports
print_info
