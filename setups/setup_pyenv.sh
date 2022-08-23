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

echo "Choose which version of python to install globally:"
# fuzzy find versions filtering out only the out-of-beta ones in reverse order
VERSION=$(pyenv install --list | awk '$0 !~ /[a-z]/' | sort -rn -k 2 -t "." | fzf --layout=reverse --height=20%)
pyenv install "${VERSION//[[:space:]]/}"
pyenv global "${VERSION//[[:space:]]/}"
pip install --upgrade pip

echo ""
echo pyenv versions
echo "Installed python versions:"
pyenv versions

