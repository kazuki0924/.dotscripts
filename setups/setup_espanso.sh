#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# espanso

REQUIREMENTS=(
  espanso
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

espanso register
espanso start
espanso install all-emojis
espanso install basic-emojis
espanso install mac-symbols
espanso restart
