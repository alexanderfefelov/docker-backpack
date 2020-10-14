readonly THIS_SCRIPT=$(realpath "$0")
readonly THIS_SCRIPT_HOME=$(dirname "$THIS_SCRIPT")
. "$THIS_SCRIPT_HOME"/lib.sh

readonly HOST=$1
readonly HOST_=${HOST//./_}

NAME="${HOST_}___backup-dkron-jobs"
DISPLAY_NAME="Backup Dkron jobs @ $HOST"
COMMAND='curl --fail --silent http://localhost:8080/v1/jobs > \"/var/lib/dkron/backup/$(hostname -f)-$(date -Iseconds)-dkron-jobs.json\"'
SCHEDULE="@every 4h"
UUID=$(uuidgen)
export HOST NAME DISPLAY_NAME COMMAND SCHEDULE UUID
job=$(envsubst <<< "$JOB_TEMPLATE")
response=$(execute_post_request jobs <<< "$job")

NAME="${HOST_}___remove-old-dkron-backups"
DISPLAY_NAME="Remove old Dkron backups @ $HOST"
COMMAND='find /var/lib/dkron/backup -type f -mtime +7 -exec rm {} \\;'
SCHEDULE="@every 8h"
UUID=$(uuidgen)
export HOST NAME DISPLAY_NAME COMMAND SCHEDULE UUID
job=$(envsubst <<< "$JOB_TEMPLATE")
response=$(execute_post_request jobs <<< "$job")

NAME="${HOST_}___remove-old-dkron-logs"
DISPLAY_NAME="Remove old Dkron logs @ $HOST"
COMMAND='find /var/log/dkron -type f -mtime +7 -exec rm {} \\;'
SCHEDULE="@every 8h"
UUID=$(uuidgen)
export HOST NAME DISPLAY_NAME COMMAND SCHEDULE UUID
job=$(envsubst <<< "$JOB_TEMPLATE")
response=$(execute_post_request jobs <<< "$job")
