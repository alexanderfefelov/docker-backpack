#!/bin/sh

$SNMPCOLLECTOR_HOME/bin/snmpcollector \
  -home $SNMPCOLLECTOR_HOME \
  -config $SNMPCOLLECTOR_HOME/conf/config.toml \
  -data $SNMPCOLLECTOR_HOME/data \
  -logs $SNMPCOLLECTOR_HOME/log
