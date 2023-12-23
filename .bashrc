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

__ps1_ssh() {
  if [ -n "$SSH_TTY" ]; then
    echo "${G}${BO}$(hostname -s)${BC}"
  fi
}
__ps1_git_dir() {
  local dir="$(pwd)"
  while [ "$dir" != "/" ]; do
    if [ -d "$dir/.git" ]; then
      echo "$dir"
      return
    fi
    dir="$(dirname "$dir")"
  done
}
__ps1_git_status() {
  local git_status="$(git status 2>&1)"
  local git_dir="$(echo "${git_status}" |\
    grep 'fatal: this operation must be run in a work tree')"
  if [ -z "${git_dir}" ]; then
    local unstaged="$(echo "${git_status}" |\
      grep 'Changes not staged for commit')"
    local staged="$(echo "${git_status}" | grep 'Changes to be committed')"
    local untracked="$(echo "${git_status}" | grep 'Untracked files')"
    local state=""
    if [ -n "$unstaged" ]; then
      state+="${R}*"
    fi
    if [ -n "$staged" ]; then
      state+="${G}+"
    fi
    if [ -n "$untracked" ]; then
      state+="${R}%"
    fi
    if [ -e "$1/.git/refs/stash" ]; then
      state+="${B}$"
    fi
    if [ -n "$state" ]; then
      echo "${G}${BO}$state${G}${BC}"
    fi
  fi
}
__ps1_git_branch() {
  echo "${G}${BO}$(sed 's/.*\///g' "$1/.git/HEAD")${BC}"
}
__ps1_cwd() {
  local pwd="$(pwd)"
  local cwd="$(echo "$pwd" | sed "s/${HOME//\//\\\/}/~/")"
  if [ -z "$1" ]; then
    echo "${B}${BO}$cwd${BC}"
  else
    cwd="$(echo "$pwd" | sed "s/${1//\//\\\/}//")"
    if [ -n "$cwd" ]; then
      echo "${B}${BO}.$cwd${BC}"
    fi
  fi
}
__ps1_venv() {
  if [ -n "${VIRTUAL_ENV_PROMPT}" ]; then
    echo "${RESET}${BO}${VIRTUAL_ENV_PROMPT}${BC}"
  fi
}
__ps1_jobs() {
  local job_count="$(jobs -r | wc -l)"
  if [ "${job_count}" -ne 0 ]; then
    echo "${M}${BO}${job_count}${BC}"
  fi
}
__ps1() {
  if [[ $? != 0 ]]; then
    local x="x"
  fi
  local R='\001\e[31m\002'
  local G='\001\e[32m\002'
  local B='\001\e[34m\002'
  local C='\001\e[36m\002'
  local M='\001\e[35m\002'
  local Y='\001\e[33m\002'
  local RESET='\001\e[00m\002'
  local BO='('
  local BC=')'

  if [ -n "$x" ]; then
    x="${R}${BO}x${BC}"
  fi
  local jobs="$(__ps1_jobs)"
  local host="$(__ps1_ssh)"
  local git="$(__ps1_git_dir)"
  if [ -n "$git" ]; then
    local project="${C}${BO}$(basename "$git")${BC}"
    local branch="$(__ps1_git_branch "$git")"
    local state="$(__ps1_git_status "$git")"
  fi
  local venv="$(__ps1_venv)"
  local cwd="$(__ps1_cwd "$git")"

  PS1="${x}${jobs}${host}${project}${branch}${state}${venv}${cwd}${RESET} "

  local PS1_CLEAN="$(echo "$PS1" |\
    sed 's/\\001\\e\[[0-9]\+m\\002//g;s/\[[0-9]*m//g')"
  if (( "${#PS1_CLEAN}>${COLUMNS}/2" )); then
    PS1+="\n"
  fi
}

export PROMPT_COMMAND=__ps1
