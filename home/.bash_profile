# Stop if not running interactively.

[ -z "$PS1" ] && return

# Resolve BASH_CONFIG_DIR.

BASH_CONFIG_DIR="$HOME/.config/bash"

BASH_LOCAL_PRE_CONFIG_DIR="$BASH_CONFIG_DIR/local_pre"
if [ -d "$BASH_LOCAL_PRE_CONFIG_DIR" ]; then
    for LOCAL_FILE in $BASH_LOCAL_PRE_CONFIG_DIR/*.bash; do
	[ -f "$LOCAL_FILE" ] && . "$LOCAL_FILE"
    done
fi

# Source bash config files.files

for CONFIG_FILE in "$BASH_CONFIG_DIR"/{functions,env,paths,packages,aliases}.bash; do
  [ -f "$CONFIG_FILE" ] && . "$CONFIG_FILE"
done

# Source local configs.

BASH_LOCAL_CONFIG_DIR="$BASH_CONFIG_DIR/local_post"
if [ -d "$BASH_LOCAL_CONFIG_DIR" ]; then
  for LOCAL_FILE in $BASH_LOCAL_CONFIG_DIR/*.bash; do
    [ -f "$LOCAL_FILE" ] && . "$LOCAL_FILE"
  done
fi

# Clean up.

unset BASH_CONFIG_FILE CONFIG_FILE LOCAL_FILE

# Export

export BASH_CONFIG_DIR BASH_LOCAL_PRE_CONFIG_DIR BASH_LOCAL_CONFIG_DIR

if ! command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
else
  [ -f "$BASH_CONFIG_DIR/prompt.bash" ] && . "$BASH_CONFIG_DIR/prompt.bash"
fi


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source "$HOME/.cargo/env"
