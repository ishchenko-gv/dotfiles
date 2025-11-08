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

if ! command -v go &>/dev/null; then
  echo "Installing go..."
  brew install go
else
  echo "✅ go found"
fi

if ! command -v python3 &>/dev/null; then
  echo "Installing python3..."
  brwe install python3
else
  echo "✅ python3 found"
fi

if ! brew list --cask aerospace &>/dev/null; then
  if [ -e "/Applications/AeroSpace.app"]; then
    echo "/Applications/AeroSpace.app found"
  else
    echo "Installing aerospace..."
    brew install --cask nikitabobko/tap/aerospace
    ln -s ~/.dotfiles/aerospace.toml ~/.config/aerospace/aerospace.toml
  fi
else
  echo "✅ aerospace found"
fi

if ! brew list colima &>/dev/null; then
  echo "Installing colima..."
  brew install colima
else
  echo "✅ colima found"
fi

if ! brew list --cask iterm2 &>/dev/null; then
  if [ -e "/Applications/iTerm.app" ]; then
    echo "✅ /Applications/iTerm.app found"
  else
    echo "Installing iTerm2..."
    brew install --cask iterm2
  fi
else
  echo "✅ iTerm2 found"
fi

if ! brew list --cask google-chrome &>/dev/null; then
  if [ -e "/Applications/Google Chrome.app" ]; then
    echo "✅ /Applications/Google Chrome.app found"
  else
    echo "Installing Google Chrome..."
    brew install google-chrome
  fi
else
  echo "✅ Google Chrome found"
fi

if ! brew list --cask google-drive &>/dev/null; then
  if [ -e "/Applications/Google Drive.app"]; then
    echo "✅ /Applications/Google Drive.app found"
  else
    echo "Insstalling Google Drive..."
    brew install --cask google-drive
  fi
else
  echo "✅ Google Drive found"
fi

if ! brew list --cask telegram &>/dev/null; then
  if [ -e "/Applications/Telegram.app"]; then
    echo "✅ /Applications/Telegram.app found"
  else
    echo "Installing Telegram..."
    brew install --cask telegram
  fi
else
  echo "✅ Telegram found"
fi

if ! brew list --cask spotify &>/dev/null; then
  if [ -e "/Applications/Spotify.app" ]; then
    echo "✅ /Applications/Spotify.app found"
  else
    echo "Installing Spotify..."
    brew install --cask spotify
  fi
else
  echo "✅ Spotify found"
fi

if ! brew list --cask obsidian &>/dev/null; then
  if [ -e "/Applications/Obsidian.app" ]; then
    echo "✅ /Applications/Obsidian.app found"
  else
    echo "Installing Obsidian..."
    brew install --cask obsidian
  fi
else
  echo "✅ Obsidian found"
fi

if ! brew list --cask postman &>/dev/null; then
  if [ -e "/Applications/Postman.app "]; then
    echo "✅ /Applications/Postman.app found"
  else
    echo "Installing Postman..."
    brew install --cask postman
  fi
else
  echo "✅ Postman found"
fi

if ! brew list --cask visual-studio-code; then
  if [ -e "/Applications/Visual Studio Code.app"]; then
    echo "✅ /Applications/Visual Studio Code.app found"
  else
    echo "Installing Visual Studio Code..."
    brew install --cask visual-studio-code
  fi
else
  echo "✅ Visual Studio Code found"
fi
