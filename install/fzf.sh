#!/usr/local/bin/bash

# fzf

REQUIREMENTS=(
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

/usr/local/opt/fzf/install --key-bindings --completion --no-update-rc