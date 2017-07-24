step() {
  line="---------------------------"
  STEP_NAME=$1
  printf '\e[32m-- %s %s\e[0m\n' $STEP_NAME "${line:${#STEP_NAME}}"
}

step "Zsh"
installers/install-zsh.sh

step "Bash"
installers/install-bash.sh

step "Vim"
installers/install-vim.sh

step "Hammerspoon"
installers/install-hammerspoon.sh

step "Tmux"
installers/install-tmux.sh

step "Git"
installers/install-git.sh

step "Mercurial"
installers/install-mercurial.sh

