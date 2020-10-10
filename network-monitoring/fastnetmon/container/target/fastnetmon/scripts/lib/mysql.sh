readonly MYSQL_HOST=${MYSQL_HOST:-mysql.test}
readonly MYSQL_PORT=${MYSQL_PORT:-3306}
readonly MYSQL_DB=${MYSQL_DB:-db}
readonly MYSQL_USERNAME=${MYSQL_USERNAME:-username}
readonly MYSQL_PASSWORD=${MYSQL_PASSWORD:-password}

readonly MYSQL="mysql --host=$MYSQL_HOST --port=$MYSQL_PORT --user=$MYSQL_USERNAME --password=$MYSQL_PASSWORD"

store_fact() {
  local -r UUID=$1 ACTOR=$2 ACTION=$3 VICTIM=$4 DIRECTION=$5 PPS=$6 DETAILS=$7

  local -r QUERY_TEMPLATE="
    INSERT INTO fact(uuid, actor, action, victim, direction, pps, details) VALUES(
      '_UUID_',
      '_ACTOR_',
      '_ACTION_',
      inet_aton('_VICTIM_'),
      '_DIRECTION_',
      '_PPS_',
      '_DETAILS_'
    );
  "

  local query
  query=${QUERY_TEMPLATE//_UUID_/$UUID}
  query=${query//_ACTOR_/$ACTOR}
  query=${query//_ACTION_/$ACTION}
  query=${query//_VICTIM_/$VICTIM}
  query=${query//_DIRECTION_/$DIRECTION}
  query=${query//_PPS_/$PPS}
  query=${query//_DETAILS_/$DETAILS}

  $MYSQL $MYSQL_DB <<< "$query"
}
