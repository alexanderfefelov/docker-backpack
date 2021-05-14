#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

./clear-instance-logs.sh 1
./clear-instance-logs.sh 2
./clear-instance-logs.sh 3
