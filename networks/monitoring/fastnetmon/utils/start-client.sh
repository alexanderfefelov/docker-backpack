#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

docker exec --tty --interactive backpack-fastnetmon /opt/fastnetmon/fastnetmon_client
