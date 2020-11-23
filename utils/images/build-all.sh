#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

pushd() {
  command pushd "$@" > /dev/null
}

popd() {
  command popd "$@" > /dev/null
}

build() {
  local -r COMPONENT_HOME=$1/$2
  echo
  echo ----------------------------------------------------------------------
  echo
  toilet --termwidth -f smblock $2
  echo Home: $COMPONENT_HOME
  echo
  echo ----------------------------------------------------------------------
  echo
  pushd $COMPONENT_HOME
  ./build.sh
  popd
}

build_all() {
  IFS=$'\n'
  for component in $(< $2); do
    [[ "$component" =~ ^#.*$ ]] && continue
    build $1 $component
  done
  echo
  toilet --termwidth -f smblock --filter gay OK, all done
}

readonly BACKPACK_HOME=$(dirname "$(dirname "$(dirname "$(realpath "$0")")")")
readonly COMPONENTS_HOME=$BACKPACK_HOME
readonly COMPONENTS_LIST=$BACKPACK_HOME/lib/components

echo Home: $BACKPACK_HOME
time build_all $COMPONENTS_HOME $COMPONENTS_LIST
