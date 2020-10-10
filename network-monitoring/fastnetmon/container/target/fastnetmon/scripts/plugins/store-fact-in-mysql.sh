MYSQL_HOST=mysql-main-master.backpack.test
MYSQL_PORT=3306
MYSQL_DB=fastnetmon
MYSQL_USERNAME=fastnetmon_boeweewoonee
MYSQL_PASSWORD=uheeghienoej
. "$LIB_DIR"/mysql.sh

store_fact "$UUID" "$ACTOR" "$ACTION" "$IP_ADDRESS" "$DIRECTION" "$PPS" "$(< $DETAILS_FILE)"
