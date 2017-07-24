#!/usr/bin/env zsh

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

add_path /usr/local/bin
add_path /usr/local/go/bin
add_path $HOME/.local/bin
add_path $HOME/anaconda2/bin
add_path /Library/Frameworks/Mono.framework/Versions/Current/bin
remove_path $HOME/bin
remove_path $HOME/.homebrew/bin

# If kaleidoscope in installed then set as diff tool for P4.
type -P ksdiff &>/dev/null && export P4DIFF=/usr/local/bin/ksdiff
type -P ksdiff &>/dev/null && export P4MERGE=/usr/local/bin/ksdiff

alias v=vim
alias m="emacsclient -t"
export ALTERNATE_EDITOR=""
export VISUAL="vim"
export EDITOR="vim"

# Go-lang.
export GOPATH=$HOME/gospace
add_path $GOPATH/bin
alias god="cd $GOPATH"

# Aliases.
alias l="ls -lA"

# .zshrc.local is the place to write any personalized configuration.
if [ -e "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

# Give preference to local installs.
add_path $HOME/.homebrew/bin
add_path $HOME/bin

# If rbenv is installed the initialize.
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
