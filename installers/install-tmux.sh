#!/usr/bin/env bash

link() {
  SRC=$1; shift
  for symlink in $@; do
    [ ! -e $symlink ] || rm $symlink
    ln -s "`pwd`/$SRC" $symlink
  done
}

mkdir -pv ~/bin
link bin/tm ~/bin/tm
link bin/tm-ls ~/bin/tm-ls
link tmux/tmux.conf ~/.tmux.conf
link tmux/tmux-osx.conf ~/.tmux-osx.conf
