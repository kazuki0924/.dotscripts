#!/usr/local/bin/bash
set -euo pipefail

# Open links for software downloads.

LINKS=(
  # KensingtonWorks
  "https://www.kensington.com/software/kensingtonworks/"
)

for LINK in "${LINKS[@]}"; do
  open "$LINK"
done
