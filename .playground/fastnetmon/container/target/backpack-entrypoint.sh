#!/usr/bin/env bash

readonly CONF_FILE=/fastnetmon/conf/fastnetmon.conf
readonly TEMPLATE_FILE=/fastnetmon.conf.template

readonly GRAPHITE_IP_ADDRESS=$(getent hosts $GRAPHITE_HOST | awk '{ print $1 }')

if [ ! -f $CONF_FILE ]; then
  echo Generating $CONF_FIILE from $TEMPLATE_FILE...
  cat $TEMPLATE_FILE \
    | sed "s/_GRAPHITE_IP_ADDRESS_/$GRAPHITE_IP_ADDRESS/g" \
    | sed "s/_GRAPHITE_PORT_/$GRAPHITE_PORT/g" \
    > $CONF_FILE
  echo ...done
fi

exec "$@"
