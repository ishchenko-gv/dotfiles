#!/bin/bash

mkdir -vp ~/.config

if ! command -v zsh &>/dev/null; then
  echo "ℹ️ zsh not found, installing..."
  brew install zsh

  echo "Changing default shell"
  chsh -s $(which zsh)

  echo "Linking zsh config"
  mv ~/.zshrc ~/.zshrc.bak
  ln -s ~/.dotfiles/.zshrc ~/.zshrc

  echo "Installing ohmyzsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ zsh found"
fi

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
  echo "✅ rg found"
fi

if ! brew list --cask aerospace &>/dev/null; then
  echo "ℹ️ aerospace not found, installing..."
  brew install --cask nikitabobko/tap/aerospace
  ln -s ~/.dotfiles/aerospace.toml ~/.config/aerospace/aerospace.toml
else
  echo "✅ aerospace found"
fi

if ! brew list nvim &>/dev/null; then
  echo "ℹ️ nvim not found, installing..."
  brew install nvim
else
  echo "✅ nvim found"
fi

if [ ! -e "$HOME/.config/nvim" ]; then
  echo "ℹ️ ~/.config/nvim/ not found, linking config..."
  ln -s ~/.dotfiles/nvim/ ~/.config/nvim/
else
  echo "✅ ~/.config/nvim/ found"
fi

if ! brew list tmux &>/dev/null; then
  echo "ℹ️ tmux not found, installing..."
  brew install tmux
else
  echo "✅ tmux found"
fi

if [ ! -e "$HOME/.config/tmux" ]; then
  echo "ℹ️ ~/.config/tmux/ not found, linkink config..."
  mkdir -vp ~/.config/tmux/ && ln -s ~/.dotfiles/tmux.conf ~/.config/tmux/tmux.conf
else
  echo "✅ ~/.config/tmux/ found"
fi
