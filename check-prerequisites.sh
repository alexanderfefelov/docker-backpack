#!/usr/bin/env bash

. lib/ansi-escape-codes.sh

readonly PREREQUISITES="
  awk
  docker
  envsubst
  flyway
  htpasswd
  http
  ip
  jq
  logger
  lorem
  mcrcon
  mkpasswd
  mongo
  mysql
  nc
  openssl
  patch
  petname
  psql
  pwgen
  redis-cli
  sleep
  smbpasswd
  smidump
  sysctl
  tac
  toilet
  xargs
"

for x in $PREREQUISITES; do
  echo -n $x...
  if command -v $x > /dev/null; then
    echo -e ${COLOR_FG_GREEN}found${COLOR_RESET}
  else
    echo -e ${COLOR_FG_RED}not found${COLOR_RESET}
  fi
done
