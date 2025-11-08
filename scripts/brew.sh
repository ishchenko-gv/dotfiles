#!/bin/bash

if ! command -v brew &>/dev/null; then
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ [skip] brew found"
fi

FORMULAE=(
  "git"
  "zsh"
  "nvim"
  "luarocks"
  "rg:ripgrep"
  "tmux"
  "go"
  "python3"
  "colima"
)

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

for APP in "${FORMULAE[@]}"; do
  if [[ "$APP" == *":"* ]]; then
    CLI_NAME=$(echo "$APP" | cut -d ":" -f1)
    FORMULAE_NAME=$(echo "$APP" | cut -d ":" -f2)
  else
    CLI_NAME="$APP"
    FORMULAE_NAME="$APP"
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

for APP in "${CASK[@]}"; do
  if [[ "$APP" == *":"* ]]; then
    CASK_NAME=$(echo "$APP" | cut -d ":" -f1)
    MANUALLY_INSTALLED_PATH=$(echo "$APP" | cut -d ":" -f2)
  else
    CASK_NAME="$APP"
    MANUALLY_INSTALLED_PATH=""
  fi

  if [[ "$MANUALLY_INSTALLED_PATH" != "" ]] && [[ -e "$MANUALLY_INSTALLED_PATH" ]]; then
    echo "✅ [skip] $CASK_NAME found manually installed in \"$MANUALLY_INSTALLED_PATH\""
  elif command brew list --cask "$CASK_NAME" &>/dev/null; then
    echo "✅ [skip] $CASK_NAME found"
  elif brew install --cask "$CASK_NAME"; then
    echo "✅ $CASK_NAME successfully installed"
  else
    echo "❌ $CASK_NAME installation failed"
  fi
done
