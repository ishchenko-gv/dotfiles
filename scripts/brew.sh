#!/bin/bash

if ! command -v brew &>/dev/null; then
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ [skip] brew found"
fi

# Each entry represents formulae name.
# In cases where the formulae and the command to use it are not the same,
# the command is provided divided by a colon. The command is then used
# to check whether the program is already installed.
#
# The installation check is implemented by checking if the command is
# available instead of checking brew list, considering that the program
# could be installed from other non-brew sources.
FORMULAE=(
  "coreutils:gsort"
  "git"
  "git-delta:delta"
  "zsh"
  "nvim"
  "luarocks"
  "ripgrep:rg"
  "jq"
  "httpie"
  "eza"
  "fd"
  "bat"
  "htop"
  "tldr"
  "bandwhich"
  "fzf"
  "zoxide"
  "tmux"
  "go"
  "python3"
  "colima"
  "docker"
  "docker-compose"
  "kubectl"
  "openssh:ssh"
)

# Each entry represents cask name and the directory of installed binary.
# The direcotory is used to check whether program is already installed
# and used instead of brew list --cask to make possible to install it
# from other non-brew sources.
CASK=(
  "iterm2:/Applications/iTerm.app"
  "nikitabobko/tap/aerospace:/Applications/AeroSpace.app"
  "google-chrome:/Applications/Google Chrome.app"
  "google-drive:/Applications/Google Drive.app"
  "telegram:/Applications/Telegram.app"
  "spotify:/Applications/Spotify.app"
  "obsidian:/Applications/Obsidian.app"
  "postman:/Applications/Postman.app"
  "visual-studio-code:/Applications/Visual Studio Code.app"
)

echo "Installing formulae..."

for APP in "${FORMULAE[@]}"; do
  if [[ "$APP" == *":"* ]]; then
    FORMULAE_NAME=$(echo "$APP" | cut -d ":" -f1)
    CLI_NAME=$(echo "$APP" | cut -d ":" -f2)
  else
    FORMULAE_NAME="$APP"
    CLI_NAME="$APP"
  fi

  if command -v "$CLI_NAME" &>/dev/null; then
    echo "✅ [skip] $FORMULAE_NAME found"
  else
    echo "Installing $FORMULAE_NAME..."
    if brew install "$FORMULAE_NAME"; then
      echo "✅ $FORMULAE_NAME successfully installed"
    else
      echo "❌ $FORMULAE_NAME installation failed"
    fi
  fi
done

echo "Installing cask..."

for APP in "${CASK[@]}"; do
  if [[ "$APP" == *":"* ]]; then
    CASK_NAME=$(echo "$APP" | cut -d ":" -f1)
    INSTALLATION_PATH=$(echo "$APP" | cut -d ":" -f2)
  else
    CASK_NAME="$APP"
    INSTALLATION_PATH=""
  fi

  if [[ -n "$INSTALLATION_PATH" ]] && [[ -e "$INSTALLATION_PATH" ]]; then
    echo "✅ [skip] $CASK_NAME found installed in \"$INSTALLATION_PATH\""
  elif command brew list --cask "$CASK_NAME" &>/dev/null; then
    echo "✅ [skip] $CASK_NAME found"
  elif brew install --cask "$CASK_NAME"; then
    echo "✅ $CASK_NAME successfully installed"
  else
    echo "❌ $CASK_NAME installation failed"
  fi
done

brew cleanup
