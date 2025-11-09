#/bin/bash

if [[ ! -e "$HOME/.ssh/config" ]]; then
  echo "ssh config not found, copying example..."
  mkdir -vp ~/.ssh
  cp ~/.dotfiles/ssh/config.example ~/.ssh/config
  echo "Don't forget to add necessary ssh keys to ~/.ssh directory"
else
  echo "✅ [skip] ssh config found"
fi
