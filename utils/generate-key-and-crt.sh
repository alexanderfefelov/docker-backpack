#!/usr/bin/env bash

readonly NAME=$(petname --complexity 2)
toilet --termwidth -f smblock $NAME
openssl req \
  -subj "/C=/ST=github.com/L=alexanderfefelov/O=docker-backpack/CN=$NAME" \
  -newkey rsa:2048 -nodes -keyout $NAME.key \
  -x509 -days 365 -out $NAME.crt
