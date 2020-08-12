#!/usr/bin/env bash

readonly OUTPUT_DIR=generated/sample-sections
readonly SECTIONS=(agent aggregators global_tags inputs outputs processors)

mkdir --parents $OUTPUT_DIR
telegraf --version > $OUTPUT_DIR/telegraf.version
for x in ${SECTIONS[@]}; do
  telegraf --sample-config --section-filter $x > $OUTPUT_DIR/$x.conf
done
