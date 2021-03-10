#!/usr/bin/env bash

for f in $(find .. -type f -name "*.sh"); do
  shellcheck $f
done
