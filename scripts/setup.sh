#/bin/bash

export LAUNCHER_SHELL=$(ps -p $PPID -o comm=)
echo "shell: $LAUNCHER_SHELL"

~/.dotfiles/scripts/brew.sh
~/.dotfiles/scripts/shell.sh
~/.dotfiles/scripts/config.sh
~/.dotfiles/scripts/macos.sh
