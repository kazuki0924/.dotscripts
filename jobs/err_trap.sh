#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

set_color_red() {
	tput setaf 1
}

set_color_green() {
	tput setaf 2
}

set_color_cyan() {
	tput setaf 6
}

reset_color() {
	tput sgr0
}

echo_in_red() {
	set_color_red
	echo -n "$1"
	reset_color
}

echo_in_green() {
	set_color_green
	echo -n "$1"
	reset_color
}

echo_in_cyan() {
	set_color_cyan
	echo -n "$1"
	reset_color
}

echo_red_line() {
	set_color_red
	printf "%0.s-" {1..40}
	reset_color
	echo ""
}

on_error() {
  SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	TILDE=$(echo "$SOURCE_DIR" | sed "s|$HOME|~|")
	DOTSCRIPT_DIR=$(echo "$SOURCE_DIR" | sed "s|$HOME/.dotscripts/||")

	echo ""
	echo_red_line
	echo_in_red "ERROR_INFO"
	echo ""
	echo -n "Location: "
	echo_in_cyan "$0"
	echo -n " [Line "
	echo_in_cyan $LINENO
	echo -n "]: Status "
	echo_in_cyan $?
	echo ""
	echo -n "PID: "
	echo_in_cyan "$$"
	echo ""
	echo -n "Bash Source: "
	echo_in_cyan "$TILDE"
	echo ""
	LOGDIR=$(echo "$HOME/.dotscripts_log" | sed "s|$HOME|~|")
	LOGFILE="$LOGDIR/$(date +"%Y%m%d")_dotscripts.log"
	echo -n "Log Output: "
	echo_in_cyan "$LOGFILE"
	echo ""
	echo -n "Command: "
	echo_in_cyan "$0"
	echo -n " "
	ARGS=""
	for ARG in "$@"; do
		ARGS+="$ARG "
	done
	echo_in_cyan "$ARGS"
	echo ""
	echo -n "dotscript: "
	echo_in_cyan "$DOTSCRIPT_DIR/$0"
	echo ""
	echo_red_line
}

trap 'on_error "$@"' ERR
