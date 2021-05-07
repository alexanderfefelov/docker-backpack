#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

nc -z -u localhost 1812
nc -z -u localhost 1813
radtest healthcheck_shaemu8ufooj johch5quolup localhost:1812 42 phohtee8reak
