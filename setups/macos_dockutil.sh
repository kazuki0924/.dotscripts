#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'


# Dock: replace items

# Requirements:
# dockutil

defaults write com.apple.dock persistent-apps -array

APPS_TO_ADD=(
  Alacritty
  "Google Chrome"
  "Visual Studio Code - Insiders"
  Slack
  Notion
)

echo "removing all items from dock..."
dockutil --remove all

for APP in "${APPS_TO_ADD[@]}"; do
  echo "adding ${APP} to dock..."
  dockutil --add "/Applications/${APP}.app"
done
