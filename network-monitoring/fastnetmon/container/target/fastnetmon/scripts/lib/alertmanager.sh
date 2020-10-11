readonly ALERTMANAGER_HOST=${ALERTMANAGER_HOST:-alertmanager.test}
readonly ALERTMANAGER_PORT=${ALERTMANAGER_PORT:-9093}

readonly ALERTMANAGER_API=http://$ALERTMANAGER_HOST:$ALERTMANAGER_PORT/api/v2
readonly ALERTMANAGER_HTTP="http --check-status"

#
# Arguments:
#   $1 - significant part of the API URL
#   $2... - request parameters
# Returns:
#   response body
#
execute_post_request() {
  local response=$(
    $ALERTMANAGER_HTTP --body \
      POST $ALERTMANAGER_API/$1 "${@:2}"
  )
  echo $response
}

create_alert() {
  local -r UUID=$1 ALERT_NAME=$2 SEVERITY=$3 ENV=$4 ACTOR=$5 ACTION=$6 VICTIM=$7 SUMMARY=$8

  local -r ALERT_TEMPLATE='{
    "labels": {
      "alertname": "$ALERT_NAME",
      "severity": "$SEVERITY",
      "env": "$ENV",
      "actor": "$ACTOR",
      "action": "$ACTION",
      "victim": "$VICTIM"
    },
    "annotations": {
      "uuid": "$UUID",
      "summary": "$SUMMARY"
    }
  }'

  export UUID ALERT_NAME SEVERITY ENV ACTOR ACTION VICTIM SUMMARY
  local alert=$(envsubst <<< "$ALERT_TEMPLATE")
  local alerts="[
    $alert
  ]"

  execute_post_request alerts <<< "$alerts"
}
