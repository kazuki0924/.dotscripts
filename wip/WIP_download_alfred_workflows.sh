#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

ALFRED_WORKFLOWS=(
  # Homebrew and Cask for Alfred
  # http://www.packal.org/workflow/homebrew-and-cask-alfred
  https://github.com/packal/repository/raw/master/com.fniephaus.homebrew/homebrew-for-alfred.alfredworkflow

  http://www.packal.org/workflow/alfred-airpods-pro-connector

  # Cmd E Finder
  # http://www.packal.org/workflow/cmd-e-finder
  https://github.com/packal/repository/raw/master/me.river11576.alfred.cmde/cmde.alfredworkflow

  # Copy Finder Path
  # http://www.packal.org/workflow/copy-finder-path
  https://github.com/packal/repository/raw/master/com.willpuckett.cfp/copy_finder_path.alfredworkflow
)

DIR="$HOME/.dotfiles/assets/alfredworkflow"

(
  trash-put -v "$DIR"
  mkdir -pv "$DIR"
  cd "$DIR"
  for WORKFLOW in "${ALFRED_WORKFLOWS[@]}"; do
    FILE_NAME="$(echo "$WORKFLOW" | awk -F "/" '{print $NF}')"
    curl -L -o "$FILE_NAME" "$WORKFLOW"
  done
  open "$DIR"
)
