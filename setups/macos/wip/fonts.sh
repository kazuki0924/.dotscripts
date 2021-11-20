#!/usr/local/bin/bash
set -euo pipefail

# Fonts: adds fonts not in brew fomulae

cp "$HOME"/.dotfiles/assets/Fonts/* "$HOME"/Library/Fonts
