export XDG_CONFIG_HOME=$HOME/.config

export HISTSIZE=32768
export HISTFILESIZE=${HISTSIZE}
export SAVEHIST=4096
export HISTCONTROL=ignoredups:erasedups

export CLICOLOR=1

export LC_ALL=en_US.UTF-8
export LANG=en_US

export LESS_TERMCAP_md="${yellow}"

export MANPAGER='less -X'

shopt -s nocaseglob
if [ ${BASH_VERSINFO[0]} -ge 4 ]; then
  shopt -s globstar
fi
shopt -s histappend
shopt -s cdspell
shopt -s no_empty_cmd_completion
shopt -s checkwinsize

export ANDROID_HOME=$HOME/android/sdk
export ANDROID_SDK_ROOT=$HOME/android/sdk
export ANDROID_AVD_HOME=$HOME/.android/avd
export GOPATH=$HOME/go

GPG_TTY=`tty`
export GPG_TTY
