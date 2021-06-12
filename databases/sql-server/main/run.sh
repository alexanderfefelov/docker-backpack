#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh
. lib.sh

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
$SQLCMD -Q "SELECT name FROM master.sys.server_principals WHERE name = 'healthcheck_sainarao9cha';" | grep healthcheck_sainarao9cha > /dev/null
if [ $? -ne 0 ]; then
  initialize
fi
print_container_info $CONTAINER_NAME
