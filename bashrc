export PS1="\n\[\e[36m\]\u@\h \[\e[31m\]\W\[\e[36m\] \$ \[\e[0m"

function add_path {
  # Check to see if the arg is in PATH.
  if [ "${PATH/$1}" = "$PATH" ]; then
    # Check to see if the arg's directory exists.
    if [ -d $1 ]; then
      PATH=$1:$PATH
    fi
  fi
}
add_path $HOME/bin
add_path $HOME/jglievano/bin
add_path $HOME/.rbenv/bin
add_path $HOME/.rbenv/plugins/ruby-build/bin
add_path $HOME/.homebrew/bin

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
export VISUAL="vim"
export EDITOR="vim"

# .bashrc.local is the place to write any personalized configuration.
if [ -e "$HOME/.bashrc.local" ]; then
  source "$HOME/.bashrc.local"
fi

# Lunchy.
if which lunchy > /dev/null; then
  LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
  if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
    . $LUNCHY_DIR/lunchy-completion.bash
  fi
fi

# added by Anaconda 2.3.0 installer
export PATH="/Users/gabriell/anaconda/bin:$PATH"
