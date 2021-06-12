#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. lib.sh

trap on_error ERR

readonly COMPONENTS_HOME=$BACKPACK_HOME
readonly COMPONENTS_LIST=$BACKPACK_HOME/lib/components
time build_all $COMPONENTS_HOME $COMPONENTS_LIST
