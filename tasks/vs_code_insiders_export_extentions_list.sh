#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

DIR=$HOME/.dotfiles/.config/vs-code
echo mkdir: created directory "$DIR"
mkdir -p "$DIR"
FILENAME="extensions.txt"

trash-put "$FILENAME"
code-insiders --list-extensions >"$DIR/$FILENAME"
