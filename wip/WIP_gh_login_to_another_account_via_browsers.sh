#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# change default browser
"$HOME"/.dotscripts/macos/defaultbrowser.sh

# login to gh using the selected browser
gh auth logout
sleep 1
gh auth login
