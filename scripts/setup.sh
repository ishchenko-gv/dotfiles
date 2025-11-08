#/bin/bash

export LAUNCHER_SHELL=$(ps -p $PPID -o comm=)
echo "shell: $LAUNCHER_SHELL"

./brew.sh
./shell.sh
./config.sh
./macos.sh
