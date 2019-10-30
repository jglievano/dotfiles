# Stop if not running interactively.

[ -z "$PS1" ] && return

# Resolve BASH_CONFIG_DIR.

BASH_CONFIG_DIR="$HOME/.config/bash"

# Source bash config files.

for CONFIG_FILE in "$BASH_CONFIG_DIR"/{functions,env,paths,packages,aliases,prompt}.bash; do
  [ -f "$CONFIG_FILE" ] && . "$CONFIG_FILE"
done

# Source local configs.

BASH_LOCAL_CONFIG_DIR="$BASH_CONFIG_DIR/local"
if [ -d "$BASH_LOCAL_CONFIG_DIR" ]; then
  for LOCAL_FILE in $BASH_LOCAL_CONFIG_DIR/*.bash; do
    [ -f "$LOCAL_FILE" ] && . "$LOCAL_FILE"
  done
fi

# Clean up.

unset BASH_CONFIG_FILE CONFIG_FILE LOCAL_FILE

# Export

export BASH_CONFIG_DIR BASH_LOCAL_CONFIG_DIR

# TODO: move to the correct place.
check_cmd pyenv && eval "$(pyenv init -)"
