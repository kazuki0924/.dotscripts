#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

WORK_DIR="${HOME}/scratches"
WORK_FILE="repl.sh"

declare -r CMD="clear && printf '\e[3J' && bash"
[[ -n $* ]] && FILE=$* || FILE="${WORK_DIR}/${WORK_FILE}"

[[ ! -d "${WORK_DIR}" ]] && mkdir -p "${WORK_DIR}"
[[ ! -f "${FILE}" ]] && touch "${FILE}"

cd "${WORK_DIR}"
eval "${CMD} ${FILE}"
watchman-make \
  -r "${WORK_DIR}" \
	-p "*repl*" \
	--make="${CMD}" \
	-t "${FILE}"
