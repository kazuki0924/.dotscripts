#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# node.js: install with fnm interactively

REQUIREMENTS=(
  fnm
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "${REQUIREMENT}" &>/dev/null || brew install "${REQUIREMENT}"
done

brew upgrade fnm --fetch-HEAD

# fnm
echo "Choose which version of node.js to be installed globally:"
# fuzzy find versions in reverse order
VERSION=$(fnm ls-remote | tac | fzf --layout=reverse --height=20%)
fnm install "${VERSION//[[:space:]]/}"
fnm default "${VERSION//[[:space:]]/}"
 
echo ""
echo "fnm current:"
fnm current

