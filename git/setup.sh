# Git setup
git_config_read()
{
  git config --get -f $1 $2 > /dev/null
}

git_config_write()
{
  git config -f $1 $2 "$3"
}

git_setup()
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
  if ! git_config_read $1 user.name; then
    prompt ' - What is your Git user name?' git_username
    git_config_write $1 user.name "$git_username"
  fi
  if ! git_config_read $1 user.email; then
    prompt ' - What is your Git user email?' git_useremail
    git_config_write $1 user.email $git_useremail
  fi
  git config -f $1 credential.helper $git_credentialhelper
}