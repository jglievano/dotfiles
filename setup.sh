step() {
  line="---------------------------"
  STEP_NAME=$1
  printf '\e[32m-- %s %s\e[0m\n' $STEP_NAME "${line:${#STEP_NAME}}"
}

link() {
  SRC=$1; shift
  for symlink in $@; do
    printf 'Create symlink of %s at %s\n' $SRC $symlink
    [ ! -e $symlink ] || rm $symlink
    ln -s "`pwd`/$SRC" $symlink
  done
}

step "Create required directories"
mkdir -pv ~/.vim/{backup,swap,undo,autoload}
mkdir -pv ~/bin

step "Bash"
link bashrc ~/.{bashrc,bash_profile,profile}

step "Tmux"
link bin/tm ~/bin/tm
link bin/tm-ls ~/bin/tm-ls
link tmux ~/.tmux
link tmux.conf ~/.tmux.conf
link tmux.conf.osx ~/.tmux.conf.osx

step "Emacs"
link bin/m ~/bin/m
link bin/em ~/bin/em
link bin/startem ~/bin/startem
link bin/stopem ~/bin/stopem

step "Vim"
link vimrc ~/.vimrc
link vimrc.keybindings ~/.vimrc.keybindings
link vimrc.bundles ~/.vimrc.bundles
link vim_colors ~/.vim/colors

step "VimPlug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate +qall now

