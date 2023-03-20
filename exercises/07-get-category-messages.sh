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


category=$(category)

echo "Category:"
echo $category
echo


instances=3

for (( i=1; i<=instances; i++ )); do
  stream_name=$(stream-name $category)
  echo "Writing message to stream: $stream_name"
  write-message "$stream_name"
done

./print-messages.sh

echo "» 3 messages written. Press enter to continue."
read


echo "Reading messages from category: $category"
echo

./psql.sh -f exercises/07-get-category-messages.sql \
  --variable category="$category"
