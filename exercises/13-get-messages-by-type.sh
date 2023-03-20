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

instances=3

message_type_a="A"
message_type_b="B"

for (( i=1; i<=instances; i++ )); do
  stream_name=$(stream-name)
  echo "Writing messages to stream: $stream_name"
  write-message "$stream_name" "$message_type_a"
  write-message "$stream_name" "$message_type_b"
done


echo "» List messages of type A"
echo "» Press enter to continue"
read

./psql.sh -f exercises/13-get-messages-by-type.sql \
  --variable message_type="$message_type_a"
