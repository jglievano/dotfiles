#!/usr/bin/env bash

link() {
  SRC=$1; shift
  for symlink in $@; do
    [ ! -e $symlink ] || rm $symlink
    ln -s "`pwd`/$SRC" $symlink
  done
}

mkdir -pv ~/.zsh_custom/themes
link zsh/zshrc-custom.zsh ~/.zshrc_custom
link zsh/zsh_custom/themes/jgl.zsh-theme.zsh ~/.zsh_custom/themes/jgl.zsh-theme
[ ! -e ~/.zshrc-local.zsh ] || cp zsh/zshrc-local.zsh ~/.zshrc-local.zsh
