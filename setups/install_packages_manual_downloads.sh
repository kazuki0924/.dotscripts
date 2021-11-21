#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Open links for softwares to download

LINKS=(
  # KensingtonWorks
  "https://www.kensington.com/software/kensingtonworks/"
)

for LINK in "${LINKS[@]}"; do
  open "$LINK"
done
