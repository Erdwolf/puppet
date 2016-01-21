#
# DO NOT ADD CONTENT TO THIS FILE!
#
# ADD NEW FILES TO ~/.bashrc.d INSTEAD!
#

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# The number of commands to remember in the command history (-1 = unlimited).
HISTSIZE=-1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If this is an xterm set the title to user@host:dir
[ "$TERM" = xterm ] && {
  PS1="\[\e]0;\u@\h: \w\a\]$PS1"
}

# Some aliases
alias :r='exec bash'
alias :q='exit'

#
# DO NOT ADD CONTENT TO THIS FILE!
#
# ADD NEW FILES TO ~/.bashrc.d INSTEAD!
#
