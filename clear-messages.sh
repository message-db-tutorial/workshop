#!/usr/bin/env bash

set -eu

if [ -z ${MESSAGE_DB_HOME+x} ]; then
  echo "MESSAGE_DB_HOME is not set"
  exit 1
fi

cd $MESSAGE_DB_HOME

database/clear-messages.sh
