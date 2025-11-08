#!/bin/bash

mkdir -vp ~/.config

if ! command -v brew &>/dev/null; then
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ brew found"
fi

if ! command -v zsh &>/dev/null; then
  echo "Installing zsh..."
  brew install zsh

  echo "Changing default shell..."
  chsh -s $(which zsh)

  echo "Linking zsh config..."
  mv ~/.zshrc ~/.zshrc.bak
  ln -s ~/.dotfiles/.zshrc ~/.zshrc

  echo "Installing ohmyzsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ zsh found"
fi

if ! command -v luarocks &>/dev/null; then
  echo "Installing luarocks..."
  brew install luarocks
else
  echo "✅ luarocks found"
fi

if ! command -v rg &>/dev/null; then
  echo "Installing ripgrep..."
  brew install ripgrep
else
  echo "✅ ripgrep found"
fi

if ! brew list --cask aerospace &>/dev/null; then
  echo "Installing aerospace..."
  brew install --cask nikitabobko/tap/aerospace
  ln -s ~/.dotfiles/aerospace.toml ~/.config/aerospace/aerospace.toml
else
  echo "✅ aerospace found"
fi

if ! brew list nvim &>/dev/null; then
  echo "Installing nvim..."
  brew install nvim
else
  echo "✅ nvim found"
fi

if [ ! -e "$HOME/.config/nvim" ]; then
  echo "Linking nvim config in ~/.config/nvim/"
  ln -s ~/.dotfiles/nvim/ ~/.config/nvim/
else
  echo "✅ ~/.config/nvim/ config found"
fi

if ! brew list tmux &>/dev/null; then
  echo "Installing tmux..."
  brew install tmux
else
  echo "✅ tmux found"
fi

if [ ! -e "$HOME/.config/tmux" ]; then
  echo "Linking tmux config in ~/.config/tmux/"
  mkdir -vp ~/.config/tmux/ && ln -s ~/.dotfiles/tmux.conf ~/.config/tmux/tmux.conf
else
  echo "✅ ~/.config/tmux/ config found"
fi
