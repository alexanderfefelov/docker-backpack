#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

./clear-logs-server-1.sh
./clear-logs-server-2.sh
./clear-logs-server-3.sh
