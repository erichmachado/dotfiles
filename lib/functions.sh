# Helper functions
_installed()
{
  test $(which $1)
}

_prompt()
{
  printf "$1\n"
  read -e $2
}