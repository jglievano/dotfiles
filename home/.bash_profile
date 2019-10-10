# Stop if not running interactively.

[ -z "$PS1" ] && return

# Resolve BASH_CONFIG_DIR.

READLINK=$(which greadlink 2>/dev/null || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  BASH_CONFIG_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.config/bash" ]; then
  BASH_CONFIG_DIR="$HOME/.config/bash"
else
  echo "Unable to find bash config files, exiting."
  return
fi

# Source bash config files.

for CONFIG_FILE in "$BASH_CONFIG_DIR"/{functions,paths,env,aliases,prompt}.bash; do
  [ -f "$CONFIG_FILE" ] && . "$CONFIG_FILE"
done

# Source local configs.

BASH_LOCAL_CONFIG_DIR="$BASH_CONFIG_DIR/local"
if [ -d "$BASH_LOCAL_CONFIG_DIR" ]; then
  for LOCAL_FILE in "$BASH_LOCAL_CONFIG_DIR/*.bash"; do
    [ -f "$LOCAL_FILE" ] && . "$LOCAL_FILE"
  done
fi

# Clean up.

unset READLINK CURRENT_SCRIPT SCRIPT_PATH BASH_CONFIG_FILE LOCAL_FILE

# Export

export BASH_CONFIG_DIR BASH_LOCAL_CONFIG_DIR
