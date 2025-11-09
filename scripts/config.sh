#!/bin/bash

checkSymlink() {
  if [[ -L "$1" ]] && [[ ! -e "$1" ]]; then
    echo "$1 is broken"
    rm "$1"
    return 1
  fi

  if [[ ! -e "$1" ]]; then
    echo "$1 not found"
    return 1
  fi

  return 0
}

mkdir -vp ~/.config

if checkSymlink "$HOME/.config/nvim"; then
  echo "✅ [skip] nvim config found in ~/.config/nvim/ "
else
  echo "Linking nvim config in ~/.config/nvim/"
  ln -s ~/.dotfiles/nvim/ ~/.config/nvim/
fi

if checkSymlink "$HOME/.config/tmux"; then
  echo "✅ [skip] tmux config found in ~/.config/tmux/tmux.conf"
else
  echo "Linking tmux config in ~/.config/tmux/tmux.conf"
  mkdir -vp ~/.config/tmux/
  ln -s ~/.dotfiles/tmux.conf ~/.config/tmux/tmux.conf
fi

if checkSymlink "$HOME/.gitconfig"; then
  echo "✅ [skip] .gitconfig found in ~/.gitconfig"
else
  echo "Linking .gitconfig in ~/.gitconfig"
  ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
fi

if checkSymlink "$HOME/.gitignore_global"; then
  echo "✅ [skip] .gitignore_global found in ~/.gitignore_global"
else
  echo "Linking gitignore_global in ~/.gitignore_global"
  ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global
fi

if checkSymlink "$HOME/.config/aerospace/aerospace.toml"; then
  echo "✅ [skip] aerospace config found in ~/.config/aerospace/aerospace.toml"
else
  echo "Linking aerospace config in ~/.config/aerospace/aerospace.toml"
  ln -s ~/.dotfiles/aerospace.toml ~/.config/aerospace/aerospace.toml
fi
