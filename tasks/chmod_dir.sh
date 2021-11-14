#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Chmod: chmod 755 all .sh files in .dotscripts directory or dir specified in $1

mapfile -t FILES < <(fd -e "${2-sh}" . "${1-$HOME/.dotscripts}")

for FILE in "${FILES[@]}"; do
  echo chmod 755 "$FILE"
  chmod 755 "$FILE"
done
