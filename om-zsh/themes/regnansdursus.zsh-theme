prompt_setup_regnansdursus() {
  prompt="%{$fg[red]%}%n@%m%0~ $ %{$reset_color%}"
  local nl=$'\n%{\r%}';
  PROMPT="$nl$prompt"
}

prompt_setup_regnansdursus
