#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

./clear-logs-agent-1.sh
./clear-logs-agent-2.sh
