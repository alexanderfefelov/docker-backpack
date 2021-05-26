#!/usr/bin/env bash

. lib/ansi-escape-codes.sh

readonly PREREQUISITES="
  awk
  docker
  envsubst
  flyway
  hadolint
  htpasswd
  http
  ip
  java
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
  python3
  redis-cli
  shellcheck
  sleep
  smbpasswd
  smidump
  sqlcmd
  sysctl
  tac
  toilet
  xargs
"

not_found=0
for x in $PREREQUISITES; do
  echo -n $x...
  if command -v $x > /dev/null; then
    echo -e ${COLOR_FG_GREEN}found${COLOR_RESET}
  else
    ((not_found+=1))
    echo -e ${COLOR_FG_RED}not found${COLOR_RESET}
  fi
done

exit $not_found
