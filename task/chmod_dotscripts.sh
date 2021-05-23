#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# chmod all .sh files in .dotscripts directory

mapfile -t FILES < <(fd -e sh . "$HOME/.dotscripts")

for FILE in "${FILES[@]}"; do
  echo chmod 777 "$FILE"
  chmod 777 "$FILE"
done
