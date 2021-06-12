#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../lib/lib.sh
. lib.sh

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
sleep 42
patch $(docker volume inspect --format '{{.Mountpoint}}' $CONTAINER_NAME-data)/config.xml patches/config.xml.patch
docker restart $CONTAINER_NAME
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
