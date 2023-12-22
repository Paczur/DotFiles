# ~/.bashrc: executed by bash(1) for non-login shells.
#see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

shopt -s no_empty_cmd_completion
shopt -s lastpipe
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

xset -b b off

R=$'\001\e[31m\002'
G=$'\001\e[32m\002'
B=$'\001\e[34m\002'
C=$'\001\e[36m\002'
M=$'\001\e[35m\002'
Y=$'\001\e[33m\002'
RESET=$"\001\e[00m\002"
BO='('
BC=')'

markers=".git:README.md:LICENSE:.vimrc:Makefile"

GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_SHOWSTASHSTATE="yes"
GIT_PS1_SHOWUNTRACKEDFILES="yes"
GIT_PS1_SHOWCONFLICTSTATE="yes"
GIT_PS1_SHOWCOLORHINTS="yes"
GIT_PS1_DESCRIBE_STYPE="branch"
GIT_PS1_STATESEPARATOR="${G}${BC}${G}${BO}"
. /usr/share/git/git-prompt.sh

__ps1() {

  if [[ $? != 0 ]]; then
    status='${R}${BO}x${BC}'
  else
    status=''
  fi

  pwd="$(pwd)"

  if [ -n "$SSH_TTY" ]; then
    host="${G}${BO}$(hostname -s)${BC}"
  else
    host=""
  fi

  work="${B}${BO}$(echo "$pwd" | sed "s/${HOME//\//\\\/}/~/")${BC}"

  readarray -d ':' -t marray < <(echo "$markers")
  dir="$pwd"
  repodir=""
  found=""
  while [ "$dir" != "/" ]; do
    for marker in ${marray[@]}; do
      if [ -e "$dir/$marker" ]; then
        repodir="$dir"
        found="true"
        break
      fi
    done
    if [ -n "$found" ]; then
      break
    fi
    dir="$(dirname "$dir")"
  done


  branch="$(__git_ps1 "${G}${BO}%s${G}${BC}")${RESET}"

  if [ -n "$repodir" ]; then
    prompt="$(echo -n "${pwd}" \
      | sed "s/${repodir//\//\\\/}//")"
          if [ -z "$prompt" ]; then
            work=""
          else
            work="${B}${BO}.${prompt}${BC}"
          fi
          project="${C}${BO} $(basename "$repodir")${BC}"
        else
          project=""
  fi

  PS1="${status}${host}${project}${branch}${work}${RESET} "
}

export PROMPT_COMMAND=__ps1
