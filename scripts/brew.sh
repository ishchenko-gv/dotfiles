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
formulae=(
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
  "awscli:aws"
)

# Each entry represents cask name and the directory of installed binary.
# The direcotory is used to check whether program is already installed
# and used instead of brew list --cask to make possible to install it
# from other non-brew sources.
cask=(
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

for app in "${formulae[@]}"; do
  if [[ "$app" == *":"* ]]; then
    formulae_name=$(echo "$app" | cut -d ":" -f1)
    cli_name=$(echo "$app" | cut -d ":" -f2)
  else
    formulae_name="$app"
    cli_name="$app"
  fi

  if command -v "$cli_name" &>/dev/null; then
    echo "✅ [skip] $formulae_name found"
  else
    echo "Installing $formulae_name..."
    if brew install "$formulae_name"; then
      echo "✅ $formulae_name successfully installed"
    else
      echo "❌ $formulae_name installation failed"
    fi
  fi
done

echo "Installing cask..."

for app in "${cask[@]}"; do
  if [[ "$app" == *":"* ]]; then
    cask_name=$(echo "$app" | cut -d ":" -f1)
    installation_path=$(echo "$app" | cut -d ":" -f2)
  else
    cask_name="$app"
    installation_path=""
  fi

  if [[ -n "$installation_path" ]] && [[ -e "$installation_path" ]]; then
    echo "✅ [skip] $cask_name found installed in \"$installation_path\""
  elif command brew list --cask "$cask_name" &>/dev/null; then
    echo "✅ [skip] $cask_name found"
  elif brew install --cask "$cask_name"; then
    echo "✅ $cask_name successfully installed"
  else
    echo "❌ $cask_name installation failed"
  fi
done

brew cleanup
