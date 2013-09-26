# Git setup
_git_config_read()
{
  git config --get -f $1 $2 > /dev/null
}

_git_config_write()
{
  git config -f $1 $2 "$3"
}

_git_setup()
{
  # Git setup script proudly stolen from @holman:
  # https://github.com/holman/dotfiles/blob/master/script/bootstrap
  if [[ "$(uname -s)" == "Darwin" ]]; then
    git_credentialhelper='osxkeychain'
  else
    git_credentialhelper='cache'
  fi

  # Git configuration idea from @jasoncodes dotfiles:
  # https://github.com/jasoncodes/dotfiles/blob/master/config/gitconfig
  if ! _git_config_read $1 user.name; then
    _prompt " - What is your Git user name?\n" git_username
    _git_config_write $1 user.name "$git_username"
  fi
  if ! _git_config_read $1 user.email; then
    _prompt " - What is your Git user email?\n" git_useremail
    _git_config_write $1 user.email $git_useremail
  fi
  _git_config_write $1 credential.helper $git_credentialhelper
}