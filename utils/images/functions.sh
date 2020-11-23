#!/usr/bin/env bash

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
