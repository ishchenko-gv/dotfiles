#!/bin/bash

mkdir -vp ~/.config

echo "✨ Checking shell..."

if ! command -v zsh &>/dev/null; then
  echo "ℹ️ zsh not found, installing..."
  brew install zsh

  echo "Changing default shell"
  chsh -s $(which zsh)

  echo "Setup zsh config"
  mv ~/.zshrc ~/.zshrc.bak
  ln -s ~/.dotfiles/.zshrc ~/.zshrc

  echo "Installing ohmyzsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ zsh found"
fi

echo "✨ Checking dependencies..."

if ! command -v luarocks &>/dev/null; then
  echo "ℹ️ luarocks not found, installing..."
  brew install luarocks
else
  echo "✅ luarocks found"
fi

if ! command -v rg &>/dev/null; then
  echo "ℹ️ rg not found, installing..."
  brew install ripgrep
else
  echo "✅ ripgrep found"
fi

echo "✨ Checking symlinks..."

if [ ! -e "$HOME/.config/nvim" ]; then
  echo "ℹ️ ~/.config/nvim/ not found, creating symlink..."
  ln -s ~/.dotfiles/nvim/ ~/.config/nvim/
else
  echo "✅ ~/.config/nvim/ found"
fi

if [ ! -e "$HOME/.config/tmux" ]; then
  echo "ℹ️ ~/.config/tmux/ not found, creating symlink..."
  mkdir -vp ~/.config/tmux/ && ln -s ~/.dotfiles/tmux.conf ~/.config/tmux/tmux.conf
else
  echo "✅ ~/.config/tmux/ found"
fi
