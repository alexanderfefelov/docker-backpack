# The maximum size of the log before it is rolled. A positive integer plus
# a modifier representing the unit of measure (k, m, or g)
#
readonly LOG_MAX_SIZE=10m

# The maximum number of log files that can be present. If rolling the logs
# creates excess files, the oldest file is removed
#
readonly LOG_MAX_FILE=10

readonly DEFAULT_LOG_SETTINGS=" \
  --log-opt max-size=$LOG_MAX_SIZE \
  --log-opt max-file=$LOG_MAX_FILE \
"
