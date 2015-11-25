step() {
  line="---------------------------"
  STEP_NAME=$1
  printf '\e[32m-- %s %s\e[0m\n' $STEP_NAME "${line:${#STEP_NAME}}"
}

link() {
  SRC=$1; shift
  for symlink in $@; do
    printf 'Create symlink of %s at %s\n' $SRC $symlink
    if [ -h $symlink ]; then
      rm $symlink
    fi
    ln -s "`pwd`/$SRC" $symlink
  done
}

step "Bash"
link bashrc ~/.{bashrc,bash_profile,profile}

step "Tmux"
link tmux.conf ~/.tmux.conf
link tmux.conf.osx ~/.tmux.conf.osx

step "Vim"
link vimrc ~/.vimrc
link vimrc.bundles ~/.vimrc.bundles

step "Mkdir"
mkdir -pv ~/.vim/{backup,swap,undo,autoload}

step "VimPlug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate +qall now
