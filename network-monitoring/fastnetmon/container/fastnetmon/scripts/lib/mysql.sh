readonly MYSQL_HOST=${MYSQL_HOST:-mysql.test}
readonly MYSQL_PORT=${MYSQL_PORT:-3306}
readonly MYSQL_DB=${MYSQL_DB:-db}
readonly MYSQL_USERNAME=${MYSQL_USERNAME:-username}
readonly MYSQL_PASSWORD=${MYSQL_PASSWORD:-password}

readonly MYSQL="mysql --host=$MYSQL_HOST --port=$MYSQL_PORT --user=$MYSQL_USERNAME --password=$MYSQL_PASSWORD"

store_fact() {
  local -r UUID=$1 ACTOR=$2 ACTION=$3 VICTIM=$4 DIRECTION=$5 PPS=$6 DETAILS=$7

  local query="
    INSERT INTO fact(uuid, actor, action, victim, direction, pps, details)
      VALUES('$UUID', '$ACTOR', '$ACTION', inet_aton('$VICTIM'), '$DIRECTION', $PPS, '$DETAILS');
  "

  $MYSQL $MYSQL_DB <<< "$query"
}
