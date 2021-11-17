#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

source "./err_trap.sh"

LOGDIR="$HOME/.dotscripts_log"
LOGFILE="$LOGDIR/$(date +"%Y%m%d").log"

mkdir -p "$LOGDIR"

"${1-}" 2>&1 | tee -a "$LOGFILE"
