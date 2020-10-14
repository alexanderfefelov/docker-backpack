readonly HTTP="http --check-status"
readonly API="http://dkron-server-1.backpack.test:8900/v1"

readonly JOB_TEMPLATE='{
  "name": "$NAME",
  "displayname": "$DISPLAY_NAME",
  "disabled": false,
  "schedule": "$SCHEDULE",
  "executor": "shell",
  "executor_config": {
    "shell": "true",
    "command": "$COMMAND"
  },
  "processors": {
    "files": {
      "log_dir": "/var/log/dkron",
      "forward": "true"
    },
    "log": {
      "forward": "true"
    }
  },
  "concurrency": "forbid",
  "retries": 0,
  "timezone": "Europe/Moscow",
  "tags": {
    "host": "$HOST"
  },
  "metadata": {
    "uuid": "$UUID"
  }
}'

execute_post_request() {
  local response=$(
    $HTTP --body \
      POST $API/$1
  )
  echo $response
}
