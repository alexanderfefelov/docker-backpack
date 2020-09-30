#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

pushd() {
  command pushd "$@" > /dev/null
}

popd() {
  command popd "$@" > /dev/null
}

build() {
  local -r COMPONENT_HOME=$BACKPACK_HOME/$1
  echo
  echo ----------------------------------------------------------------------
  echo
  echo $1
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
  for component in $(< $COMPONENTS); do
    [[ "$component" =~ ^#.*$ ]] && continue
    build $component
  done
  echo -e "\nOK, all done."
}

echo Home: $BACKPACK_HOME
time build_all
