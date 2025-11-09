#/bin/bash

git pull

LAUNCHER_SHELL=$(ps -p $PPID -o comm=)
echo "shell: $LAUNCHER_SHELL"

source ./brew.sh
source ./shell.sh
source ./config/link-configs.sh
source ./ssh.sh
source ./macos.sh
