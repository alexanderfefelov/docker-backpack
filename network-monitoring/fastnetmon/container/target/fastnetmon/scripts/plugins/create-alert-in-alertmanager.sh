ALERTMANAGER_HOST=alertmanager.backpack.test
ALERTMANAGER_PORT=9093
. "$LIB_DIR"/alertmanager.sh

response=$(create_alert "$UUID" "$ALERT_NAME" "$SEVERITY" "$ENV" "$ACTOR" "$ACTION" "$IP_ADDRESS" "$SUMMARY")
