readonly HOST="$1"
readonly HOST2="${HOST//./_}"

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

NAME="${HOST2}___backup-dkron-jobs"
DISPLAY_NAME="Backup Dkron jobs @ $HOST"
COMMAND='curl --fail --silent http://localhost:8080/v1/jobs > \"/var/lib/dkron/backup/$(hostname -f)-$(date -Iseconds)-dkron-jobs.json\"'
SCHEDULE="@every 4h"
UUID=$(uuidgen)
export HOST NAME DISPLAY_NAME COMMAND SCHEDULE UUID
job=$(envsubst <<< "$JOB_TEMPLATE")
response=$(execute_post_request jobs <<< "$job")

NAME="${HOST2}___remove-old-dkron-backups"
DISPLAY_NAME="Remove old Dkron backups @ $HOST"
COMMAND='find /var/lib/dkron/backup/* -type f -mtime +7 -exec rm {} \\;'
SCHEDULE="@every 8h"
UUID=$(uuidgen)
export HOST NAME DISPLAY_NAME COMMAND SCHEDULE UUID
job=$(envsubst <<< "$JOB_TEMPLATE")
response=$(execute_post_request jobs <<< "$job")

NAME="${HOST2}___remove-old-dkron-logs"
DISPLAY_NAME="Remove old Dkron logs @ $HOST"
COMMAND='find /var/log/dkron/* -type f -mtime +7 -exec rm {} \\;'
SCHEDULE="@every 8h"
UUID=$(uuidgen)
export HOST NAME DISPLAY_NAME COMMAND SCHEDULE UUID
job=$(envsubst <<< "$JOB_TEMPLATE")
response=$(execute_post_request jobs <<< "$job")
