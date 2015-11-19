#!/bin/sh

function step {
  line="-----------------------------------------------"
  STEP_NAME=$1
  printf '\e[32m-- %s %s\e[0m\n' $STEP_NAME "${line:${#STEP_NAME}}"
}

step "Install Bash dotfiles"
ln -s bashrc ~/.{bashrc,bash_profile,profile}

step "Install Tmux dotfiles"
ln -s tmux.conf ~/.tmux.conf
ln -s tmux.conf.osx ~/.tmux.conf.osx

step "Install Vim dotfiles"
ln -s vimrc ~/.vimrc
ln -s vimrc.bundles ~/.vimrc.bundles

step "Make Vim required paths"
mkdir -pv ~/.vim/{backup,swap,undo,autoload}

step "Install Vim Plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate +qall now
