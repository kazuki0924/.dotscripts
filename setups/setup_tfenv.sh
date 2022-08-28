#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# terraform: install with tfenv interactively

REQUIREMENTS=(
  tfenv
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "${REQUIREMENT}" &>/dev/null || brew install "${REQUIREMENT}"
done

brew update
brew upgrade tfenv --fetch-HEAD

echo "Choose which version of terraform to be installed globally:"
VERSION=$(tfenv list-remote | fzf --layout=reverse --height=20%)
tfenv install "${VERSION//[[:space:]]/}"
tfenv use "${VERSION//[[:space:]]/}"

echo ""
echo "Installed terraform versions:"
tfenv list

