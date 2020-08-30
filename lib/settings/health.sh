# Command to run to check health
#
readonly HEALTH_CMD=/backpack-healthcheck.sh

# Start period for the container to initialize before starting health-retries
# countdown (ms|s|m|h)
#
readonly HEALTH_START_PERIOD=30s

# Time between running the check (ms|s|m|h)
#
readonly HEALTH_INTERVAL=1m

# Maximum time to allow one check to run (ms|s|m|h)
#
readonly HEALTH_TIMEOUT=2s

# Consecutive failures needed to report unhealthy
#
readonly HEALTH_RETRIES=3

readonly DEFAULT_HEALTH_SETTINGS="
  --health-cmd $HEALTH_CMD
  --health-start-period $HEALTH_START_PERIOD
  --health-interval $HEALTH_INTERVAL
  --health-timeout $HEALTH_TIMEOUT
  --health-retries $HEALTH_RETRIES
"
