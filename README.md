## Install

```
git clone git@github.com:ishchenko-gv/dotfiles.git ~/.dotfiles
```

### First installation
For the first time setup script will install all the required software and make config file backups in ~/.dotfiles-backups
```
cd ~/.dotfiles/scripts && ./setup.sh
```

### Updating dotfiles
Unlike setup updating script doesn't make any backups, it fetches fresh dotfiles version, updates and installs missing software and fix config symlinks
```
cd ~/.dotfiles/scripts && ./update.sh
```
