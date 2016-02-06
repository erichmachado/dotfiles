terminal_profile=Pro

# Set default Terminal profile to Homebrew
defaults write com.apple.Terminal "Default Window Settings" $terminal_profile
# Set startup Terminal profile to Homebrew
defaults write com.apple.Terminal "Startup Window Settings" $terminal_profile
# Set Homebrew profile columns to 160
plutil -replace "Window Settings".$terminal_profile.columnCount -integer 160 $HOME/Library/Preferences/com.apple.Terminal.plist
# Set Homebrew profile rows to 48
plutil -replace "Window Settings".$terminal_profile.rowCount -integer 48 $HOME/Library/Preferences/com.apple.Terminal.plist
