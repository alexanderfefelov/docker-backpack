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
      "alertname": "_ALERT_NAME_",
      "severity": "_SEVERITY_",
      "env": "_ENV_",
      "actor": "_ACTOR_",
      "action": "_ACTION_",
      "victim": "_VICTIM_"
    },
    "annotations": {
      "uuid": "_UUID_"
      "summary": "_SUMMARY_"
    }
  }'

  local alert
  alert=${ALERT_TEMPLATE//_UUID_/$UUID}
  alert=${alert//_ALERT_NAME_/$ALERT_NAME}
  alert=${alert//_SEVERITY_/$SEVERITY}
  alert=${alert//_ENV_/$ENV}
  alert=${alert//_ACTOR_/$ACTOR}
  alert=${alert//_ACTION_/$ACTION}
  alert=${alert//_VICTIM_/$VICTIM}
  alert=${alert//_SUMMARY_/$SUMMARY}

  local alerts="[
    $alert
  ]"

  execute_post_request alerts <<< $(echo $alerts)
}
