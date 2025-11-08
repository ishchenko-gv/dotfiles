#/bin/bash

if ! command -v zsh &>/dev/null; then
  echo "❌ zsh not found"
  exit 1
fi

if [[ "$LAUNCHER_SHELL" != "zsh" ]]; then
  echo "Changing shell..."
  chsh -s $(which zsh)
else
  echo "✅ [skip] Current shell is zsh"
fi

if [[ ! -e "$HOME/.zshrc" ]]; then
  echo "Linking zsh config..."
  ln -s ~/.dotfiles/.zshrc ~/.zshrc
else
  echo "✅ [skip] zsh config found in ~/.zshrc"
fi

if [[ ! -e "$HOME/.oh-my-zsh" ]]; then
  echo "Installing ohmyzsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ [skip] oh-my-zsh found"
fi
