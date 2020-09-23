#!/usr/bin/env bash

grep --invert-match --regexp="^#" --regexp="^\s*$" /create-accounts.data | \
while IFS=: read -r username password roles; do
  echo -n Creating account $username with roles $roles...
  # https://www.elastic.co/guide/en/elasticsearch/reference/current/users-command.html
  elasticsearch-users useradd $username -p $password -r $roles
  echo done
done
