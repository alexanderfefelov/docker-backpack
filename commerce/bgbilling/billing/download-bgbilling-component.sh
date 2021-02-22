#!/usr/bin/env bash

readonly COMPONENT=${1?Component is not specified}
readonly VERSION=${2?Version not specified}
readonly SET=${3?Set is not specified}

readonly base_version_url=https://bgbilling.ru/download/$VERSION
readonly base_set_url=$base_version_url/sets/$SET
readonly files_dat_url=$base_set_url/files.dat
readonly zip_file=$(http --body GET $files_dat_url | grep '^name:'$COMPONENT'\s' | awk --field-separator '\t|:' '{print $4}')
readonly zip_url=$base_set_url/$zip_file
http --download --check-status $zip_url
