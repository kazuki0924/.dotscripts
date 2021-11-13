#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

nvim "$(fzf --height 40% --reverse)"
