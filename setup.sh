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

step "Bash"
link bashrc ~/.{bashrc,bash_profile,profile}

step "Zsh"
link om-zsh ~/.om-zsh

step "Tmux"
link tmux.conf ~/.tmux.conf
link tmux.conf.osx ~/.tmux.conf.osx

step "Vim"
mkdir -pv ~/.vim/{backup,swap,undo,autoload}
link vimrc ~/.vimrc
link vimrc.bundles ~/.vimrc.bundles

step "VimPlug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpdate +qall now

step "Mutt"
mkdir -pv ~/.mutt/{alias,cache/headers,cache/bodies,certificates,temp,sig}
mkdir -pv ~/.mutt/themes/solarized
link muttrc ~/.muttrc
link mutt/themes/solarized/mutt-colors-solarized-dark-16.muttrc ~/.mutt/themes/solarized/mutt-colors-solarized-dark-16.muttrc
link mutt/mailcap ~/.mutt/mailcap
link mutt/view_attachment.sh ~/.mutt/view_attachment.sh

step "OfflineIMAP"
mkdir -pv ~/.mail/fastmail
[ -f ~/.offlineimaprc ] || cp offlineimaprc ~/.offlineimaprc
link mutt/offlineimap.py ~/.mutt/offlineimap.py

step "MSMTP"
link CA-bundle.crt ~/.CA-bundle.crt
link msmtprc ~/.msmtprc

step "Spacemacs"
link spacemacs ~/.spacemacs

echo "Remember to install:"
echo " - offlineimap"
echo " - mutt"
echo " - msmtp"
echo " - urlview"
echo " - spacemacs:"
echo "   git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d"
