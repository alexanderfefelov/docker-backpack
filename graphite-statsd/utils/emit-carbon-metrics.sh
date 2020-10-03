#!/usr/bin/env bash

for i in {1..7}; do
  metric=test.backpack.foo.bar
  value=$(echo $((RANDOM % 100)))
  timestamp=$(date +%s)
  message="$metric $value $timestamp"
  echo $message
  echo $message | nc -N carbon.backpack.test 2003
  sleep 30s
done
