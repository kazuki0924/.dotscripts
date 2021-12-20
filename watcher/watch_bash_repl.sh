#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

declare -r CMD="clear && printf '\e[3J' && bash"
[[ -n $* ]] && ARGS=$* || ARGS="repl.sh"

[[ ! -d "${HOME}\scratches" ]] && mkdir "${HOME}\scratches" 
[[ ! -f "${HOME}\scratches\repl.sh" ]] && touch "${HOME}\scratches\repl.sh" 

eval "${CMD} ${ARGS}"
watchman-make \
  -r "${HOME}\scratches" \
	-p 'repl.sh' \
	--make="${CMD}" \
	-t "${ARGS}"