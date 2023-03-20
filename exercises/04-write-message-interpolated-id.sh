#!/usr/bin/env bash

set -eu

if [ -z ${MESSAGE_DB_HOME+x} ]; then
  echo "MESSAGE_DB_HOME is not set"
  exit 1
else
  echo "MESSAGE_DB_HOME is $MESSAGE_DB_HOME"
fi

message_id=$(echo $(uuidgen) | tr '[:upper:]' '[:lower:]')

echo "Message ID is $message_id"

./clear-messages.sh

./psql.sh -f exercises/04-write-message-interpolated-id.sql --variable message_id="$message_id"

./print-messages.sh
