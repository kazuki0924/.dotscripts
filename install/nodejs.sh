#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

REQUIREMENTS=(
  "fnm --HEAD"
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "$REQUIREMENT" &>/dev/null || brew install "$REQUIREMENT"
done

brew upgrade fnm --fetch-HEAD

# fnm completions for zsh
fnm completions --shell zsh | tee >"$HOME/.dotfiles/.config/zsh/completions/_fnm"
(
  cd "$HOME"/.dotscripts
  make symlink &>/dev/null
)

# fnm
echo Choose which version of Node.js to install globally
# fuzzy find versions filtering out only the numbered ones in reverse order
VERSION="v$(fnm ls-remote | cut -c 2- | awk '$0 !~ /[a-z]/' | sort -rn -k 1 -t "." | fzf --layout=reverse --height=20%)"
fnm install "$VERSION"
fnm default "$VERSION"

echo ""
echo fnm current

fnm current

# install w/ npm install

echo ""
echo installing with npm...
echo ""

# tldr
# https://github.com/tldr-pages/tldr
npm i -g tldr

# bash-language-server
# https://github.com/bash-lsp/bash-language-server
npm i -g bash-language-server
