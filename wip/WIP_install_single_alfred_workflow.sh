#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

ALFRED_DIR="$HOME/.dotfiles/assets/alfredworkflow"
COMMUNITY_DIR="$ALFRED_DIR/community"
TMP_DIR="$ALFRED_DIR/tmp"
cp "$COMMUNITY_DIR" "$TMP_DIR"
open "$TMP_DIR"
FILE=$(fd -1 -H -e ".alfredworkflow" "$TMP_DIR")
open "$FILE"
trash-put "$FILE"
