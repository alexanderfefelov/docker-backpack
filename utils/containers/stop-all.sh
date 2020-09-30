#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

read -p "Press Y to continue: " -n 1 -r
echo
if [ "$REPLY" != "Y" ]; then
  exit
fi

. settings.sh

IFS=$'\n'
for container in $(tac $CONTAINERS); do
  [[ "$container" =~ ^#.*$ ]] && continue
  docker stop $container
done
