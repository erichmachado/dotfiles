# Git setup

_git_global_config_read()
{
  git config --global --get $1 > /dev/null
}

_git_global_config_write()
{
  git config --global $1 "$2"
}

# Git setup script proudly stolen from @holman:
# https://github.com/holman/dotfiles/blob/master/script/bootstrap
_git_global_setup()
{
  # Git configuration idea from @jasoncodes dotfiles:
  # https://github.com/jasoncodes/dotfiles/blob/master/config/gitconfig
  _git_global_config_write include.path '~/.gitconfig.static'
  if ! _git_global_config_read user.name; then
    _prompt " - What is your Git user name?\n" git_user_name
    _git_global_config_write user.name "$git_user_name"
  fi
  if ! _git_global_config_read user.email; then
    _prompt " - What is your Git user email?\n" git_user_email
    _git_global_config_write user.email $git_user_email
  fi
  if _running_osx; then
    git_credentialhelper='osxkeychain'
  else
    git_credentialhelper='cache'
  fi
  _git_global_config_write credential.helper $git_credentialhelper
}
