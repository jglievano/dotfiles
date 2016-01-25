prompt_setup_regnansdursus() {
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}d%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  base_prompt="%{$fg[yellow]%}%n@%m%{$reset_color%}
%{$fg[yellow]%}%0~%{$reset_color%}%{$fg[red]%}%{$reset_color%}"
  post_prompt='%{$fg[yellow]%}$%{$reset_color%} '

  base_prompt_nocolor=$(echo "$base_prompt" | perl -pe "s/%\{[^}]+\}//g")
  post_prompt_nocolor=$(echo "$post_prompt" | perl -pe "s/%\{[^}]+\}//g")

  precmd_functions+=(prompt_regnansdursus_precmd)
}

prompt_regnansdursus_precmd() {
  local gitinfo=$(git_prompt_info)
  local gitinfo_nocolor=$(echo "$gitinfo" | perl -pe "s/%\{[^}]+\}//g")

  local nl=$'\n%{\r%}';

  PROMPT="$nl$base_prompt $gitinfo$post_prompt"
}

prompt_setup_regnansdursus
