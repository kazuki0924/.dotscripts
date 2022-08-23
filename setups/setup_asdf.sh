#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# erlang, elixir: install with asdf interactively

REQUIREMENTS=(
  asdf
  fzf
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
  which "${REQUIREMENT}" &>/dev/null || brew install "${REQUIREMENT}"
done

brew install autoconf
brew install openssl@1.1

fuzzy_install_w_asdf() {
  TARGET="${1:-""}"
  
  set +e
  asdf plugin-add "${TARGET}"
  set -e
  echo "Choose which version of ${TARGET} to be installed globally:"
  # fuzzy find versions filtering out only the out-of-beta ones in reverse order
  VERSION="$(asdf list-all "${TARGET}" | tac | fzf --layout=reverse --height=20%)"
  asdf install "${TARGET}" "${VERSION/[[:space:]]/}"
  asdf global "${TARGET}" "${VERSION/[[:space:]]/}"
}

fuzzy_install_w_asdf "erlang"
fuzzy_install_w_asdf "elixir"

echo ""
echo "Installed erlang version:"
erl -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), "releases", erlang:system_info(otp_release), "OTP_VERSION"])), io:fwrite(Version), halt().' -noshell
echo "Installed elixir version:"
elixir --version
