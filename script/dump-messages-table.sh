#!/usr/bin/env bash

set -eEuo pipefail

echo
echo "Dump Messages Table"
echo "= = ="
echo

pg_dump message_store --table message_store.messages --data-only --inserts
