#!/usr/bin/env bash

readonly SCRIPT=$(realpath "$0")
readonly SCRIPTS_DIR=$(dirname "$SCRIPT")
export LIB_DIR=$SCRIPTS_DIR/lib

LOGGER_SYSLOG_HOST=logstash.backpack.test
LOGGER_SYSLOG_PORT=5514
. "$LIB_DIR"/logging.sh

export IP_ADDRESS=$1 DIRECTION=$2 PPS=$3 ACTION=$4 DETAILS=$(< /dev/stdin)

handle_action() {
  export ALERT_NAME="FastNetMon alert" SEVERITY=critical ENV=testing ACTOR=$(hostname --fqdn)

  local -r HANDLERS_DIR="$SCRIPTS_DIR/$ACTION.d"
  for handler in $HANDLERS_DIR/*; do
    case $handler in
      *.sh)
        log_notice "Executing handler $handler"
        bash "$handler"
        ;;
      *)
        ;;
    esac
  done
}

handle_unknown_action() {
  log_error unknown action
}

log_notice "started, action: $ACTION, IP address: $IP_ADDRESS"
case $ACTION in
  ban|unban|attack_details)
    handle_action
    ;;
  *)
    handle_unknown_action
    ;;
esac
log_notice "finished, action: $ACTION"
