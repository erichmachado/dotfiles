# Don't put duplicate lines and lines beginning with a space character in the history. See bash(1) for more options
HISTCONTROL=ignoreboth
 
# Don't record in history the simple invocation of 'ls' without any arguments, and the shell built-ins bg, fg, and exit
HISTIGNORE="ls:[bf]g:exit"
 
# Setting history entries length in memory
HISTSIZE=100000
 
# Setting history entries length in file
HISTFILESIZE=100000

# Setting history entries timestamp format
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S  "
