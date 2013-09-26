# Helper functions

# Includes the provided source files in the current script.
# Automatically references files relative to $FRESH_LOCAL.
# Paths with globbing must be provided around double quotes to process all files.
# 
# Arguments:
#   $1 - the file name or pattern of the scripts to load
# Example:
#   _include "lib/*.sh"
_include()
{
  for script in "$FRESH_LOCAL"/$1; do
    [[ -f $script ]] && source $script
  done
}

# Checks if a binary or executable script (command) can be found in the user $PATH
#
# Arguments:
#   $1 - the command to search in the user $PATH
# Returns:
#   0 - when the provided command was found in the user $PATH
#   1 - when the provided command was not found in the user $PATH
# Example:
#   _installed git
_installed()
{
  test $(which $1)
}

# Displays a prompt to the user and collects the answer
#
# Arguments:
#   $1 - The message to be displayed to the user
#   $2 - The variable to assign the answer to
# Example:
#   _prompt " - What is your name?" user_name
_prompt()
{
  printf "$1"
  read -e $2
}

# Checks if it is running OS X
#
# Returns:
#   0 - when it is running OS X
#   1 - when it is not running OS X
_running_osx()
{
  [[ "$(uname -s)" == "Darwin" ]]
}

# Checks if it is running Bash
#
# Returns:
#   0 - when it is running Bash
#   1 - when it is not running Bash
_running_bash()
{
  test -n "$BASH_VERSION"
}