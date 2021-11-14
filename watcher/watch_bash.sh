#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

declare -r CMD="clear && printf '\e[3J' && bash"
[[ -n $* ]] && ARGS=$* || ARGS="$HOME/.dotscripts/watcher_entrypoint.sh"

eval "$CMD $ARGS"
watchman-make \
	-p '*.sh' \
	--make="$CMD" \
	-t "$ARGS"
