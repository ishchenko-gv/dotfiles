#!/bin/bash

# Exit on: unset variables (-u), command failure (-e), and pipe failure (-o pipefail)
set -euo pipefail

git pull

LAUNCHER_SHELL=$(ps -p $PPID -o comm=)
echo "shell: $LAUNCHER_SHELL"

source ./brew.sh
source ./shell.sh
source ./config/link-configs.sh
source ./ssh.sh
source ./macos.sh
