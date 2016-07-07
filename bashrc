blue=$(tput setaf 4)
reset=$(tput sgr0)
export PS1="\[$blue\]>\[$reset\] "

function add_path {
  # Check to see if the arg is in PATH.
  if [ "${PATH/$1}" = "$PATH" ]; then
    # Check to see if the arg's directory exists.
    if [ -d $1 ]; then
      PATH=$1:$PATH
    fi
  fi
}

add_path /usr/local/bin
add_path /usr/local/go/bin
add_path $HOME/bin
add_path $HOME/.emacs.d/bin
add_path $HOME/enki/bin
add_path $HOME/.rbenv/bin
add_path $HOME/.rbenv/plugins/ruby-build/bin
add_path $HOME/anaconda2/bin
add_path $HOME/.homebrew/bin
add_path $HOME/.homebrew/opt/go/libexec/bin

# If kaleidoscope in installed then set as diff tool for P4.
type -P ksdiff &>/dev/null && export P4DIFF=/usr/local/bin/ksdiff
type -P ksdiff &>/dev/null && export P4MERGE=/usr/local/bin/ksdiff

# If rbenv is installed the initialize.
if which rbenv > /dev/null; then eval "$(rbenv init - sh)"; fi

# Set alias for Vim if MacVim is installed.
if [ -f "/Applications/MacVim.app/Contents/MacOS/Vim" ]; then
  alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
fi

export ALTERNATE_EDITOR=""
export VISUAL=em
export EDITOR=em

# Go-lang.
export GOPATH=$HOME/go
add_path $GOPATH/bin
alias god="cd $GOPATH"

# Aliases.
if [ -f "${HOME}/.homebrew/bin/emacs" ]; then
  alias emacs="${HOME}/.homebrew/bin/emacs"
  alias emacsclient="${HOME}/.homebrew/bin/emacsclient"
fi
alias l="ls -lA"
alias gs="git status -s -b"
alias ga="git add -A && git commit"
alias gp="git push"
alias bex="bundle exec"

# NixOS.
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh;
fi

# .bashrc.local is the place to write any personalized configuration.
if [ -e "$HOME/.bashrc.local" ]; then
  source "$HOME/.bashrc.local"
fi
