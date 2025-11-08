#/bin/bash

PARENT_PID=$PPID
export LAUNCHER_SHELL=$(ps -p $PARENT_PID -o comm=)
echo "shell: $LAUNCHER_SHELL"

./brew.sh
./shell.sh
./config.sh
./macos.sh
