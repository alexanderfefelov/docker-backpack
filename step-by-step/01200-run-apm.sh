#!/usr/bin/env bash

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

(cd ../elastic/apm && ./run.sh)
