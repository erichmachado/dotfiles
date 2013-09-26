# Require password after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1

# Set to immediately require password after sleep or screen saver begins
defaults write com.apple.screensaver askForPasswordDelay -float 0

# Run the screensaver if we're in the bottom-left hot corner.
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0
