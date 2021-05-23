#!/usr/local/bin/bash
set -euo pipefail

# Useful links
# https://macos-defaults.com/

# kill System Preferences
osascript -e 'tell application "System Preferences" to quit'

# sudo
sudo -v
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

# Todo:
# disable animations?

for app in "Activity Monitor" \
	"cfprefsd" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"SystemUIServer"; do
	killall "${app}" &>/dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
