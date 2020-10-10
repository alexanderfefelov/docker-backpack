ACTIVEMQ_HOST=activemq.backpack.test
ACTIVEMQ_PORT=8161
ACTIVEMQ_USERNAME=fastnetmon_zahdeegeishu
ACTIVEMQ_PASSWORD=xaocheitohto
. "$LIB_DIR"/activemq.sh

destination="topic://fastnetmon.alert.$ACTOR.$ACTION"
message="$ACTOR $ACTION $IP_ADDRESS $DIRECTION $PPS"
response=$(send_message $destination "$message")
