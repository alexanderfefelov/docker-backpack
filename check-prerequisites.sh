#!/usr/bin/env bash

readonly PREREQUISITES="\
  htpasswd \
  http \
  lorem \
  mkpasswd \
  mysql \
  nc \
  redis-cli \
  smbpasswd \
"

for x in $PREREQUISITES; do
  echo -n $x...
  if command -v $x > /dev/null; then
    echo found
  else
    echo not found
  fi
done
