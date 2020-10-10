# Logging priorities
#
readonly LOGGER_PRIORITY_NOTICE=${LOGGER_PRIORITY_NOTICE:-user.notice}
readonly LOGGER_PRIORITY_ERROR=${LOGGER_PRIORITY_ERROR:-user.error}

# Remote syslog settings
#
readonly LOGGER_SYSLOG_HOST=${LOGGER_SYSLOG_HOST:-syslog.test}
readonly LOGGER_SYSLOG_PORT=${LOGGER_SYSLOG_PORT:-514}

# Predefined loggers
#
readonly LOGGER_IMPL_NO_OP=:
readonly LOGGER_IMPL_SYSLOG=logger
readonly LOGGER_IMPL_REMOTE_SYSLOG="logger --server $LOGGER_SYSLOG_HOST --port $LOGGER_SYSLOG_PORT --udp --rfc3164"

readonly LOGGER=${LOGGER:-$LOGGER_IMPL_REMOTE_SYSLOG}

log_notice() {
  local -r TIMESTAMP=$(date --iso-8601=seconds)
  local -r MESSAGE="[$BASHPID] $(basename "$SCRIPT"): $@"
  echo "$TIMESTAMP $MESSAGE"
  $LOGGER --priority $LOGGER_PRIORITY_NOTICE $MESSAGE
}

log_error() {
  local -r TIMESTAMP=$(date --iso-8601=seconds)
  local -r MESSAGE="[$BASHPID] $(basename "$SCRIPT"): $@"
  echo "$TIMESTAMP $MESSAGE" >&2
  $LOGGER --priority $LOGGER_PRIORITY_ERROR $MESSAGE
}
