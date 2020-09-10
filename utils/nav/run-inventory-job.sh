#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

docker exec --tty --interactive backpack-nav \
  ipdevpolld -J inventory --netbox $1 --log-stderr
