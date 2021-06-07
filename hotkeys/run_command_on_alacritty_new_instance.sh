#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

nohup alacritty -e $SHELL -c "${1-"lsd -1 -a -l"}; $SHELL" >/dev/null &
