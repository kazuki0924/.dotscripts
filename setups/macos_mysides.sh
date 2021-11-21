#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Sidebar

# Requirements:
# mysides

REQUIREMENTS=(
	mysides
)

for REQUIREMENT in "${REQUIREMENTS[@]}"; do
	which "${REQUIREMENT}" &>/dev/null || brew install "${REQUIREMENT}"
done

SIDEBAR_ITEMS_TO_DELETE=(
	Recents
	Documents
	Desktop
	Movies
	Music
	Pictures
	/
)

for ITEM in "${SIDEBAR_ITEMS_TO_DELETE[@]}"; do
  set +e
	mysides remove "${ITEM}"  &>/dev/null
  set -e
	echo removed "${ITEM}" with mysides
done

SIDEBAR_ITEMS_TO_ADD=(
	Screenshots
	Miscellaneous
  Repositories
)

for ITEM in "${SIDEBAR_ITEMS_TO_ADD[@]}"; do
	[[ ! -d ${ITEM} ]] && mkdir -pv "${HOME}/${ITEM}"
	mysides add "${ITEM}" "file:///${HOME}/$ITEM" &>/dev/null
	echo addded "${ITEM}" with mysides
done
