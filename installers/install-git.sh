#!/usr/bin/env bash

link() {
  SRC=$1; shift
  for symlink in $@; do
    [ ! -e $symlink ] || rm $symlink
    ln -s "`pwd`/$SRC" $symlink
  done
}

link git/gitconfig ~/.gitconfig
link git/gitignore ~/.gitignore_global
