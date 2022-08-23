#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# golang: install with goenv interactively

REQUIREMENTS=(
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "${REQUIREMENT}" &>/dev/null || brew install "${REQUIREMENT}"
done

if [[ ! -d "${HOME}/.goenv" ]]; then
  git clone https://github.com/syndbg/goenv.git "${HOME}/.goenv"
  echo "goenv cloned to ~/.goenv. Run the script again."
  exec "${SHELL}"
else
  cd "${HOME}/.goenv"
  git reset --hard "origin/$(git branch --show-current)"
  git pull
fi

# goenv
echo "Choose which version of golang to be installed globally:"

# fuzzy find versions in reverse order
VERSION=$(goenv install --list | tac | fzf --layout=reverse --height=20%)
goenv install "${VERSION//[[:space:]]/}"
goenv global "${VERSION//[[:space:]]/}"
 
echo ""
echo "Installed golang versions:"
goenv versions
