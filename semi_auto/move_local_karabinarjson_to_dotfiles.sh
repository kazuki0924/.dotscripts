#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

FILE=".config/karabiner/karabiner.json"
DOTDIR="$HOME/.dotfiles"
DOTFILE="$DOTDIR/$FILE"
trash-put -v "$DOTFILE"
echo copied local karabiner.json to "$DOTFILE"
cp -v "$HOME/$FILE" "$DOTFILE"
