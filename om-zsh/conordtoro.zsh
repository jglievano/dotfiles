function add_path {
  if [ "${PATH/$1}" = "$PATH" ]; then
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
add_path $HOME/anaconda.bin
add_path /usr/local/heroku/bin

command -v ksdiff >/dev/null && export P4DIFF=/usr/local/bin/ksdiff
command -v ksdiff >/dev/null && export P4MERGE=/usr/local/bin/ksdiff

command -v rbenv >/dev/null && eval "$(rbenv init - zsh)"

export ALTERNATE_EDITOR=""
export VISUAL="vim"
export EDITOR="vim"

export GOPATH=$HOME/go
add_path $GOPATH/bin
alias god=". cd $GOPATH"

alias l="ls -lA"
alias gs="git status -s -b"
alias ga="git add -A && git commit"
alias gp="git push"
alias bex="bundle exec"
command -v mvim >/dev/null && alias vim="mvim -v"

if [[ -e ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
