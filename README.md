## Install

```
git clone git@github.com:ishchenko-gv/dotfiles.git ~/.dotfiles
```

### First time install
For the first time setup script will install all the required software skipping already installed and collect all the config file backups in ~/.dotfiles-backups directory, then remove previous confgi files and create new symlinks to the configs in ~/.dotfiles folder
```

cd ~/.dotfiles/scripts && ./setup.sh
```

### Updating already installed dotfiles
In this case updating script will install the software as well but it doesn't do any backups and removings, it checks existing symlinks presence and correctness and links new ones if required
```
cd ~/.dotfiles/scripts && ./update.sh
```
