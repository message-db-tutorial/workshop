#!/usr/bin/env bash

set -x

psql message_store -x -U message_store "$@"
