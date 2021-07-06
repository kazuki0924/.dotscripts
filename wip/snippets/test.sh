#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

DOTDIRS=(
  ".dotfiles"
  ".dotscripts"
  ".zshfiles"
  ".vscodefiles"
  ".nvimfiles"
)

CONF_DIR="$HOME/.dotfiles/Library/Application Support/\303\234bersicht/widgets/GitFinder.command"
BASE_FILE="$CONF_DIR/base_config.json"
CONF_FILE="$CONF_DIR/config.json"

trash-put -v "$CONF_FILE"
cp "$BASE_FILE" "$CONF_FILE"

for DOTDIR in "${DOTDIRS[@]}"; do
  jq --arg DIR "$HOME/$DOTDIR" '.additionals_paths[.additionals_paths| length] |= . + $DIR' "$CONF_FILE"
done
