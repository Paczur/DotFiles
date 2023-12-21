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
PROMPT_DIRTRIM=2
bind Space:magic-space
shopt -s globstar 2>/dev/null
bind "set completion-map-case on"
bind "set mark-symlinked-directories on"
shopt -s histappend
shopt -s cmdhist
HISTSIZE=500000
HISTFILESIZE=100000
HISTCONTROL="earsedups:ignoreboth"
export HISTIGNORE="&:[]*:exit:ls:bg:fg:history:clear"
HISTTIMEFORMAT="%F %T "
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'
shopt -s dirspell 2> /dev/null
shopt -s cdspell 2> /dev/null
CDPATH=".:~"
cd () {
    command cd "$@" > /dev/null
}

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
PS1='\[$(ps1-repo)\]\[$(__git_ps1 " (%s)")\] '
