#!/bin/bash

mkdir -vp ~/.config

if [[ ! -e "$HOME/.config/nvim" ]]; then
  echo "Linking nvim config in ~/.config/nvim/"
  ln -s ~/.dotfiles/nvim/ ~/.config/nvim/
else
  echo "✅ [skip] nvim config found in ~/.config/nvim/ "
fi

if [[ ! -e "$HOME/.config/tmux" ]]; then
  echo "Linking tmux config in ~/.config/tmux/tmux.conf"
  mkdir -vp ~/.config/tmux/ && ln -s ~/.dotfiles/tmux.conf ~/.config/tmux/tmux.conf
else
  echo "✅ [skip] tmux config found in ~/.config/tmux/tmux.conf"
fi

if [[ ! -e "$HOME/.gitconfig" ]]; then
  echo "Linking .gitconfig in ~/.gitconfig"
  ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
else
  echo "✅ [skip] .gitconfig found in ~/.gitconfig"
fi

if [[ ! -e "$HOME/.gitignore_global" ]]; then
  echo "Linking gitignore_global in ~/.gitignore_global"
  ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global
else
  echo "✅ [skip] .gitignore_global found in ~/.gitignore_global"
fi
if [[ ! -e "$HOME/.config/aerospace/aerospace.toml" ]]; then
  echo "Linking aerospace config in ~/.config/aerospace/aerospace.toml"
  ln -s ~/.dotfiles/aerospace.toml ~/.config/aerospace/aerospace.toml
else
  echo "✅ [skip] aerospace config found in ~/.config/aerospace/aerospace.toml"
fi
