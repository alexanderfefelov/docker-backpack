#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

(cd ../business-intelligence/cubesviewer-server && ./run.sh)
