#!/bin/bash

ZSH_CUSTOM=~/.oh-my-zsh/custom

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

if [[ -e "$ZSH_CUSTOM/plugins/zsh-vi-mode" ]]; then
  echo "✅ [skip] zsh-vi-mode found"
else
  echo "Installing zsh-vi-mode..."
  git clone https://github.com/jeffreytse/zsh-vi-mode \
    $ZSH_CUSTOM/plugins/zsh-vi-mode
fi

echo "zsh custom: $ZSH_CUSTOM"

if [[ -e "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
  echo "✅ [skip] zsh-autosuggestions found"
else
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [[ -e "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
  echo "✅ [skip] zsh-syntax-highlighting found"
else
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [[ -e "$ZSH_CUSTOM/plugins/fzf-zsh-plugin" ]]; then
  echo "✅ [skip] fzf-zsh-plugin found"
else
  echo "Installing fzf-zsh-plugin..."
  git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git \
    "$ZSH_CUSTOM/plugins/fzf-zsh-plugin"
fi

if [[ -e "$ZSH_CUSTOM/plugins/zsh-bat" ]]; then
  echo "✅ [skip] zsh-bat found"
else
  echo "Installing zsh-bat"
  git clone https://github.com/fdellwing/zsh-bat.git \
    "$ZSH_CUSTOM/plugins/zsh-bat"
fi
