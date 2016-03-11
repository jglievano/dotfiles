local nl=$'\n%{\r%}';
base_prompt="%{$fg[red]%}%n@%m%0~ $%{$reset_color%}"
PROMPT="$nl$base_prompt"
