#!/usr/bin/env bash

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker logs --follow $MASTER_CONTAINER_NAME
