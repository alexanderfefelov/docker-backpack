#!/usr/bin/env bash

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

read -p "Press Y to continue: " -n 1 -r
echo
if [ "$REPLY" != "Y" ]; then
  exit
fi

IFS=$'\n'
for component in $(< components); do
  [[ "$component" =~ ^#.*$ ]] && continue
  (cd ../../$component && yes Y | ./prune.sh)
done
