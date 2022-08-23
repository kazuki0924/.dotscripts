#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# python: install with pyenv interactively

REQUIREMENTS=(
  pyenv
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "${REQUIREMENT}" &>/dev/null || brew install "${REQUIREMENT}"
done

brew update
brew upgrade pyenv --fetch-HEAD

echo "Choose which version of python to be installed globally:"
# fuzzy find versions in reverse order
VERSION=$(pyenv install --list | tac | fzf --layout=reverse --height=20%)
pyenv install "${VERSION//[[:space:]]/}"
pyenv global "${VERSION//[[:space:]]/}"
pip install --upgrade pip

echo ""
echo "Installed python versions:"
pyenv versions

