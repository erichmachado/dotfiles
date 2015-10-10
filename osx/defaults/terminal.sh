# Set default Terminal profile to Homebrew
defaults write com.apple.Terminal "Default Window Settings" Homebrew
# Set startup Terminal profile to Homebrew
defaults write com.apple.Terminal "Startup Window Settings" Homebrew
# Set Homebrew profile columns to 160
plutil -replace "Window Settings".Homebrew.columnCount -integer 160 $HOME/Library/Preferences/com.apple.Terminal.plist
# Set Homebrew profile rows to 48
plutil -replace "Window Settings".Homebrew.rowCount -integer 48 $HOME/Library/Preferences/com.apple.Terminal.plist
