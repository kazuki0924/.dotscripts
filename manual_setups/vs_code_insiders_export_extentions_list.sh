#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

DIR=$HOME/.dotfiles/.config/vs-code
FILENAME="extensions.txt"
FILE="$DIR/$FILENAME"

mkdir -p "$DIR"
code-insiders --list-extensions >"$FILE"
