#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Command Line Tools
set +e
if ! xcode-select --install; then
  softwareupdate --all --install --force
fi
set -e
