if [ -n "$TMUX" ]; then
  SESSION_NAME=`tmux display-message -p '#S'`
else
  SESSION_NAME=`hostname -s`
fi

export PS1="\n\[\e[36m\]\u@${SESSION_NAME} \[\e[31m\]\W\[\e[36m\] \$ \[\e[0m"

function add_path {
  # Check to see if the arg is in PATH.
  if [ "${PATH/$1}" = "$PATH" ]; then
    # Check to see if the arg's directory exists.
    if [ -d $1 ]; then
      PATH=$1:$PATH
    fi
  fi
}
add_path /usr/local/go/bin
add_path $HOME/bin
add_path $HOME/enki/bin
add_path $HOME/.rbenv/bin
add_path $HOME/.rbenv/plugins/ruby-build/bin
add_path $HOME/.homebrew/bin
add_path $HOME/.homebrew/opt/go/libexec/bin
add_path $HOME/anaconda/bin

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

# Go-lang.
export GOPATH=$HOME/go
add_path $GOPATH/bin
alias god="cd $GOPATH"

# Enki.
export ENKIPATH=$HOME/jglievano

# Aliases.
alias l="ls -lA"
alias gs="git status -s"
alias ga="git add -A && git commit"
alias gp="git push"
alias bex="bundle exec"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
