#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

./clear-logs-scheduler.sh
./clear-logs-server.sh
