#!/bin/bash

source ./config/config-paths.sh

for conf_path in "${conf_paths[@]}"; do
  if [[ -e "$conf_path" ]]; then
    echo "Removing config $conf_path"
    rm -rv "$conf_path"
  fi
done
