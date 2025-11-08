#/bin/bash

# ------------------------------
# 1. FINDER / FILE SYSTEM TWEAKS
# ------------------------------

echo "Configuring Finder and File System settings..."

# Always show all file extensions, even for files where extensions are typically hidden.
defaults write NSGlobalDomain AppleShowAllExtensions -bool TRUE

# Always show hidden files (like .bashrc, .gitconfig) in Finder.
defaults write com.apple.finder AppleShowAllFiles -bool TRUE

# Show the Path Bar at the bottom of Finder windows.
defaults write com.apple.finder ShowPathbar -bool TRUE

# Set the default Finder view to 'Column View' ('clmv').
# Other options: 'icnv' (Icon View), 'Nlsv' (List View), 'Flwv' (Cover Flow).
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Make the hidden User Library folder permanently visible in the home directory.
chflags nohidden ~/Library/

# Disable the creation of .DS_Store files on network volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

# ----------------------------------
# 2. SPEED / UI ANIMATION TWEAKS
# ----------------------------------

echo "Configuring Speed and Animation settings..."

# Remove the delay when auto-hiding the Dock (makes it pop up instantly).
defaults write com.apple.Dock autohide-delay -float 0

# Speed up the Mission Control and Exposé animations.
defaults write com.apple.dock expose-animation-duration -float 0.12

# Make hidden app icons translucent in the Dock to differentiate them from running apps.
defaults write com.apple.Dock showhidden -bool TRUE

# Disable "natural" scroll direction (i.e., scroll wheel up moves content down).
# Set to TRUE to revert to the macOS default (Natural Scrolling).
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool FALSE

# ------------------------------
# 3. KEYBOARD / INPUT TWEAKS
# ------------------------------

echo "Configuring Keyboard and Input settings..."

# Set maximum key repeat rate (requires System Preferences > Keyboard > Key Repeat to be set to fastest).
defaults write NSGlobalDomain KeyRepeat -int 1

# Set minimum delay before key repeating begins (requires System Preferences > Keyboard > Delay Until Repeat to be set to shortest).
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable automatic smart quotes (a programmer's nightmare).
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool FALSE

# Disable automatic smart dashes (also crucial for command line/programming).
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool FALSE

# ----------------------------
# 4. SCREENSHOT TWEAKS
# ----------------------------

echo "Configuring Screenshot settings..."

# Save screenshots as JPG instead of PNG (for smaller file size).
# Use "png" to revert to default, or "tiff", "gif", "pdf", etc.
defaults write com.apple.screencapture type -string "jpg"

# Disable the window shadow effect when taking a screenshot of a specific window.
defaults write com.apple.screencapture disable-shadow -bool TRUE

# Change default screenshot location to a specific folder
mkdir -vp ~/Documents/Screenshots
defaults write com.apple.screencapture location ~/Documents/Screenshots

# ----------------------------
# 5. FINAL STEPS
# ----------------------------

echo "Restarting affected system services to apply changes..."

# Restart the Dock, Finder, and the SystemUIServer (which controls menu bar icons and screenshots)
killall Dock Finder SystemUIServer
