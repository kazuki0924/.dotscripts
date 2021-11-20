#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Wally

if ! which wally-cli &>/dev/null; then
  brew install libusb
  go get -u github.com/zsa/wally-cli
fi

FILE=$(fd -e .bin -1 . "$HOME/Downloads")
wally-cli "$FILE"
trash-put -v "$FILE"
