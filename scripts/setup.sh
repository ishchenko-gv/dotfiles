#/bin/bash

export LAUNCHER_SHELL=$(ps -p $PPID -o comm=)
echo "shell: $LAUNCHER_SHELL"

~/.dotfiles/scripts/brew.sh
~/.dotfiles/scripts/shell.sh
~/.dotfiles/scripts/config/setup.sh
~/.dotfiles/scripts/ssh.sh
~/.dotfiles/scripts/macos.sh
