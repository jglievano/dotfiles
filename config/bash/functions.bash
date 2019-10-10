add_path() {
  if [[ "${PATH/$1}" = "${PATH}" ]]; then
    if [[ -d $1 ]]; then
      export PATH="$1:${PATH}"
    fi
  fi
}

remove_path() {
  export PATH=$(echo -n "${PATH}" | \
    awk -v RS=: -v ORS=: "$0 != \"$1\"" | \
    sed "s/:$//")
}

say() {
  printf 'say: %s\n' "$1"
}

err() {
  say "$1" >&2
  exit 1
}

need_cmd() {
  if ! check_cmd "$1"; then
    err "need '$1' (command not found)"
  fi
}

check_cmd() {
  command -v "$1" > /dev/null 2>&1
}

# Run command that should never fail.
ensure() {
  if ! "$@"; then err "command failed: $*"; fi
}

# Used to indicate that the command's results are being
# intentionally ignored.
ignore() {
  "$@"
}
