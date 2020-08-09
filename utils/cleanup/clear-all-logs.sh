#!/usr/bin/env bash

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

read -p "Press Y to continue: " -n 1 -r
echo
if [ "$REPLY" != "Y" ]; then
  exit
fi

for component in $(< components); do
  (cd ../../$component && ./clear-logs.sh)
done
