find_root () {
  declare root=$1
  while [[ "${root}" && \
    ! -d "${root}/.hg" && \
    ! -d "${root}/.git" && \
    ! -d "${root}/.citc" ]]; do
    root="${root%/*}"
  done
  printf "${root}"
}

user_hostname () {
  if [ -n "$MY_COMPUTER_NAME" ]; then
    printf "$MY_COMPUTER_NAME"
  elif [[ "$OSTYPE" == darwin* ]]; then
    printf "$(scutil --get ComputerName)"
  else
    printf "$(hostname)"
  fi
}

user_name () {
  if [ -z ${MY_USER_NAME+x} ]; then
          printf "$(whoami)"
  else
    printf "$MY_USER_NAME"
  fi
}

color_p () {
  declare fg="$1" \
          bg="$2"
  printf "\[\033[48;5;${bg};38;5;${fg}m\]"
}

colorfg_p () {
  declare fg="$1"
  printf "\[\033[38;5;${fg}m\]" 
}

color_rst () {
  printf "\[\033[00m\]"
}

branch_prompt () {
  declare root_name="$1" \
    branch=$(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/') \
    git_dir=$(git rev-parse --git-dir 2>/dev/null)
  if [[ -n $git_dir ]]; then
    # TODO: 41/101 (red) for dirty branch.
    printf "${root_abbrev}$(colorfg_p 76)<${branch}>$(color_rst)"
  else
    printf "${root_abbrev}"
  fi
}

prompt_string () {
  declare EXIT="$1" \
    root_abbrev="" \
    path=$(pwd -P) \
    username="$(user_name)" \
    hostname="$(user_hostname)"

  local vcs_toplevel=$(find_root "${path}" 2>/dev/null)
  if [[ -n "${vcs_toplevel}" ]]; then
    root_abbrev="$(basename $vcs_toplevel)"
    path="${path/$vcs_toplevel/}"
  elif [[ "${path}" = "${HOME}"* ]]; then
    root_abbrev="~"
    path="${path/$HOME/}"
  fi
  path="${path#'/'}"
  if [[ "${root_abbrev}" == "" ]]; then
    root_abbrev="/"
  fi

  case "$TERM" in
    xterm-color|xterm-256color) color_prompt=yes;;
  esac
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
  if [ "$color_prompt" = yes ]; then
    printf "$(colorfg_p 252)${hostname}"
    printf "$(colorfg_p 31):"
    printf "$(colorfg_p 166)$(branch_prompt $root_abbrev)$(colorfg_p 166)/${path}"
    printf "$(colorfg_p 31)\$ "
  else
    printf "\u ${hostname}| $(branch_prompt $root_abbrev)/${path}\n$ "
  fi
  unset color_prompt
}

set_prompt () {
  local exit="$?"
  PS1="$(prompt_string $exit)"
}

PROMPT_COMMAND="set_prompt"
