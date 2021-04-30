#!/bin/sh

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

[ $(supervisorctl status | grep --count --invert-match RUNNING) = 0 ]
