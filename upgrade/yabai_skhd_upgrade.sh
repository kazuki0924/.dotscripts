#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# yabai / skhd: upgrade

REQUIREMENTS=(
  "yabai"
  "skhd"
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  brew services stop "$REQUIREMENT"
  brew upgrade "$REQUIREMENT"
done

sudo yabai --uninstall-sa
sudo yabai --install-sa
sudo yabai --load-sa
brew services start yabai
brew services start skhd
