#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

(cd ../file-sharing/proftpd && ./run.sh)
