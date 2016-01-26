prompt_setup_regnansdursus() {
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}d%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  base_prompt="%{$fg[yellow]%}%n@%m%{$reset_color%}
%{$fg[red]%}%0~%{$reset_color%}%{$fg[red]%}%{$reset_color%}"
  post_prompt='%{$fg[red]%}$%{$reset_color%} '

  precmd_functions+=(prompt_regnansdursus_precmd)
}

prompt_regnansdursus_precmd() {
  local gitprompt=$(git_super_status)
  local nl=$'\n%{\r%}';
  PROMPT="$nl$base_prompt $gitprompt$post_prompt"
}

prompt_setup_regnansdursus
