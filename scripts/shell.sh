#/bin/bash

if ! command -v zsh &>/dev/null; then
  echo "❌ zsh not found"
  exit 1
fi

echo "Changing default shell..."
chsh -s $(which zsh)

echo "Linking zsh config..."
ln -s ~/.dotfiles/.zshrc ~/.zshrc

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
