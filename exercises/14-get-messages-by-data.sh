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

echo "Writing messages to stream: $stream_name"
echo

stream_name=$(stream-name)
message_type=$(type)


data='{"someAttribute": "some value"}'
write-message "$stream_name" "$message_type" "$data"

data='{"someAttribute": "some other value"}'
write-message "$stream_name" "$message_type" "$data"

data='{"someAttribute": "yet another value"}'
write-message "$stream_name" "$message_type" "$data"

./print-messages.sh


some_attribute_value="some other value"

echo "» Get message whose someAttribute data value is \"$some_attribute_value\""
echo "» Press enter to continue"
read

./psql.sh -f exercises/14-get-messages-by-data.sql \
  --variable some_attribute_value="$some_attribute_value"
