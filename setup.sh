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
  ln -s ~/.dotfiles/.zshrc ~/.zshrc

  echo "Installing ohmyzsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ zsh found"
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

  echo "Checking nvim dependencies..."
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

else
  echo "✅ nvim found"
fi

if [ ! -e "$HOME/.config/nvim" ]; then
  echo "Linking nvim config in ~/.config/nvim/"
  ln -s ~/.dotfiles/nvim/ ~/.config/nvim/
else
  echo "✅ nvim config found in ~/.config/nvim/ "
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
  echo "✅ tmux config found in ~/.config/tmux/"
fi

if ! brew list --cask google-chrome &>/dev/null; then
  if [ -e "/Applications/Google Chrome.app" ]; then
    echo "✅ /Applications/Google Chrome.app found"
  else
    echo "Installing google-chrome..."
    brew install google-chrome
  fi
else
  echo "✅ google-chrome found"
fi

if ! brew list --cask telegram &>/dev/null; then
  if [ -e "/Applications/Telegram.app"]; then
    echo "/Applications/Telegram.app found"
  else
    brew install --cask telegram
  fi
else
  echo "✅ telegram found"
fi

if ! brew list colima &>/dev/null; then
  echo "Installing colima..."
  brew install colima
else
  echo "✅ columa found"
fi
