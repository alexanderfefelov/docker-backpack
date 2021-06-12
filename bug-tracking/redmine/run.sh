#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../lib/lib.sh
. lib.sh

check_containers "$REQUIRED_CONTAINERS" || exit 1

$MYSQL --execute="USE $DB_DATABASE;"
readonly USE_DB_RETCODE=$?

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

if [ "$USE_DB_RETCODE" -ne 0 ]; then
  readonly FIRST_RUN=true
  initialize_database
fi

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
if [ "$FIRST_RUN" == "true" ]; then
  execute_scripts init/configure-redmine
  execute_scripts init/configure-accounts
fi
print_container_info $CONTAINER_NAME
