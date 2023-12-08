# ~/.bashrc: executed by bash(1) for non-login shells.
#see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s checkwinsize

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

. /usr/share/git/git-prompt.sh
xset -b b off
GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_SHOWSTASHSTATE="yes"
GIT_PS1_SHOWUNTRACKEDFILES="yes"
GIT_PS1_SHOWCONFLICTSTATE="yes"
GIT_PS1_SHOWCOLORHINTS="yes"
GIT_PS1_DESCRIBE_STYPE="branch"
PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w\[\033[00m\]$(__git_ps1 " (%s)") '
