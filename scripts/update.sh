#/bin/bash

git pull

export LAUNCHER_SHELL=$(ps -p $PPID -o comm=)
echo "shell: $LAUNCHER_SHELL"

./scripts/brew.sh
./scripts/shell.sh
./scripts/config/link-configs.sh
./scripts/ssh.sh
./scripts/macos.sh
