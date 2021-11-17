#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# golang: install packages with go get

# install w/ go get
env GO111MODULE=on >/dev/null 2>&1

# slit
# https://github.com/tigrawap/slit
go get -u github.com/tigrawap/slit/cmd/slit

# pistol
# https://github.com/doronbehar/pistol
go get -u github.com/doronbehar/pistol/cmd/pistol
