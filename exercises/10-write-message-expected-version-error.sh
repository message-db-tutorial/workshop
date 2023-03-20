#!/usr/bin/env bash

set -eu

if [ -z ${MESSAGE_DB_HOME+x} ]; then
  echo "MESSAGE_DB_HOME is not set"
  exit 1
else
  echo "MESSAGE_DB_HOME is $MESSAGE_DB_HOME"
fi

source exercises/controls.sh

./clear-messages.sh

stream_name=$(stream-name)

echo "Stream Name:"
echo $stream_name
echo

write-message "$stream_name"

./print-messages.sh

expected_version=1

echo "» Message written to $stream_name at position 0"
echo "» Writing next message with an expected version of $expected_version"
echo "» Press enter to continue"
read

message_id=$(echo $(uuidgen) | tr '[:upper:]' '[:lower:]')

./psql.sh -f exercises/09-write-message-expected-version.sql \
  --variable message_id="$message_id" \
  --variable stream_name="$stream_name" \
  --variable expected_version="$expected_version"

./print-messages.sh

