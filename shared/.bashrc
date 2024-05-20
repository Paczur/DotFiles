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

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

bits_to_color() {
  local R='\001\e[31m\002'
  local G='\001\e[32m\002'
  local B='\001\e[34m\002'
  local C='\001\e[36m\002'
  local M='\001\e[35m\002'
  local Y='\001\e[33m\002'
  local W='\001\e[97m\002'
  local D='\001\e[90m\002'
  if [ "$1" = "1" ]; then
    if [ "$2" = "1" ]; then
      if [ "$3" = "1" ]; then
        echo "$W"
      elif [ "$3" = "0" ]; then
        echo "$Y"
      fi
    elif [ "$2" = "0" ]; then
      if [ "$3" = "1" ]; then
        echo "$M"
      elif [ "$3" = "0" ]; then
        echo "$R"
      fi
    fi
  elif [ "$1" = "0" ]; then
    if [ "$2" = "1" ]; then
      if [ "$3" = "1" ]; then
        echo "$C"
      elif [ "$3" = "0" ]; then
        echo "$G"
      fi
    elif [ "$2" = "0" ]; then
      if [ "$3" = "1" ]; then
        echo "$B"
      elif [ "$3" = "0" ]; then
        echo "$D"
      fi
    fi
  fi
}
__ps1_host() {
  if [ -n "$(pstree -ps $$ | grep "sshd")" ]; then
    echo "${host_color}${BO}$(hostname -s)${BC}"
  fi
}
__ps1_user() {
  local user="$(whoami)"
  if [ "$user" != "paczur" ]; then
    echo "${user_color}${BO}${user}${BC}"
  fi
}
__ps1_git_dir() {
  local dir="$(realpath "$PWD")"
  while [ "$dir" != "/" ]; do
    if [ -d "$dir/.git" ]; then
      echo "$dir"
      return
    fi
    dir="$(dirname "$dir")"
  done
}
__ps1_git_status() {
  #Takes git_dir as argument
  local git_status="$(git status 2>&1)"
  local git_dir="$(echo "${git_status}" |\
    grep 'fatal: this operation must be run in a work tree')"
  if [ -z "${git_dir}" ]; then
    local unstaged="$(echo "${git_status}" |\
      grep 'Changes not staged for commit')"
    local staged="$(echo "${git_status}" | grep 'Changes to be committed')"
    local untracked="$(echo "${git_status}" | grep 'Untracked files')"
    local remote="$(git branch --list \
      "$(git branch --show-current)" "--format=%(upstream:remotename)")"
    local branch="$(sed 's/.*\///g' "$1/.git/HEAD")"
    local count=($(git rev-list --left-right --count $branch...$remote/$branch 2>&1))
    local state=""

    if [ -n "$unstaged" ]; then
      state+="${gunstaged_color}${gunstaged_char}"
    fi
    if [ -n "$staged" ]; then
      state+="${gstaged_color}${gstaged_char}"
    fi
    if [ -n "$untracked" ]; then
      state+="${guntracked_color}${guntracked_char}"
    fi
    if [ -e "$1/.git/refs/stash" ]; then
      state+="${gstash_color}${gstash_char}"
    fi
    if [ "${count[0]}" != "fatal:" ]; then
      if [ "${count[0]}" -ne 0 ]; then
        state+="${gahead_color}${gahead_char}"
      fi
      if [ "${count[1]}" -ne 0 ]; then
        state+="${gbehind_color}${gbehind_char}"
      fi
    fi

    if [ -n "$state" ]; then
      echo "${gstatus_color}${BO}$state${gstatus_color}${BC}"
    fi
  fi
}
__ps1_git_branch() {
  #Takes git_dir as argument
  echo "${gbranch_color}${BO}$(sed 's/.*\///g' "$1/.git/HEAD")${BC}"
}
__ps1_cwd() {
  #Takes dir to shorten as argument
  local pwd="$(realpath "$PWD")"
  local cwd="$(echo "$pwd" | sed "s/${HOME//\//\\\/}/~/")"
  if [ -z "$1" ]; then
    echo "${cwd_color}${BO}$cwd${BC}"
  else
    cwd="$(echo "$pwd" | sed "s/${1//\//\\\/}//")"
    if [ -n "$cwd" ]; then
      echo "${cwd_color}${BO}.$cwd${BC}"
    fi
  fi
}
__ps1_project() {
  local dir="$(realpath "$PWD")"
  while [ "$dir" != "/" ]; do
    if [ -d "$dir/.git" ] || [ -d "$dir/.venv" ] ||
       [ -d "$dir/.renv" ]; then
           echo "$dir"
      return
    fi
    dir="$(dirname "$dir")"
  done
}
__ps1_venv() {
  if [ -n "${VIRTUAL_ENV}" ]; then
    echo "1"
  else
    echo "0"
  fi
}
__ps1_renv() {
  if [ -n "${RUN_ENV}" ]; then
    echo "1"
  else
    echo "0"
  fi
}
__ps1_jobs() {
  local job_count="$(jobs -r | wc -l)"
  if [ "${job_count}" -ne 0 ]; then
    echo "${jobs_color}${BO}${job_count}${BC}"
  fi
}

R='\001\e[31m\002'
G='\001\e[32m\002'
B='\001\e[34m\002'
C='\001\e[36m\002'
M='\001\e[35m\002'
Y='\001\e[33m\002'
RESET='\001\e[00m\002'
BO='('
BC=')'

venv_color="${B}"
renv_color="${R}"
vrenv_color="${M}"

jobs_color="${M}"
cwd_color="${B}"
host_color="${G}"
user_color="${R}"
project_color="${C}"
gbranch_color="${G}"
gstatus_color="${G}"

gunstaged_color="${R}"
guntracked_color="${R}"
gstash_color="${B}"
gstaged_color="${G}"
gahead_color="${G}"
gbehind_color="${R}"
cursor="\001\e[5 q\002"

env_char="."
gunstaged_char='*'
guntracked_char='%'
gstash_char='≡'
gstaged_char='+'
gahead_char='↑'
gbehind_char='↓'

__ps1() {
  local st="$?"
  local git_present="0"
  if [[ "$st" != 0 ]]; then
    local x="${R}${BO}$st${BC}"
  fi

  local jobs="$(__ps1_jobs)"
  local host="$(__ps1_host)"
  local user="$(__ps1_user)"

  local git="$(__ps1_git_dir)"
  local project_dir="$(__ps1_project)"
  if [ -n "$git" ]; then
    local branch="$(__ps1_git_branch "$git")"
    local state="$(__ps1_git_status "$git")"
    local git_present="1"
  fi
  if [ -n "${project_dir}" ]; then
    local project_color="$(bits_to_color "$(__ps1_renv)" "${git_present}" "$(__ps1_venv)")"
    local project="${project_color}${BO}$(basename "${project_dir}")${BC}"
  fi
  local cwd="$(__ps1_cwd "$project_dir")"

  PS1="${x}${jobs}${host}${user}${project}${branch}${state}${cwd}${RESET}${cursor} "

  local PS1_CLEAN="$(echo "$PS1" |\
    sed 's/\\001\\e\[[0-9]\+m\\002//g;s/\[[0-9]*m//g')"
  if (( "${#PS1_CLEAN}>${COLUMNS}/2" )); then
    PS1="╭${PS1}\n╰🢒 "
  fi
}

cd() {
  local prev="$(realpath "$PWD")"
  local path
  builtin cd "$@" || return

  if [ -n "${VIRTUAL_ENV}" ] &&
    case $(realpath "$PWD") in $(dirname ${VIRTUAL_ENV})*) false;; *) true;; esac; then
    deactivate
  fi

  if [ -n "${RUN_ENV}" ] &&
    case $(realpath "$PWD") in $(dirname ${RUN_ENV})*) false;; *) true;; esac; then
    close >/dev/null
  fi

  path=".renv"
  while [ ! -d "$path" ] && [ "$(realpath "$path")" != "/.renv" ]; do
    path="../$path"
  done
  if [ -d "$path" ]; then
    if [ -z "${RUN_ENV}" ]; then
      . "$path/open"
    elif ([ -z "${RUN_ENV}" ] || [ "$(realpath "$path")" != "$(realpath "${RUN_ENV}")" ]) && 
      case $(realpath $(dirname "$path")) in $(dirname ${RUN_ENV})*) true;; *)false;; esac; then
      close
      . "$path/open"
    fi
  fi

  path=".venv"
  while [ ! -d "$path" ] && [ "$(realpath "$path")" != "/.venv" ]; do
    path="../$path"
  done
  if [ -d "$path" ]; then
    if [ -z "${VIRTUAL_ENV}" ]; then
      . "$path/bin/activate"
    elif ([ -z "${VIRTUAL_ENV}" ] || [ "$(realpath "$path")" != "$(realpath "${VIRUTAL_ENV}")" ]) && 
      case $(realpath $(dirname "$path")) in $(dirname ${VIRUTAL_ENV})*) true;; *)false;; esac; then
      deactivate
      . "$path/bin/activate"
    fi
  fi

  ls
}

cdu() {
  path="$PWD"
  while ! [[ "$(basename "$path")" =~ .*$1.* ]] && [ "$path" != "/" ]; do
    path="$(dirname "$path")"
  done
  if [ "$path" != "/" ] || [ "$1" = "/" ]; then
    cd "$path"
  fi
}

cdd() {
  while [ -n "$2" ]; do
    dest=""
    i=0
    while [ -z "$dest" ] || [ "$i" = "50" ]; do
      dest="$(find -mindepth "$i" -maxdepth "$i" -name "*$1*" -print -quit 2>/dev/null)"
      i=$(($i+1))
    done
    if [ -n "$dest" ]; then
      builtin cd "$dest"
    fi
    shift
  done
  dest=""
  i=0
  while [ -z "$dest" ] || [ "$i" = "50" ]; do
    dest="$(find -mindepth "$i" -maxdepth "$i" -name "*$1*" -print -quit 2>/dev/null)"
    i=$(($i+1))
  done
  if [ -n "$dest" ]; then
    cd "$dest"
  fi
}

cdud() {
  path="$PWD"
  while ! [[ "$(basename "$path")" =~ .*$1.* ]] && [ "$path" != "/" ]; do
    path="$(dirname "$path")"
  done
  if [ "$path" != "/" ] || [ "$1" = "/" ]; then
    builtin cd "$path"
  fi
  shift
  cdd $@
}

cd.() {
  cd "../$1"
}

cd..() {
  cd "../../$1"
}

cd...() {
  cd "../../../$1"
}

cd....() {
  cd "../../../../$1"
}

clean_ps1() {
  export PROMPT_COMMAND=''
  PS1='$ '
}

normal_ps1() {
  export PROMPT_COMMAND=__ps1
}

normal_ps1
