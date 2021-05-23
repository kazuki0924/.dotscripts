#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Dock: adds blank space

defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
killall Dock
