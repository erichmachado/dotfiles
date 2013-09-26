# Helper functions
installed()
{
  test $(which $1)
}

prompt()
{
  printf "$1\n"
  read -e $2
}