#!/usr/bin/env bash

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

read -p "Press Y to continue: " -n 1 -r
echo
if [ "$REPLY" != "Y" ]; then
  exit
fi

for CONTAINER in $(tac containers); do
  docker stop $CONTAINER
done
