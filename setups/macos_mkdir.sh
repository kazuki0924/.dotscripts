#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# create directories
DIRS=(
	Repositories/{Personal,Work}
	Screenshots/{Personal,Work}
	Miscellaneous/{Personal,Work}
	Documents/{Personal,Work}
	.oss
)

for DIR in "${DIRS[@]}"; do
	[ ! -d "${HOME}/${DIR})" ] && mkdir -p "${HOME}/${DIR}"
	echo "created directory: ${DIR}"
done
