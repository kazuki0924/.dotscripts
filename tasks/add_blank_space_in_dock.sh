#!/usr/local/bin/bash
set -euo pipefail

# Dock: adds blank space

defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
killall Dock
