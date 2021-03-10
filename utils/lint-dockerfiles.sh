#!/usr/bin/env bash

for f in $(find .. -type f -name "Dockerfile*"); do
  hadolint $f
done
