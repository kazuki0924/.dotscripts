#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# golang: install with goenv interactively

REQUIREMENTS=(
  goenv
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

brew upgrade goenv --fetch-HEAD

# goenv
echo Choose which version of go to install globally
# fuzzy find versions filtering out only the numbered ones in reverse order
VERSION=$(goenv install --list | awk '$0 !~ /[a-z]/' | sort -rn -k 2 -t "." | fzf --layout=reverse --height=20%)
goenv install "${VERSION//[[:space:]]/}"
goenv global"${VERSION//[[:space:]]/}"
 
echo ""
echo goenv versions
goenv versions
