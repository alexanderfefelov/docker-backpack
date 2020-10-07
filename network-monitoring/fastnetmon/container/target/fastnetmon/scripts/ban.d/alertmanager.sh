#!/usr/bin/env bash

ALERTMANAGER_HOST=alertmanager.backpack.test
ALERTMANAGER_PORT=9093
. "$LIB_DIR"/alertmanager.sh

create_alert \
  "$ALERT_NAME" \
  "$SEVERITY" \
  "$ENV" \
  "$ACTOR" \
  "$ACTION" \
  "$IP_ADDRESS" \
  "$ACTOR: $ACTION $IP_ADDRESS, $DIRECTION $PPS pps" \
  "$DETAILS"
