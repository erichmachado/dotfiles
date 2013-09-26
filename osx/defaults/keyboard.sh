# Based on @holman's OS X defaults:
# https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a really fast key repeat.
defaults write -g KeyRepeat -int 2

# Set no delay to start key repeating
defaults write -g InitialKeyRepeat -int 15
