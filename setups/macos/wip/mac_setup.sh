#!/usr/local/bin/bash
set -euo pipefail

# create directories
DIRS=(
  Repositories/{Personal,Work}
  Screenshots/{Personal,Work}
  Miscellaneous/{Personal,Work}
  Documents/{Personal,Work}
  .oss
)

(
  cd || exit
  for DIR in "${DIRS[@]}"; do
    [ ! -d "$HOME/$DIR" ] && mkdir -p "$HOME/$DIR"
    echo created directory: "$DIR"
  done
)

# Command Line Tools
xcode-select --install
