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

function es() {
	if [[ $(uname) == "Linux" ]]; then
		EMACS="/usr/bin/emacs"
	elif [[ $(uname) == "Darwin" ]]; then
		EMACS="$HOME/.homebrew/bin/emacs"
	else
		printf "OS not recognized\n"
		exit 1
	fi

	if [[ "$1" == "stop" ]]; then
		emacsclient -e '(kill-emacs)'

	elif [[ "$1" == "start" ]]; then
		emacs --daemon

	else
		printf "usage: es <start|stop>\n"
	fi
}

function ew() {
	emacsclient -nc $1
}

function et() {
	emacsclient -nw $1
}
