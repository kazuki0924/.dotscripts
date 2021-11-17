#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# fzf

REQUIREMENTS=(
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

/usr/local/opt/fzf/install --bin --key-bindings --completion --no-update-rc
