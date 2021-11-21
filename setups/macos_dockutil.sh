#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'


# Dock: replace items

# Requirements:
# dockutil

defaults write com.apple.dock persistent-apps -array

APPS_TO_ADD=(
  Alacritty
  iTerm
  "Google Chrome"
  "Visual Studio Code - Insiders"
  Slack
  Notion
)

for APP in "${APPS_TO_ADD[@]}"; do
  dockutil --add "/Applications/$APP.app"
done
