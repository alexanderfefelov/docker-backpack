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

readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly NO_COLOR='\033[0m'

for x in $PREREQUISITES; do
  echo -n $x...
  if command -v $x > /dev/null; then
    echo -e ${GREEN}found${NO_COLOR}
  else
    echo -e ${RED}not found${NO_COLOR}
  fi
done
