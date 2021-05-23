#!/usr/local/bin/bash
set -euo pipefail

# Dock: defaults

COMMANDS=(
  "defaults read com.apple.dock orientation"
  "defaults read com.apple.dock autohide"
  "defaults read com.apple.dock tilesize"
  "defaults read com.apple.dock show-recents"
  "defaults read com.apple.dock mineffect"
  "defaults read com.apple.dock enable-spring-load-actions-on-all-items"
  "defaults read com.apple.dock showhidden"
)

function echo_commands {
  for COMMAND in "${COMMANDS[@]}"; do
    echo "$COMMAND"
    ${COMMAND}
  done
}

echo Before:
echo_commands

defaults write com.apple.dock orientation -string bottom
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock mineffect -string suck
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
defaults write com.apple.dock showhidden -boolean true

echo ""
echo After:
echo_commands
