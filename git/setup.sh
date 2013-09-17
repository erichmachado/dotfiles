#!/bin/sh

git_installed()
{
  test $(which git)
}

git_configured()
{
  [[ -f $1 ]]
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

  echo ' - What is your Git user name?'
  read -e git_username
  echo ' - What is your Git user email?'
  read -e git_useremail

  # Git configuration idea from @jasoncodes dotfiles:
  # https://github.com/jasoncodes/dotfiles/blob/master/config/gitconfig
  git config -f $1 user.name "$git_username"
  git config -f $1 user.email $git_useremail
  git config -f $1 credential.helper $git_credentialhelper
}

if git_installed ; then
  git_configlocal=~/.gitconfig.local

  if ! git_configured $git_configlocal ; then
    echo "Local Git configuration file not found. Please provide the information below:"
    git_setup $git_configlocal
  fi
fi
