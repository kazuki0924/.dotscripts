#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

DIR="${2-"$(pwd)"}"

case ${1-""} in
--tilde | -t)
  echo -n "$DIR" | sed "s|$HOME|~|" | pbcopy
  ;;
--full-path | -f)
  echo -n "$DIR" | pbcopy
  ;;
*)
  echo -n "\"$DIR\"" | sed "s|$HOME|\$HOME|" | pbcopy
  ;;
esac
