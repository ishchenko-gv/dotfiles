#!/bin/bash

source ./config/config-paths.sh

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

for idx in "${!dotfiles_paths[@]}"; do
  conf_path="${conf_paths[$idx]}"
  dotfiles_path="${dotfiles_paths[$idx]}"

  if checkSymlink "$conf_path"; then
    echo "✅ [skip] config found in $conf_path"
  else
    echo "Linking config in $conf_path"
    ln -s "$dotfiles_path" "$conf_path"
  fi
done
