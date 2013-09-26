# Helper functions

# Includes the provided source files in the current script.
# Automatically references files relative to $FRESH_LOCAL.
# Paths with globbing must be provided around double quotes to process all files.
# Example:
# _include "lib/*.sh"
_include()
{
  for script in "$FRESH_LOCAL"/$1; do
    [[ -f $script ]] && source $script
  done
}

_installed()
{
  test $(which $1)
}

_prompt()
{
  printf "$1\n"
  read -e $2
}