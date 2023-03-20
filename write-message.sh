#!/usr/bin/env bash

set -eu

if [ -z ${MESSAGE_DB_HOME+x} ]; then
  echo "MESSAGE_DB_HOME is not set"
  exit 1
else
  echo "MESSAGE_DB_HOME is $MESSAGE_DB_HOME"
fi

cd $MESSAGE_DB_HOME

database/write-test-message.sh
