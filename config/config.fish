function prepend_to_path -d "Prepend dir to PATH if it is not already there"
  if test -d $argv[1]
    if not contains $argv[1] $PATH
      set -gx PATH "$argv[1]" $PATH
    end
  end
end

set -gx PATH "/sbin"
prepend_to_path "/usr/sbin"
prepend_to_path "/bin"
prepend_to_path "/usr/bin"
prepend_to_path "/usr/local/sbin"
prepend_to_path "/usr/local/go/bin"
prepend_to_path "$HOME/.local/bin"
prepend_to_path "$HOME/bin"
prepend_to_path "$HOME/android/sdk/tools"
prepend_to_path "$HOME/android/sdk/tools/bin"
prepend_to_path "$HOME/android/sdk/platform-tools"
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
