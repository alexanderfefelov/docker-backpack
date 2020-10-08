#!/usr/bin/env bash

readonly CONF_FILE=/fastnetmon/conf/fastnetmon.conf

readonly ACTIONS="
  ban
  unban
  attack_details
"

readonly PLUGINS_ban="
  create-alert-in-alertmanager.sh
  post-message-to-activemq.sh
  post-message-to-mattermost.sh
"

readonly PLUGINS_unban="
  create-alert-in-alertmanager.sh
  post-message-to-activemq.sh
  post-message-to-mattermost.sh
"

readonly PLUGINS_attack_details="
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

  for action in $ACTIONS; do
    echo Configuring plugins for \"$action\" action...
    plugin_list="PLUGINS_$action"
    for plugin in ${!plugin_list}; do
      ln --symbolic --verbose /fastnetmon/scripts/plugins/$plugin /fastnetmon/scripts/$action.d/$plugin
    done
    echo ...plugins configured
  done
fi

exec "$@"
