#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Übersicht: setup 
# https://github.com/felixhageloh/uebersicht
# https://tracesof.net/uebersicht/

# Requirements:
! [ -d "/Applications/Übersicht.app" ] && brew install ubersicht --cask

WIDGETS_DIR="$HOME/Library/Application Support/Übersicht/widgets"

if ! [ -d "$WIDGETS_DIR/simple-bar" ]; then
  git clone https://github.com/Jean-Tinland/simple-bar "$WIDGETS_DIR/simple-bar"
fi

# manually configured widgets:

# nightshades
# https://github.com/Porco-Rosso/Ubersicht-Nightshades
# ubersicht-calendar
# https://github.com/kknopper/ubersicht-calendar
# fancy-datetime
# https://github.com/codeFareith/uebersicht-FancyDateTime
# GitFinder Widget
# https://github.com/atika/Ubersicht-GitFinder

# Todo: use jq for config.json
# "Library/Application Support/\303\234bersicht/widgets/GitFinder.command/base_config.json"
