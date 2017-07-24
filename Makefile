all:
	bash setup.sh

.PHONY: zsh bash vim emacs tmux git mercurial hammerspoon

zsh:
	bash installers/install-zsh.sh

bash:
	bash installers/install-bash.sh

vim:
	bash installers/install-vim.sh

tmux:
	bash installers/install-tmux.sh

git:
	bash installers/install-git.sh

mercurial:
	bash installers/install-mercurial.sh

hammerspoon:
	bash installers/install-hammerspoon.sh
