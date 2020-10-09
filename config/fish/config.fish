function prepend_to_path -d "Prepend dir to PATH if it is not already there"
  if test -d $argv[1]
    if not contains $argv[1] $PATH
      set -gx PATH "$argv[1]" $PATH
    end
  end
end

set -gx RUST_SRC_PATH "$HOME/src/rust"

set -gx PATH "/sbin"
prepend_to_path "/usr/sbin"
prepend_to_path "/bin"
prepend_to_path "/usr/bin"
prepend_to_path "/usr/local/sbin"
prepend_to_path "/usr/local/go/bin"
prepend_to_path "$HOME/.cargo/bin"
prepend_to_path "$HOME/.local/bin"
prepend_to_path "$HOME/bin"
prepend_to_path "$HOME/android/sdk/tools"
prepend_to_path "$HOME/android/sdk/tools/bin"
prepend_to_path "$HOME/android/sdk/platform-tools"
prepend_to_path "$HOME/go/bin"
prepend_to_path "/usr/local/bin"
prepend_to_path "$HOME/.homebrew/bin"

if type -q exa
  function l; exa $argv; end
  function ll; exa -la $argv; end
  function lx; exa -abghHliS $argv; end
else
  function l; ls -lA1 $argv; end
  function ll; ls -lA $argv; end
  function lx; ls -l $argv; end
end

set editor 'vim'
set -g -x ALTERNATE_EDITOR ''
set -g -x VISUAL $editor
set -g -x EDITOR $editor

function nvm -d "nvm bass wrapper"
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

function es -d "Manage Emacs"
  if type -q emacs
    switch $argv[1]
      case "stop"
        emacsclient -e "(kill-emacs)"
      case "start"
        emacs --daemon
      case "*"
        echo "usage: es <start|stop>"
    end
  end
end

function ew -d "Start Emacs on a window"
  if type -q emacsclient
    emacsclient -nc $1
  end
end

function et -d "Start Emacs on terminal"
  if type -q emacsclient
    emacsclient -nw $1
  end
end

function tm -d "Launch tmux session"
  set session (hostname -s)
  set -q argv[1]; and set session $argv[1]
  echo "Created tmux session $session"
  tmux -S /tmp/tmux_shared new -A -s $session -n ws
end

if type -q rbenv
  status --is-interactive; and . (rbenv init -|psub)
end

if type -q pyenv
  . (pyenv init -|psub)
end

if type -q starship
  starship init fish | source
end

if test -f $HOME/.local.fish
  . $HOME/.local.fish
end
