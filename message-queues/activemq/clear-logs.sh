#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

./clear-logs-node-1.sh
./clear-logs-node-2.sh
./clear-logs-node-3.sh
