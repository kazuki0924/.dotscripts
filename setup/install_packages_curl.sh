#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# air
curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b "$(go env GOPATH)"/bin
