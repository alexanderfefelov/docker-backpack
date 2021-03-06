#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. lib.sh

$DOCKER_EXEC \
  ipdevpolld -J $1 --netbox $2 --log-stderr
