check_cmd pyenv && eval "$(pyenv init -)"
check_cmd rbenv && eval "$(rbenv init -)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi
