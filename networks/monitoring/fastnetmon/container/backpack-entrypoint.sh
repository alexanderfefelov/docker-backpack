#!/usr/bin/env bash

readonly CONF_FILE=/fastnetmon/conf/fastnetmon.conf

readonly ACTIONS="
  ban
  unban
  attack_details
"

readonly PLUGINS_ban="
  create-alert-in-alertmanager.sh
  create-post-in-mattermost.sh
  send-message-to-activemq-queue.sh
  send-message-to-activemq-topic.sh
  store-fact-in-mysql.sh
"

readonly PLUGINS_unban="
  create-alert-in-alertmanager.sh
  create-post-in-mattermost.sh
  send-message-to-activemq-queue.sh
  send-message-to-activemq-topic.sh
  store-fact-in-mysql.sh
"

readonly PLUGINS_attack_details="
  create-alert-in-alertmanager.sh
  create-post-in-mattermost.sh
  send-message-to-activemq-queue.sh
  send-message-to-activemq-topic.sh
  store-fact-in-mysql.sh
"

if [ ! -f $CONF_FILE ]; then
  echo Generating config files...
  readonly GRAPHITE_IP_ADDRESS=$(getent hosts $GRAPHITE_HOST | awk '{ print $1 }')
  export GRAPHITE_IP_ADDRESS GRAPHITE_PORT
  envsubst \
    < /init/template.fastnetmon.conf \
    > $CONF_FILE
  echo ...config files generated

  for action in $ACTIONS; do
    echo Configuring plugins for \"$action\" action...
    plugin_list="PLUGINS_$action"
    for plugin in ${!plugin_list}; do
      [[ "$plugin" =~ ^#.*$ ]] && continue
      ln --symbolic --verbose /fastnetmon/scripts/plugins/$plugin /fastnetmon/scripts/$action.d/$plugin
    done
    echo ...plugins configured
  done
fi

exec "$@"
