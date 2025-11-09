#!/bin/bash

if ! command -v zsh &>/dev/null; then
  # it's supposed that zsh has been installed in brew.sh script or manually
  echo "❌ zsh not found"
  exit 1
fi

if [[ ! -n "$LAUNCHER_SHELL" ]]; then
  LAUNCHER_SHELL=$(ps -p $PPID -o comm=)
fi

if [[ "$LAUNCHER_SHELL" =~ "zsh" ]]; then
  echo "✅ [skip] Current shell is zsh"
else
  echo "Changing shell..."
  chsh -s $(which zsh)
fi

if [[ -e "$HOME/.oh-my-zsh" ]]; then
  echo "✅ [skip] oh-my-zsh found"
else
  echo "Installing ohmyzsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
