#!/usr/bin/env bash

set -eu

./clear-messages.sh

./psql.sh -f funds-transfer-dump/funds_transfer_messages.sql

./print-messages.sh
