#!/usr/bin/env bash

readonly OUTPUT_DIR=generated/inputs

mkdir --parents $OUTPUT_DIR
telegraf --version > $OUTPUT_DIR/telegraf.version
PATTERN="#                            INPUT PLUGINS                                    #"
for x in $(telegraf --input-list | tail -n +2); do
  telegraf --input-filter $x config | sed "0,/$PATTERN/d" | tail -n +4 | head -n -1 | awk '{print "# "$0}' > $OUTPUT_DIR/inputs.$x.conf
done
