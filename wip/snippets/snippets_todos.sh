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

LINE="$@"

extract() {
  echo "$@"
  while [ "$#" -gt "0" ]; do
    case $1 in
    "--webhook-url")
      PORT=$(echo $2 | awk -F':' {'print $3'})
      shift
      ;;
    "--inbound-transport")
      HOST=$3
      ENDPOINT=$4
      shift
      shift
      shift
      ;;
    "--admin")
      ADMIN=$3
      shift
      shift
      ;;

    "--label")
      AGENT=$(echo $2 | awk -F'.' {'print $1'})
      shift
      ;;
    esac
    shift
  done
}

extract $LINE

while [[ $# -gt 0 ]]; do
  k=$1
  case $k in
  -b | --bind)
    BIND=$2
    shift
    shift
    ;;
  -e | --endpoint)
    ENDPOINT=$2
    shift
    shift
    ;;
  -p | --admin)
    ADMIN=$2
    shift
    shift
    ;;
  -a | --agent)
    AGENT=$2
    shift
    shift
    ;;
  -i | --wallet-id)
    WID=$2
    shift
    shift
    ;;
  -w | --web)
    WEBHOOK="http://127.0.0.1:$2"
    WEB=$2
    shift
    shift
    ;;

  esac
done

tee -a "$FILE" <<END
[user]
    name = $USER_NAME
    email = $USER_EMAL
END

TMP=$(mktemp)
cat <<EOF >$TMP
[user]
    name = $USER_NAME
    email = $USER_EMAL
EOF

readonly COMMENT=${@:?"The comment cannot be empty."}

# The full path to the script directory, regardless of pwd.
DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
