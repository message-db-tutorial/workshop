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

for (( i=1; i<=instances; i++ )); do
  write-message "$stream_name"
done

./print-messages.sh

echo "» 3 messages written. Press enter to continue."
read


echo "Reading messages from stream: $stream_name"
echo

./psql.sh -f exercises/05-get-stream-messages.sql \
  --variable stream_name="$stream_name"
