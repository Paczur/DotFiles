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

__ps1_host() {
  if [ -n "$(pstree -ps $$ | grep "sshd")" ]; then
    echo "${host_color}${host_bo}$(hostname -s)${host_bc}"
  fi
}
__ps1_user() {
  local user="$(whoami)"
  if [ "$user" != "paczur" ]; then
    echo "${user_color}${user_bo}${user}${user_bc}"
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
      echo "${gstatus_color}${gstatus_bo}$state${gstatus_color}${gstatus_bc}"
    fi
  fi
}
__ps1_git_branch() {
  #Takes git_dir as argument
  local branch="$(sed 's/ref: refs\/heads\///g' "$1/.git/HEAD")"
  if [ "$branch" = "master" ] || [ "$branch" = "main" ]; then
    echo "${gmaster_color}${gmaster_bo}${branch}${gmaster_bc}"
  else
    echo "${gbranch_color}${gbranch_bo}${branch}${gbranch_bc}"
  fi
}
__ps1_cwd() {
  #Takes dir to shorten as argument
  local pwd="$(realpath "$PWD")"
  local cwd="$(echo "$pwd" | sed "s/${HOME//\//\\\/}/~/")"
  if [ -z "$1" ]; then
    echo "${cwd_color}${cwd_bo}$cwd${cwd_bc}"
  else
    cwd="$(echo "$pwd" | sed "s/${1//\//\\\/}//")"
    if [ -n "$cwd" ]; then
      echo "${cwd_color}${cwd_bo}.$cwd${cwd_bc}"
    fi
  fi
}
__ps1_project_dir() {
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
__ps1_jobs() {
  local job_count="$(jobs -r | wc -l)"
  if [ "${job_count}" -ne 0 ]; then
    echo "${jobs_color}${jobs_bo}${job_count}${jobs_bc}"
  fi
}

Red='\001\e[31m\002'
Green='\001\e[32m\002'
Yellow='\001\e[33m\002'
Gray='\001\e[37m\002'
RESET='\001\e[00m\002'

err_bo='['
err_bc=']'
err_color="${Red}"
jobs_bo='{'
jobs_bc='}'
jobs_color="${Yellow}"
cwd_bo='('
cwd_bc=')'
cwd_color="${Gray}"
host_bo='('
host_bc=')'
host_color="${Green}"
user_bo='('
user_bc=')'
user_color="${Red}"
project_bo='['
project_bc=']'
project_color="${Gray}"
gbranch_bo='['
gbranch_bc=']'
gbranch_color="${Gray}"
gmaster_bo='['
gmaster_bc=']'
gmaster_color="${Yellow}"
gstatus_bo='['
gstatus_bc=']'
gstatus_color="${Gray}"

gunstaged_color="${Red}"
guntracked_color="${Red}"
gstash_color="${Yellow}"
gstaged_color="${Green}"
gahead_color="${Green}"
gbehind_color="${Red}"
cursor="\001\e[5 q\002"

env_char="."
gunstaged_char='*'
guntracked_char='%'
gstash_char='▣'
gstaged_char='+'
gahead_char='↑'
gbehind_char='↓'

__ps1() {
  local st="$?"
  local git_present="0"
  if [[ "$st" != 0 ]]; then
    local x="${err_color}${err_bo}$st${err_bc}"
  fi

  local jobs="$(__ps1_jobs)"
  local host="$(__ps1_host)"
  local user="$(__ps1_user)"

  local git="$(__ps1_git_dir)"
  local project_dir="$(__ps1_project_dir)"
  if [ -n "$git" ]; then
    local branch="$(__ps1_git_branch "$git")"
    local state="$(__ps1_git_status "$git")"
    local git_present="1"
  fi
  if [ -n "${project_dir}" ]; then
    local project="${project_color}${project_bo}$(basename "${project_dir}")${project_bc}"
  fi
  local cwd="$(__ps1_cwd "$project_dir")"

  PS1="${x}${jobs}${host}${user}${project}${branch}${state}${cwd}${RESET}${cursor} "

  local PS1_CLEAN="$(echo "$PS1" |\
    sed 's/\\001\\e\[[0-9]\+m\\002//g;s/\[[0-9]*m//g')"
  if (( "${#PS1_CLEAN}>${COLUMNS}/2" )); then
    PS1="╭${PS1}\n╰▶ "
  fi
}

cd() {
  local prev="$(realpath "$PWD")"
  local path
  builtin cd "$@" || return

  rpath=".renv"
  while [ ! -d "$rpath" ] && [ "$(realpath "$rpath")" != "/.renv" ]; do
    rpath="../$rpath"
  done
  vpath=".venv"
  while [ ! -d "$vpath" ] && [ "$(realpath "$vpath")" != "/.venv" ]; do
    vpath="../$vpath"
  done

  if [ -n "${RUN_ENV}" ] &&
     [ "$(realpath "$rpath")" != "$(realpath "${RUN_ENV}")" ]; then
       close >/dev/null
  fi

  if [ -n "${VIRTUAL_ENV}" ] &&
     [ "$(realpath "$vpath")" != "$(realpath "${VIRTUAL_ENV}")" ]; then
       deactivate
  fi

  if [ -z "${VIRTUAL_ENV}" ] && [ -d "$vpath" ]; then
    . "$vpath/bin/activate"
  fi

  if [ -z "${RUN_ENV}" ] && [ -d "$rpath" ]; then
    . "$rpath/open"
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
  local d="$(pf -t dD "$@")"
  if [ -n "$d" ]; then
    cd "$d"
  fi
}

cdud() {
  orig="$PWD"
  path="$PWD"
  while ! [[ "$(basename "$path")" =~ .*$1.* ]] && [ "$path" != "/" ]; do
    path="$(dirname "$path")"
  done
  if [ "$path" != "/" ] || [ "$1" = "/" ]; then
    builtin cd "$path"
  fi
  shift
  cdd "$@"
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
