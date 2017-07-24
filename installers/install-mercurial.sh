#!/usr/bin/env bash

link() {
  SRC=$1; shift
  for symlink in $@; do
    [ ! -e $symlink ] || rm $symlink
    ln -s "`pwd`/$SRC" $symlink
  done
}

link mercurial/hgrc ~/.hgrc
link mercurial/hgignore ~/.hgignore
[ ! -e ~/.hgrc.local ] || touch ~/.hgrc.local
