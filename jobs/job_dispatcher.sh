#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

. "$HOME/.dotscripts/jobs/err_trap.sh"

LOGDIR="$HOME/.dotscripts_log"
LOGFILE="$LOGDIR/$(date +"%Y%m%d").log"

mkdir -p "$LOGDIR"

"$HOME/.dotscripts/${1-}" 2>&1 | tee -a "$LOGFILE"
