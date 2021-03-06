#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Neovim: install plugins

REQUIREMENTS=(
  nvim
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT" --HEAD
done

nvim --headless +PlugInstall +qa
nvim +PlugInstall
