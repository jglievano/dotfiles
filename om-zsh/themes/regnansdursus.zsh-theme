prompt_setup_regnansdursus() {
  time="%{$fg_no_bold[black]%}[%W %*]%{$reset_color%}"
  prompt="%{$fg[red]%}%1~ $ %{$reset_color%}"
  local nl=$'\n%{\r%}';
  PROMPT="$time$nl$nl$prompt"
}

prompt_setup_regnansdursus
