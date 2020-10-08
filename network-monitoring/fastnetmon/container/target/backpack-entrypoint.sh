#!/usr/bin/env bash

readonly CONF_FILE=/fastnetmon/conf/fastnetmon.conf

readonly ACTIONS="
  ban
  unban
  attack_details
"

readonly AVAILABLE_PLUGINS="
  create-alert-in-alertmanager.sh
  post-message-to-activemq.sh
  post-message-to-mattermost.sh
"

if [ ! -f $CONF_FILE ]; then
  readonly TEMPLATE_FILE=/fastnetmon.conf.template
  readonly GRAPHITE_IP_ADDRESS=$(getent hosts $GRAPHITE_HOST | awk '{ print $1 }')
  echo Generating $CONF_FILE from $TEMPLATE_FILE...
  cat $TEMPLATE_FILE \
    | sed "s/_GRAPHITE_IP_ADDRESS_/$GRAPHITE_IP_ADDRESS/g" \
    | sed "s/_GRAPHITE_PORT_/$GRAPHITE_PORT/g" \
    > $CONF_FILE
  echo ...$CONF_FILE generated

  echo Configuring plugins...
  for action in $ACTIONS; do
    for plugin in $AVAILABLE_PLUGINS; do
      ln --symbolic --verbose /fastnetmon/scripts/plugins/$plugin /fastnetmon/scripts/$action.d/$plugin
    done
  done
  echo ...plugins configured
fi

exec "$@"
