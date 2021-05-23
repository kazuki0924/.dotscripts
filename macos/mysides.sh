#!/usr/local/bin/bash
set -euo pipefail

# Sidebar

# Requirements:
# mysides

SIDEBAR_ITEMS_TO_DELETE=(
  Recents
  Documents
  Desktop
  Movies
  Music
  Pictures
  /
)

for ITEM in "${SIDEBAR_ITEMS_TO_DELETE[@]}"; do
  mysides remove "$ITEM"
  echo "$ITEM"
done

(
  SIDEBAR_ITEMS_TO_ADD=(
    Repositories
    Screenshots
    Miscellaneous
  )

  for ITEM in "${SIDEBAR_ITEMS_TO_ADD[@]}"; do
    mysides add "$ITEM" file:///"$HOME"/"$ITEM" &>/dev/null
  done
)

(
  FROM_DOCUMENTS=(
    Personal
    Work
  )

  for ITEM in "${FROM_DOCUMENTS[@]}"; do
    mysides add "$ITEM" file:///"$HOME"/Documents/"$ITEM" &>/dev/null
  done
)
