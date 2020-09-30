#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly WAIT_TIMEOUT=2

echo -e "GET /-/healthy HTTP/1.0\nHost: localhost\n\n" | nc -w $WAIT_TIMEOUT localhost 9093 | grep -q "^OK$"
echo -e "GET /-/ready HTTP/1.0\nHost: localhost\n\n" | nc -w $WAIT_TIMEOUT localhost 9093 | grep -q "^OK$"
