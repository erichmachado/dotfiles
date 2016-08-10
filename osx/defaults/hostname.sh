# Set computer name (as done via System Preferences → Sharing)
# Stolen from: @mathiasbynens
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx
computer_name=$(scutil --get ComputerName 2>/dev/null || true)
host_name=$(scutil --get HostName 2>/dev/null || true)
local_host_name=$(scutil --get LocalHostName 2>/dev/null || true)
net_bios_name=$(defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName 2>/dev/null || true)

if [ "$computer_name" != "$host_name" ]; then
  _prompt " - Type your new computer name [$computer_name]: " new_computer_name
  echo "Chosen computer name is \"${new_computer_name:=$computer_name}\""
  sudo scutil --set ComputerName "$new_computer_name"
  sudo scutil --set HostName "$new_computer_name"
fi

if [ "$local_host_name" != "$net_bios_name" ]; then
  _prompt " - Type your new localhost name [$local_host_name]: " new_local_host_name
  echo "Chosen localhost name is \"${new_local_host_name:=$local_host_name}\""
  sudo scutil --set LocalHostName "$new_local_host_name"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$new_local_host_name"
fi
