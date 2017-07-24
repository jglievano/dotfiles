build_prompt() {
  RETVAL=$?
  echo -n "\n"
  echo -n "%F{yellow}%c %B%F{blue}○%b%f%k"
}

autoload -U colors && colors

setopt prompt_subst
PROMPT='%{%f%b%k%}$(build_prompt) '

RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
