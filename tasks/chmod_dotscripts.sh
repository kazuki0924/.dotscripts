#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# chmod all .sh files in .dotscripts directory or dir specified in $1

mapfile -t FILES < <(fd -e sh . "${1-$HOME/.dotscripts}")

for FILE in "${FILES[@]}"; do
  echo chmod 777 "$FILE"
  chmod 777 "$FILE"
done
