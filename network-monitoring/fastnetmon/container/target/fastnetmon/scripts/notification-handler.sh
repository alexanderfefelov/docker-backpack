#!/usr/bin/env bash

readonly SCRIPT=$(realpath "$0")
readonly HOME=$(dirname "$SCRIPT")

LOGGER_SYSLOG_HOST=logstash.backpack.test
LOGGER_SYSLOG_PORT=5514
. "$HOME"/logging.sh

ALERTMANAGER_HOST=alertmanager.backpack.test
ALERTMANAGER_PORT=9093
. "$HOME"/alertmanager.sh

readonly ALERT_NAME="FastNetMon alert"
readonly ENV=testing
readonly ACTOR=$(hostname --fqdn)

readonly IP_ADDRESS=$1 DIRECTION=$2 PPS=$3 ACTION=$4 DETAILS=$(< /dev/stdin)

handle_ban() {
  create_alert \
    "$ALERT_NAME" \
    "critical" \
    "$ENV" \
    "$ACTOR" \
    "$ACTION" \
    "$IP_ADDRESS" \
    "$ACTOR: $ACTION $IP_ADDRESS, $DIRECTION $PPS pps" \
    "$DETAILS"
}

handle_attack_details() {
  create_alert \
    "$ALERT_NAME" \
    "info" \
    "$ENV" \
    "$ACTOR" \
    "$ACTION" \
    "$IP_ADDRESS" \
    "$ACTOR: $ACTION $IP_ADDRESS, $DIRECTION $PPS pps" \
    "$DETAILS"
}

handle_unban() {
  create_alert \
    "$ALERT_NAME" \
    "critical" \
    "$ENV" \
    "$ACTOR" \
    "$ACTION" \
    "$IP_ADDRESS" \
    "$ACTOR: $ACTION $IP_ADDRESS, $DIRECTION $PPS pps" \
    "$DETAILS"
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
