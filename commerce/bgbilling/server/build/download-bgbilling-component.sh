#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly COMPONENT=${1?Component is not specified}
readonly RELEASE=${2?Release not specified}
readonly SET=${3?Set is not specified}

readonly base_release_url=https://bgbilling.ru/download/$RELEASE
readonly base_set_url=$base_release_url/sets/$SET
readonly files_dat_url=$base_set_url/files.dat
readonly zip_file=$(wget --quiet $files_dat_url --output-document=- | grep '^name:'$COMPONENT'\s' | awk -F '\t|:' '{print $4}')
readonly zip_url=$base_set_url/$zip_file
wget --quiet $zip_url
echo $zip_file
