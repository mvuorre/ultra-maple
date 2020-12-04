#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5fca2f8affd10e001e1b5f18/webhook/build/pull > /dev/null
curl -s -X POST https://api.stackbit.com/project/5fca2f8affd10e001e1b5f18/webhook/build/ssgbuild > /dev/null
make prepare && hugo --source demo --baseURL "/"
curl -s -X POST https://api.stackbit.com/project/5fca2f8affd10e001e1b5f18/webhook/build/publish > /dev/null
