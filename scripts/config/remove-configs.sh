#/bin/bash

source ~/.dotfiles/scripts/config/config-paths.sh

if [[ -z "$CONF_PATHS" ]]; then
  echo "$CONF_PATHS is not defined, check if config-paths.sh is sourced correctly"
  exit 1
fi

for CONF_PATH in "${CONF_PATHS[@]}"; do
  echo "Removing config $CONF_PATH"
  rm -rv "$CONF_PATH"
done
