# Put display to sleep if we're in the bottom-left hot corner.
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

killall Dock
