# vim: set ft=sh:

# UI colors.
TERM=screen-256color

D=$'\[\e[m\]'
RED=$'\[\e[;31m\]'
YELLOW=$'\[\e[;33m\]'
LYELLOW=$'\[\e[;93m\]'
BLUE=$'\[\e[;34m\]'
CYAN=$'\[\e[;36m\]'
LCYAN=$'\[\e[;96m\]'
GREEN=$'\[\e[;32m\]'
GRAY=$'\[\e[;37m\]'

hostname=$(hostname)
HOMEBREWPATH=
if [[ "$OSTYPE" == "darwin"* ]]; then
  hostname=$(scutil --get ComputerName)
  if [ -d ${HOME}/.homebrew ]; then
    HOMEBREWPATH=${HOME}/.homebrew
  else
    HOMEBREWPATH=/usr/local
  fi
fi

export PS1="\n${GRAY}○ \d \t ${YELLOW}@ \h\n${RED}\w${BLUE} ○ ${D}"

function add_path {
  # Check to see if the arg is in PATH.
  if [ "${PATH/$1}" = "$PATH" ]; then
    # Check to see if the arg's directory exists.
    if [ -d $1 ]; then
      export PATH=$1:$PATH
    fi
  fi
}

function remove_path {
  export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`;
}

add_path    /usr/local/bin
add_path    /usr/local/go/bin
add_path    $HOME/.local/bin
add_path    $HOME/anaconda2/bin
remove_path $HOME/bin
remove_path $HOME/.homebrew/bin

# If kaleidoscope in installed then set as diff tool for P4.
type -P ksdiff &>/dev/null && export P4DIFF=/usr/local/bin/ksdiff
type -P ksdiff &>/dev/null && export P4MERGE=/usr/local/bin/ksdiff

alias  v=vim
alias  m="emacsclient -t"
export ALTERNATE_EDITOR=""
export VISUAL="vim"
export EDITOR="vim"

# Android.
export ANDROID_HOME=${HOME}/android-sdk
add_path ${ANDROID_HOME?}/tools
add_path ${ANDROID_HOME?}/tools/bin
add_path ${ANDROID_HOME?}/platform-tools

# Go-lang.
export GOPATH=$HOME/gowork
add_path $GOPATH/bin
alias god="cd $GOPATH"

# Bash-completion.
[ -f ${HOMEBREWPATH}/etc/bash_completion ] && . ${HOMEBREWPATH}/etc/bash_completion

# Aliases.
alias l="ls -lA"
alias gs="git status -s -b"
alias ga="git add -A && git commit"
alias gp="git push"
alias bex="bundle exec"

# .bashrc.local is the place to write any personalized configuration.
if [ -e "$HOME/.bashrc.local" ]; then
  source "$HOME/.bashrc.local"
fi

# Give preference to local installs.
if [[ "$OSTYPE" == "darwin"* ]]; then
  add_path ${HOMEBREWPATH}/bin
fi
add_path $HOME/bin

# If rbenv is installed the initialize.
if which rbenv > /dev/null; then eval "$(rbenv init - sh)"; fi

# added by Anaconda2 4.3.1 installer
export PATH="/anaconda/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

add_path $HOME/.cargo/bin
add_path /usr/local/php5/bin
