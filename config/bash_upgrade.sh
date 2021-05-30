#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

brew install bash

REQUIREMENTS=(
  nvim
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

sudo -s
echo /usr/local/bin/bash >> /etc/shells
