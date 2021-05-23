#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

FILE="$HOME/.dotfiles/.config/vs-code/extensions.txt"

# install extensions
while read -r LINE; do
  code-insiders --force --install-extension "$LINE"
done <"$FILE"
