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

for CONFIG_FILE in "$BASH_CONFIG_DIR"/{functions,env,paths,packages,aliases,prompt}.bash; do
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
