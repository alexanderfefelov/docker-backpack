readonly ALERTMANAGER_HOST=${ALERTMANAGER_HOST:-alertmanager.test}
readonly ALERTMANAGER_PORT=${ALERTMANAGER_PORT:-9093}

readonly HTTP="http --check-status"
readonly API=http://$ALERTMANAGER_HOST:$ALERTMANAGER_PORT/api/v2

readonly ALERT_TEMPLATE='
  {
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
  }
'

create_alert() {
  local -r ALERT_NAME=$1 SEVERITY=$2 ENV=$3 ACTOR=$4 ACTION=$5 VICTIM=$6 SUMMARY=$7 DESCRIPTION=$8

  local alert
  alert=${ALERT_TEMPLATE//_ALERT_NAME_/"$ALERT_NAME"}
  alert=${alert//_SEVERITY_/"$SEVERITY"}
  alert=${alert//_ENV_/"$ENV"}
  alert=${alert//_ACTOR_/"$ACTOR"}
  alert=${alert//_ACTION_/"$ACTION"}
  alert=${alert//_VICTIM_/"$VICTIM"}
  alert=${alert//_SUMMARY_/"$SUMMARY"}
  alert=${alert//_DESCRIPTION_/"$DESCRIPTION"}

  local -r ALERTS="
    [
      $alert
    ]
  "

  echo $ALERTS | $HTTP POST $API/alerts
}
