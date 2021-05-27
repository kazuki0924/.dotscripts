#!/usr/local/bin/bash
set -euo pipefail

# repl for testing bash scripts

# read -p "Continue? [Yn]" -n 1 -r
# echo
# if [[ ! $REPLY =~ ^[Yy]$ ]]; then
#   exit 1
# fi

# DOT_DIRNAME="${1-.dotfiles}"

function pwdcopy {
  PWD=$(echo -n "$(pwd)")
  function HOME {
    echo "$PWD" | sed "s|$HOME|\$HOME|" | pbcopy
  }

  case $1 in

  --tilde | -t)
    echo "$PWD" | sed "s|$HOME|~|" | pbcopy
    ;;

  --home | -h)
    HOME
    ;;

  --full-path | -f)
    echo "$PWD" | pbcopy
    ;;

  *)
    HOME
    ;;
  esac

  # echo -n "$(pwd)" | sed "s|$HOME|\$HOME|" | cat | pbcopy
}

tee -a "$FILE" <<END
[user]
    name = $USER_NAME
    email = $USER_EMAL
END

readonly COMMENT=${@:?"The comment cannot be empty."}

# The full path to the script directory, regardless of pwd.
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
