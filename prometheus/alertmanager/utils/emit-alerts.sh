#!/usr/bin/env bash

readonly HTTP="http --verbose --check-status"
readonly API=http://alertmanager.backpack.test:9093/api/v2/alerts
readonly ALERT_TEMPLATE='
  {
    "labels": {
      "alertname": "_ALERTNAME_",
      "env": "_ENV_",
      "level": "_LEVEL_",
      "sensor": "_SENSOR_"
    },
    "annotations": {
      "internal_id": "_INTERNAL_ID_",
      "value": "_VALUE_",
      "summary": "_SUMMARY_",
      "description": "_DESCRIPTION_"
    },
    "generatorURL": "_GENERATOR_URL_"
  }
'

roll_dice() {
  echo $(($RANDOM % 6 + 1))
}

get_env() {
  case $(roll_dice) in
    1)
      env=production
      ;;
    [2-4])
      env=staging
      ;;
    5)
      env=development
      ;;
    *)
      env=unknown
      ;;
  esac
  echo $env
}

get_level() {
  case $(roll_dice) in
    1)
      level=critical
      ;;
    [2-3])
      level=error
      ;;
    [4-5])
      level=warning
      ;;
    *)
      level=yoohoo
      ;;
  esac
  echo $level
}

for i in {1..42}; do
  alertname="Parameter value is amazing"
  env=$(get_env)
  level=$(get_level)
  sensor=$(roll_dice)
  internal_id=$(head --bytes 10 /dev/random | base32)
  value=$RANDOM
  summary="[$i] $(lorem -s 1)"
  description=$(lorem -s 3)
  generator_url="http:\/\/foo.bar.baz.backpack.test\/$internal_id"

  alert=$(
    echo $ALERT_TEMPLATE \
      | sed "s/_ALERTNAME_/$alertname/g" \
      | sed "s/_ENV_/$env/g" \
      | sed "s/_LEVEL_/$level/g" \
      | sed "s/_SENSOR_/$sensor/g" \
      | sed "s/_INTERNAL_ID_/$internal_id/g" \
      | sed "s/_VALUE_/$value/g" \
      | sed "s/_SUMMARY_/$summary/g" \
      | sed "s/_DESCRIPTION_/$description/g" \
      | sed "s/_GENERATOR_URL_/$generator_url/g"
  )
  alerts="
    [
      $alert
    ]
  "

  echo $alerts | $HTTP POST $API
done
