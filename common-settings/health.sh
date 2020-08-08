# Command to run to check health
HEALTH_CMD=/healthcheck.sh
# Start period for the container to initialize before starting health-retries countdown (ms|s|m|h)
HEALTH_START_PERIOD=30s
# Time between running the check (ms|s|m|h)
HEALTH_INTERVAL=1m
# Maximum time to allow one check to run (ms|s|m|h)
HEALTH_TIMEOUT=2s
# Consecutive failures needed to report unhealthy
HEALTH_RETRIES=3
