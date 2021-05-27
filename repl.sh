#!/usr/bin/env bash
# set -Eeuo pipefail

IFS=$'\n\t'

DOT_DIRS=(
	.dotfiles
	.dotscripts
)

custom_fuzzy_finder() {
	local FD_OPTS=(
		-H
	)
  local BASE_DIR="${1-$(pwd)}"
	local JUMP_TO_DIR="${2-""}"
	local JUMP_TO_FILE="${3-""}"
  local IS_FOR_DOTFILES="${4-""}"
  local IS_FOR_FILE="${5-""}"
  local IS_FOR_DIR="${6-""}"
  local IS_CD_BY_FILE="${7-""}"
  local IS_CD_BY_DIR="${8-""}"
  local PROGRAM_TO_OPEN_WITH="${9-"nvim"}"

  if [[ $IS_FOR_FILE ]] || [[ $IS_CD_BY_FILE ]] || [[ $JUMP_TO_FILE ]]; then
    FD_OPTS+=("-t f")
  elif [[ $IS_FOR_DIR ]] || [[ $JUMP_TO_DIR ]]; then
    FD_OPTS+=("-t d")
  fi

	if [[ ! $IS_FOR_DOTFILES = "" ]]; then
		for DIR in "${DOT_DIRS[@]}"; do
			FD_OPTS+=("--search-path \"$HOME/$DIR\"")
		done
    BASE_DIR=""
	fi

  if [[ $JUMP_TO_FILE ]]; then
    FD_OPTS+=("\"$JUMP_TO_FILE\"")
  elif [[ $JUMP_TO_DIR ]]; then
    FD_OPTS+=("\"$JUMP_TO_DIR\"")
  fi
  
 
  IFS=$' \n\t'
  FD="fd ${FD_OPTS[*]} $BASE_DIR"
  IFS=$'\n\t'

  if [[ $JUMP_TO_FILE ]] || [[ $JUMP_TO_DIR ]]; then
    RESULT=$(eval "$FD" | head -1)
  else
    RESULT=$(eval "$FD" | fzy)
  fi
	# echo "${FD_OPTS[@]}" "$BASE_DIR" | xargs fd
  if [[ $IS_CD_BY_DIR ]] ; then
    cd "$RESULT" || exit
    echo "$(pwd)"
    exit 0
  elif [[ $IS_CD_BY_FILE ]]; then
    cd "$(dirname "$RESULT")" || return
  fi

  # PROGRAM_TO_OPEN_WITH="echo"

  eval "$PROGRAM_TO_OPEN_WITH $RESULT"
}

custom_fuzzy_finder "$@"

# function usage {
#         echo "Usage: $(basename $0) [-abcd]" 2>&1
#         echo '   -a   shows a in the output'
#         echo '   -b   shows b in the output'
#         echo '   -c   shows c in the output'
#         echo '   -d   shows d in the output'
#         exit 1
# }

# if [[ ${#} -eq 0 ]]; then
#    usage
# fi

# # Define list of arguments expected in the input
# optstring=":abcd"

# while getopts ${optstring} arg; do
#   case "${arg}" in
#     a) echo "Option 'a' was called" ;;
#     b) echo "Option 'b' was called" ;;
#     c) echo "Option 'c' was called" ;;
#     d) echo "Option 'd' was called" ;;

#     ?)
#       echo "Invalid option: -${OPTARG}."
#       echo
#       usage
#       ;;
#   esac
# done

# # Debug output
# echo "All ARGS: " "${@}"
# echo "1st arg: $1"
# echo "2nd arg: $2"
# echo "3rd arg: $3"
# echo "4th arg: $4"

# # Inspect OPTIND
# echo "OPTIND: $OPTIND"
