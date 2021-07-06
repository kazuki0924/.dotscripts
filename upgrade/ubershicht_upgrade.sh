#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Übersicht: upgrade 
brew upgrade --cask ubersicht

WIDGETS_DIR="$HOME/Library/Application Support/Übersicht/widgets"

echo git pull "$WIDGETS_DIR/simple-bar"
cd "$WIDGETS_DIR/simple-bar" && git pull && echo cd - && cd -
