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


instances=10

for (( i=1; i<=instances; i++ )); do
  random_category=$(category)
  stream_name=$(stream-name $random_category)
  write-message $stream_name
done

./print-messages.sh

echo "» 10 messages written. Press enter to continue."
read


category=$(category)

echo "Category:"
echo $category
echo

instances=3

for (( i=1; i<=instances; i++ )); do
  stream_name=$(stream-name $category)
  write-message "$stream_name"
done

./print-messages.sh

echo "» 3 messages written to category $category. Press enter to continue."
read


echo "Reading messages from category: $category"
echo

get-category-messages "$category"
