# vim: set ft=sh:

# UI colors.
reset="\[\033[0m\]"
blue="\[\033[34m\]"
red="\[\033[31m\]"
yellow="\[\033[33m\]"

user=$(whoami)
hostname=$(hostname)
if [[ "$OSTYPE" == "darwin"* ]]; then
  hostname=$(scutil --get ComputerName)
fi
export PS1="${yellow}${user}${reset}@${blue}${hostname}${reset}:${red}\w >${reset} "

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

if [[ "$OSTYPE" == "darwin"* ]]; then
  export JGLDEV=$HOME/Developer
#elif [[ "$OSTYPE" == "linux-gnu" ]]; then
#elif [[ "$OSTYPE" == "cygwin" ]]; then
#elif [[ "$OSTYPE" == "msys" ]]; then
#elif [[ "$OSTYPE" == "win32" ]]; then
#elif [[ "$OSTYPE" == "freebsd"* ]]; then
else
  export JGLDEV=$HOME/dev
fi

add_path /usr/local/bin
add_path /usr/local/go/bin
add_path $HOME/.emacs.d/bin
add_path $HOME/anaconda2/bin
add_path $HOME/.homebrew/opt/go/libexec/bin
remove_path $HOME/bin
remove_path $HOME/.homebrew/bin

# If kaleidoscope in installed then set as diff tool for P4.
type -P ksdiff &>/dev/null && export P4DIFF=/usr/local/bin/ksdiff
type -P ksdiff &>/dev/null && export P4MERGE=/usr/local/bin/ksdiff

# Set alias for Vim if MacVim is installed.
if [ -f "/Applications/MacVim.app/Contents/MacOS/Vim" ]; then
  alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
fi

export ALTERNATE_EDITOR=""
export VISUAL=vim
export EDITOR=vim

# Go-lang.
export GOPATH=$HOME/go
add_path $GOPATH/bin
alias god="cd $GOPATH"

[ -f ${HOME}/.homebrew/etc/bash_completion ] && . ${HOME}/.homebrew/etc/bash_completion

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
add_path $HOME/.homebrew/bin
add_path $HOME/bin

# If rbenv is installed the initialize.
if which rbenv > /dev/null; then eval "$(rbenv init - sh)"; fi
