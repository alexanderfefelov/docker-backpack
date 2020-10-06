#!/usr/bin/env bash

readonly SCRIPT=$(realpath "$0")
readonly HOME=$(dirname "$SCRIPT")

LOGGER_SYSLOG_HOST=logstash.backpack.test
LOGGER_SYSLOG_PORT=5514
. "$HOME"/logging.sh

ALERTMANAGER_HOST=alertmanager.backpack.test
ALERTMANAGER_PORT=9093
. "$HOME"/alertmanager.sh

readonly ACTOR=$(hostname --fqdn)

readonly IP_ADDRESS=$1
readonly DIRECTION=$2
readonly PPS=$3
readonly ACTION=$4
readonly DETAILS=$(< /dev/stdin)

handle_ban() {
  create_alert \
    "FastNetMon alert" \
    "critical" \
    "testing" \
    "$ACTOR" \
    "$ACTION" \
    "$IP_ADDRESS" \
    "$ACTOR $ACTION $IP_ADDRESS $DIRECTION $PPS pps" \
    "$DETAILS"
}

handle_attack_details() {
  ret_code=0
}

handle_unban() {
  ret_code=0
}

handle_unknown_action() {
  log_error unknown action
  ret_code=404
}

log_notice "started, action: $ACTION, IP address: $IP_ADDRESS"

case $ACTION in
  ban)
    handle_ban
    ;;
  attack_details)
    handle_attack_details
    ;;
  unban)
    handle_unban
    ;;
  *)
    handle_unknown_action
    ;;
esac

log_notice "finished, action: $ACTION"

exit $ret_code
