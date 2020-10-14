#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

docker exec --tty --interactive backpack-dkron-server-1 \
  /dkron/dkron raft list-peers --rpc-addr dkron-server-1.backpack.test:8902
