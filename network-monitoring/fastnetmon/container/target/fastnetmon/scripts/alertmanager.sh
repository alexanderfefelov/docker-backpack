readonly ALERTMANAGER_HOST=${ALERTMANAGER_HOST:-alertmanager.test}
readonly ALERTMANAGER_PORT=${ALERTMANAGER_PORT:-9093}

readonly HTTP="http --check-status"
readonly API=http://$ALERTMANAGER_HOST:$ALERTMANAGER_PORT/api/v2/alerts

readonly ALERT_TEMPLATE='
  {
    "labels": {
      "alertname": "_ALERTNAME_",
      "severity": "_SEVERITY_",
      "env": "_ENV_",
      "actor": "_ACTOR_",
      "action": "_ACTION_",
      "victim": "_VICTIM_"
    },
    "annotations": {
      "summary": "_SUMMARY_",
      "details": "_DETAILS_"
    }
  }
'

create_alert() {
  alertname=$1
  severity=$2
  env=$3
  actor=$4
  action=$5
  victim=$6
  summary=$7
  details=$8

  alert=${ALERT_TEMPLATE//_ALERTNAME_/"$alertname"}
  alert=${alert//_SEVERITY_/"$severity"}
  alert=${alert//_ENV_/"$env"}
  alert=${alert//_ACTOR_/"$actor"}
  alert=${alert//_ACTION_/"$action"}
  alert=${alert//_VICTIM_/"$victim"}
  alert=${alert//_SUMMARY_/"$summary"}
  alert=${alert//_DETAILS_/"$details"}

  alerts="
    [
      $alert
    ]
  "

  echo $alerts | $HTTP POST $API
  ret_code=$?
}
