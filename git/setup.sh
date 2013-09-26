# Git setup

_git_config_read()
{
  git config --get $1 > /dev/null
}

_git_config_write()
{
  git config $1 "$2"
}

# Git setup script proudly stolen from @holman:
# https://github.com/holman/dotfiles/blob/master/script/bootstrap
_git_setup()
{
  # Git configuration idea from @jasoncodes dotfiles:
  # https://github.com/jasoncodes/dotfiles/blob/master/config/gitconfig
  if ! _git_config_read user.name; then
    _prompt " - What is your Git user name?\n" git_username
    _git_config_write user.name "$git_username"
  fi
  if ! _git_config_read user.email; then
    _prompt " - What is your Git user email?\n" git_useremail
    _git_config_write user.email $git_useremail
  fi
  if _running_osx; then
    git_credentialhelper='osxkeychain'
  else
    git_credentialhelper='cache'
  fi
  _git_config_write credential.helper $git_credentialhelper
}