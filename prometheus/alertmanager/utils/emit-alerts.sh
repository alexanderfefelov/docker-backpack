#!/usr/bin/env bash

. lib.sh

readonly ALERT_TEMPLATE='{
  "startsAt": "$STARTS_AT",
  "endsAt": "$ENDS_AT",
  "labels": {
    "alertname": "$ALERT_NAME",
    "env": "$ENV",
    "level": "$LEVEL",
    "sensor": "$SENSOR"
  },
  "annotations": {
    "internal_id": "$INTERNAL_ID",
    "value": "$VALUE",
    "summary": "$SUMMARY",
    "description": "$DESCRIPTION"
  },
  "generatorURL": "$GENERATOR_URL"
}'

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
  echo $i

  ALERT_NAME="Parameter value is amazing"
  ENV=$(get_env)
  LEVEL=$(get_level)
  SENSOR=$(roll_dice)
  INTERNAL_ID=$(head --bytes 10 /dev/random | base32)
  VALUE=$RANDOM
  SUMMARY="[$i] $(lorem -p 3 | tr '\n' ' ')"
  DESCRIPTION=$(lorem -p 3 | tr '\n' ' ')
  GENERATOR_URL="http:\/\/foo.bar.baz.backpack.test\/$internal_id"
  STARTS_AT=$(date --iso-8601=seconds --date "-1$(roll_dice) minutes")
  ENDS_AT=$(date --iso-8601=seconds --date "+$(roll_dice) hours")

  export ALERT_NAME ENV LEVEL SENSOR INTERNAL_ID VALUE SUMMARY DESCRIPTION GENERATOR_URL STARTS_AT ENDS_AT
  alert=$(envsubst <<< "$ALERT_TEMPLATE")
  alerts="[
    $alert
  ]"

  response=$(execute_post_request alerts <<< $(echo $alerts))
done
