readonly MYSQL_HOST=${MYSQL_HOST:-mysql.test}
readonly MYSQL_PORT=${MYSQL_PORT:-3306}
readonly MYSQL_DB=${MYSQL_DB:-db}
readonly MYSQL_USERNAME=${MYSQL_USERNAME:-username}
readonly MYSQL_PASSWORD=${MYSQL_PASSWORD:-password}

readonly MYSQL="mysql --host=$MYSQL_HOST --port=$MYSQL_PORT --user=$MYSQL_USERNAME --password=$MYSQL_PASSWORD"

store_fact() {
  local -r ACTOR=$1 ACTION=$2 VICTIM=$3 DIRECTION=$4 PPS=$5 DETAILS=$6

  local -r QUERY_TEMPLATE="
    INSERT INTO fact(actor, action, victim, direction, pps, details) VALUES(
      '_ACTOR_',
      '_ACTION_',
      inet_aton('_VICTIM_'),
      '_DIRECTION_',
      '_PPS_',
      '_DETAILS_'
    );
  "

  local query
  query=${QUERY_TEMPLATE//_ACTOR_/$ACTOR}
  query=${query//_ACTION_/$ACTION}
  query=${query//_VICTIM_/$VICTIM}
  query=${query//_DIRECTION_/$DIRECTION}
  query=${query//_PPS_/$PPS}
  query=${query//_DETAILS_/$DETAILS}

  $MYSQL $MYSQL_DB <<< "$query"
}
