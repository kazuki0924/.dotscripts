#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# pip: install packages with pip install

# vimiv
# https://github.com/karlch/vimiv
pip install -U --user pyexiv2
pip install -U --user git+https://github.com/karlch/vimiv-qt/

# edir
# https://github.com/bulletmark/edir
pip install -U --user edir

# pynvim
# https://github.com/neovim/pynvim
pip install -U --user pynvim

# vint
# https://github.com/Vimjas/vint
pip install -U --user vim-vint

# sqlfluff
# https://github.com/sqlfluff/sqlfluff
pip install -U --user sqlfluff

# pytest-testinfra
# https://github.com/pytest-dev/pytest-testinfra
pip install -U --user pytest-testinfra

# paramiko
# https://github.com/paramiko/paramiko
pip install -U --user paramiko
