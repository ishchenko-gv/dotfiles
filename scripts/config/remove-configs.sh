#!/bin/bash

source ./config/config-paths.sh

if [[ -z "$CONF_PATHS" ]]; then
  echo "$CONF_PATHS is not defined, check if config-paths.sh is sourced correctly"
  exit 1
fi

for CONF_PATH in "${CONF_PATHS[@]}"; do
  if [[ -e "$CONF_PATH" ]]; then
    echo "Removing config $CONF_PATH"
    rm -rv "$CONF_PATH"
  fi
done
