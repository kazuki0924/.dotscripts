#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Python:
# - install with pyenv interactively
# - install packages with pip install

REQUIREMENTS=(
  pyenv
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

brew upgrade pyenv --fetch-HEAD

echo Choose which version of python to install globally
# fuzzy find versions filtering out only the numbered ones in reverse order
VERSION=$(pyenv install --list | awk '$0 !~ /[a-z]/' | sort -rn -k 2 -t "." | fzf --layout=reverse --height=20%)
pyenv install "$VERSION"
pyenv global "$VERSION"

echo ""
echo pyenv versions

pyenv versions

# install w/ pip install

echo ""
echo installing with pip...
echo ""

# vimiv
# https://github.com/karlch/vimiv
pip install -U --user pyexiv2
pip install -U --user git+https://github.com/karlch/vimiv-qt/

# edir
# https://github.com/bulletmark/edir
pip install -U --user edir

# pynvim
# https://github.com/neovim/pynvim
python3 -m pip install -U --user pynvim

# vint
# https://github.com/Vimjas/vint
pip install -U --user vim-vint
