prompt_setup_regnansdursus() {
  prompt="%{$fg[red]%}%1~ $ %{$reset_color%}"
  local nl=$'\n%{\r%}';
  PROMPT="$nl$prompt"
}

prompt_setup_regnansdursus
