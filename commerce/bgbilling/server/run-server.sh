#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh
. lib.sh

check_containers "$REQUIRED_CONTAINERS" || exit 1

$MYSQL --execute="USE $DB_DATABASE;"
readonly USE_DB_RETCODE=$?

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

if [ "$USE_DB_RETCODE" -ne 0 ]; then
  initialize_database
  execute_scripts init/tune-database
  execute_scripts init/configure-accounts
fi

run_server
wait_for_all_container_ports $SERVER_CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $SERVER_CONTAINER_NAME
