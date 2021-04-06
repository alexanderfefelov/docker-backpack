#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

./clear-logs-master.sh
./clear-logs-backup.sh
./clear-logs-slave.sh
