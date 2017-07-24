#!/usr/bin/env bash

link() {
  SRC=$1; shift
  for symlink in $@; do
    [ ! -e $symlink ] || rm $symlink
    ln -s "`pwd`/$SRC" $symlink
  done
}

mkdir -pv ~/.vim/{backup,swap,undo,autoload}
link vim/colors ~/.vim/colors
link vim/syntax ~/.vim/syntax
link vim/bundles.vim ~/.vim/bundles.vim
link vim/keybindings.vim ~/.vim/keybindings.vim
link vim/vimrc.vim ~/.vim/vimrc
link vim/vimrc.vim ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate +qall now
