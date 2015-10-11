# Require password after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1

# Set to immediately require password after sleep or screen saver begins
defaults write com.apple.screensaver askForPasswordDelay -float 0
