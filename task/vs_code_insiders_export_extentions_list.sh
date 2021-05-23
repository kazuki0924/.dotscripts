#!/usr/local/bin/bash

DIR=$HOME/.dotfiles/.config/vs-code
echo mkdir: created directory "$DIR"
mkdir -p "$DIR"
cd "$DIR"

FILENAME="extensions.txt"

trash-put "$FILENAME"
code-insiders --list-extensions >"$FILENAME"
