#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# yabai / skhd: brew services
# https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)

REQUIREMENTS=(
  "koekeishiya/formulae/yabai"
  "koekeishiya/formulae/skhd"
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

echo "$(whoami) ALL = (root) NOPASSWD: /usr/local/bin/yabai --load-sa" | pbcopy
sudo visudo -f /private/etc/sudoers.d/yabai

sudo yabai --install-sa
sudo yabai --load-sa
brew services start yabai
brew services start skhd
