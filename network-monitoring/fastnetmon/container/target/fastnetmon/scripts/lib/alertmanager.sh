readonly ALERTMANAGER_HOST=${ALERTMANAGER_HOST:-alertmanager.test}
readonly ALERTMANAGER_PORT=${ALERTMANAGER_PORT:-9093}

readonly ALERTMANAGER_API=http://$ALERTMANAGER_HOST:$ALERTMANAGER_PORT/api/v2
readonly ALERTMANAGER_HTTP="http --check-status --ignore-stdin"

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
  local -r ALERT_NAME=$1 SEVERITY=$2 ENV=$3 ACTOR=$4 ACTION=$5 VICTIM=$6 SUMMARY=$7 DESCRIPTION=$8

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
      "summary": "_SUMMARY_",
      "description": "_DESCRIPTION_"
    }
  }'

  local alert
  alert=${ALERT_TEMPLATE//_ALERT_NAME_/"$ALERT_NAME"}
  alert=${alert//_SEVERITY_/"$SEVERITY"}
  alert=${alert//_ENV_/"$ENV"}
  alert=${alert//_ACTOR_/"$ACTOR"}
  alert=${alert//_ACTION_/"$ACTION"}
  alert=${alert//_VICTIM_/"$VICTIM"}
  alert=${alert//_SUMMARY_/"$SUMMARY"}
  alert=${alert//_DESCRIPTION_/"$DESCRIPTION"}

  local alerts="[
    $alert
  ]"

  echo "$alerts" | execute_post_request alerts
}
