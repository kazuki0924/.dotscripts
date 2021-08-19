#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Übersicht: setup
# https://github.com/felixhageloh/uebersicht
# https://tracesof.net/uebersicht/

# manually configured widgets:

# nightshades
# https://github.com/Porco-Rosso/Ubersicht-Nightshades
# ubersicht-calendar
# https://github.com/kknopper/ubersicht-calendar
# fancy-datetime
# https://github.com/codeFareith/uebersicht-FancyDateTime
# GitFinder Widget
# https://github.com/atika/Ubersicht-GitFinder

# Requirements:
! [ -d "/Applications/Übersicht.app" ] && brew install ubersicht --cask

REQUIREMENTS=(
  jq
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

# GitFinder: generate config file

DOTDIRS=(
  ".dotfiles"
  ".dotscripts"
  ".zshfiles"
  ".vscodefiles"
  ".golandfiles"
  ".nvimfiles"
)

DIR="Library/Application Support"
UBER_DIR="$HOME/$DIR/Übersicht"
UBER_DOT_DIR="$HOME/.dotfiles/$DIR/Übersicht"
WIDGETS_DIR="commands/GitFinder.command"
CONF_DIR="$UBER_DIR/$WIDGETS_DIR"
CONF_DOT_DIR="$UBER_DOT_DIR/$WIDGETS_DIR"
BASE_FILE="$CONF_DOT_DIR/base_config.json"
CONF_FILE="$CONF_DIR/config.json"
CONF_DOT_FILE="$CONF_DOT_DIR/config.json"
TEMP_FILE="$CONF_DOT_DIR/temp.json"

[ -f "$CONF_DOT_FILE" ] && trash-put -v "$CONF_DOT_FILE"
cp "$BASE_FILE" "$CONF_DOT_FILE"

for DOTDIR in "${DOTDIRS[@]}"; do
  jq --arg DIR "$HOME/$DOTDIR" '.additionals_paths[.additionals_paths| length] += $DIR' "$CONF_DOT_FILE" >"$TEMP_FILE"
  trash-put -v "$CONF_DOT_FILE"
  cp "$TEMP_FILE" "$CONF_DOT_FILE"
done

trash-put -v "$TEMP_FILE"

ln -sfnv "$CONF_DOT_FILE" "$CONF_FILE"

WIDGETS_DIR="$UBER_DIR/widgets"

if ! [ -d "$WIDGETS_DIR/simple-bar" ]; then
  git clone https://github.com/Jean-Tinland/simple-bar "$WIDGETS_DIR/simple-bar"
fi
