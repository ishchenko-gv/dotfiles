#!/bin/bash

source ./scripts/config/config-paths.sh

if [[ -z "$CONF_PATHS" ]]; then
  echo "$CONF_PATHS is not defined, check if config-paths.sh is sourced correctly"
  exit 1
fi

checkSymlink() {
  if [[ -L "$1" ]] && [[ ! -e "$1" ]]; then
    echo "$1 is broken"
    rm "$1"
    return 1
  fi

  if [[ ! -e "$1" ]]; then
    echo "$1 not found"
    return 1
  fi

  return 0
}

mkdir -vp ~/.config

for IDX in "${!DOTFILES_PATHS[@]}"; do
  CONF_PATH="${CONF_PATHS[$IDX]}"
  DOTFILES_PATH="${DOTFILES_PATHS[$IDX]}"

  if checkSymlink "$CONF_PATH"; then
    echo "✅ [skip] config found in $CONF_PATH"
  else
    echo "Linking config in $CONF_PATH"
    ln -s "$DOTFILES_PATH" "$CONF_PATH"
  fi
done
