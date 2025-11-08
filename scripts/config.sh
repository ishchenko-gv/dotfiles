#!/bin/bash

mkdir -vp ~/.config

if [ ! -e "$HOME/.config/nvim" ]; then
  echo "Linking nvim config in ~/.config/nvim/"
  ln -s ~/.dotfiles/nvim/ ~/.config/nvim/
else
  echo "✅ nvim config found in ~/.config/nvim/ "
fi

if [ ! -e "$HOME/.config/tmux" ]; then
  echo "Linking tmux config in ~/.config/tmux/"
  mkdir -vp ~/.config/tmux/ && ln -s ~/.dotfiles/tmux.conf ~/.config/tmux/tmux.conf
else
  echo "✅ tmux config found in ~/.config/tmux/"
fi
