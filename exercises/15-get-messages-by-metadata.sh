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

metadata='{"someMetaAttribute": "some meta value"}'
write-message-with-metadata "$stream_name" "$message_type" "$data" "$metadata"

metadata='{"someMetaAttribute": "some other meta value"}'
write-message-with-metadata "$stream_name" "$message_type" "$data" "$metadata"

metadata='{"someMetaAttribute": "yet another meta value"}'
write-message-with-metadata "$stream_name" "$message_type" "$data" "$metadata"

./print-messages.sh


some_meta_attribute_value="some other meta value"

echo "» Get message whose someMetaAttribute data value is \"$some_meta_attribute_value\""
echo "» Press enter to continue"
read

./psql.sh -f exercises/15-get-messages-by-metadata.sql \
  --variable some_meta_attribute_value="$some_meta_attribute_value"
