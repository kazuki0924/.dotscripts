#!/usr/local/bin/bash

DIR=$HOME/.dotfiles/.config/vs-code
echo mkdir: created directory "$DIR"
mkdir -p "$DIR"
cd "$DIR"

FILENAME="extensions.txt"

# install extensions
while read -r LINE; do
  code-insiders --force --install-extension "$LINE"
done <"$FILENAME"
