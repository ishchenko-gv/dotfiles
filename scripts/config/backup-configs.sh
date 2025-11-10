#!/bin/bash

source ./config/config-paths.sh

curr_date=$(date -u +%Y-%m-%dT%H:%M:%S)
backup_dir="$HOME/.dotfiles-backups/$curr_date"

mkdir -vp "$backup_dir"

for conf_path in "${conf_paths[@]}"; do
  echo "conf path: $conf_path"
  if [[ -e "$conf_path" ]]; then
    echo "Creating $conf_path backup..."
    cp -rv "$conf_path" "$backup_dir"
  fi
done
