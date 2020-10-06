#!/usr/bin/env bash

readonly SCRIPT=$(realpath "$0")
readonly HOME=$(dirname "$SCRIPT")

LOGGER_SYSLOG_HOST=logstash.backpack.test
LOGGER_SYSLOG_PORT=5514
. "$HOME"/logging.sh

readonly IP_ADDRESS=$1
readonly DIRECTION=$2
readonly PPS=$3
readonly ACTION=$4
readonly DETAILS=$(< /dev/stdin)

handle_ban() {
  log_notice handle_ban called
}

handle_attack_details() {
  log_notice handle_attack_details called
}

handle_unban() {
  log_notice handle_unban called
}

handle_unknown_action() {
  log_error unknown action
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
