#/bin/bash

source ./scripts/config-paths.sh

if [[ -z "$CONF_PATHS" ]]; then
  echo "$CONF_PATHS is not defined, check if config-paths.sh is sourced correctly"
  exit 1
fi

CURR_DATE=$(date -u +%Y-%m-%dT%H:%M:%S)
BACKUP_DIR="$HOME/.dotfiles-backups/$CURR_DATE"

mkdir -vp "$BACKUP_DIR"

for CONF_PATH in "${CONF_PATHS[@]}"; do
  if [[ -e "$CONF_PATH" ]]; then
    echo "Creating $CONF_PATH backup..."
    cp -rv "$CONF_PATH" "$BACKUP_DIR"
  fi
done
