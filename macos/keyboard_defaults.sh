#!/usr/local/bin/bash
set -euo pipefail

# Keyboard

COMMANDS=(
  "defaults read -g InitialKeyRepeat"
  "defaults read -g KeyRepeat"
  "defaults read -g AppleKeyboardUIMode"
)

function echo_defaults {
  for COMMAND in "${COMMANDS[@]}"; do
    echo "$COMMAND"
    ${COMMAND}
  done
}

echo Before:
echo_defaults

# normal minimum is 15 (225 ms)
defaults write -g InitialKeyRepeat -int 10
# normal minimum is 2 (30 ms)
defaults write -g KeyRepeat -int 1

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write -g AppleKeyboardUIMode -int 3

echo ""
echo After:
echo_defaults
