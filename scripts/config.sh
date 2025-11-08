#!/bin/bash

mkdir -vp ~/.config

if [[ ! -e "$HOME/.config/nvim" ]]; then
  echo "Linking nvim config in ~/.config/nvim/"
  ln -s ~/.dotfiles/nvim/ ~/.config/nvim/
else
  echo "✅ nvim config found in ~/.config/nvim/ "
fi

if [[ ! -e "$HOME/.config/tmux" ]]; then
  echo "Linking tmux config in ~/.config/tmux/tmux.conf"
  mkdir -vp ~/.config/tmux/ && ln -s ~/.dotfiles/tmux.conf ~/.config/tmux/tmux.conf
else
  echo "✅ tmux config found in ~/.config/tmux/tmux.conf"
fi

if [[ ! -e "$HOME/.config/aerospace/aerospace.toml" ]]; then
  echo "Linking aerospace config in ~/.config/aerospace/aerospace.toml"
  ln -s ~/.dotfiles/aerospace.toml ~/.config/aerospace/aerospace.toml
else
  echo "✅ aerospace config found in ~/.config/aerospace/aerospace.toml"
fi
