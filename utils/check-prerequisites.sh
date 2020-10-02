#!/usr/bin/env bash

. ../lib/ansi-escape-codes.sh

readonly PREREQUISITES="
  awk
  docker
  htpasswd
  http
  ip
  jq
  logger
  lorem
  mkpasswd
  mysql
  nc
  patch
  psql
  pwgen
  redis-cli
  sleep
  smbpasswd
  smidump
  sysctl
  tac
"

for x in $PREREQUISITES; do
  echo -n $x...
  if command -v $x > /dev/null; then
    echo -e ${COLOR_FG_GREEN}found${COLOR_RESET}
  else
    echo -e ${COLOR_FG_RED}not found${COLOR_RESET}
  fi
done
