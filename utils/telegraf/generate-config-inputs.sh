#!/usr/bin/env bash

readonly OUTPUT_DIR=generated/inputs
readonly PATTERN="#                            INPUT PLUGINS                                    #"

mkdir --parents $OUTPUT_DIR
telegraf --version > $OUTPUT_DIR/telegraf.version
for x in $(telegraf --input-list | tail -n +2); do
  telegraf --input-filter $x config | sed "0,/$PATTERN/d" | tail -n +4 | head -n -1 > $OUTPUT_DIR/inputs.$x.conf
done
