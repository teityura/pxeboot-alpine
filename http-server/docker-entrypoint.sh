#!/bin/sh

set -e

ls -al ./

ls -al ./docker-entrypoint.d/

find ./docker-entrypoint.d/ -type f | sh

exec "$@"
