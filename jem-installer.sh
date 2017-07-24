#!/usr/bin/env bash

install_jem () {
    printf "$CYAN Cloning JGEmacs repository...\n$RESET"
    /usr/bin/env hg clone $JEM_URL "$JEM_INSTALL_DIR" > /dev/null
    if ! [ $? -eq 0 ]
    then
        printf "$RED A fatal error ocurred. Aborting..."
        exit 1
    fi
}

make_jem_dirs () {
    printf " Making the required directories.\n$RESET"
    mkdir -p "$JEM_INSTALL_DIR/savefile"
}

colors_ () {
    RESET='\e[0m'
    RED='\e[0;31m'
    GREEN='\e[0;32m'
    YELLOW='\e[0;33m'
    BLUE='\e[0;34m'
    PURPLE='\e[0;35m'
    CYAN='\e[0;36m'
    WHITE='\e[0;37m'
    BRED='\e[1;31m'
    BGREEN='\e[1;32m'
    BYELLOW='\e[1;33m'
    BBLUE='\e[1;34m'
    BPURPLE='\e[1;35m'
    BCYAN='\e[1;36m'
    BWHITE='\e[1;37m'
}

server_ok() {
    emacsclient -a "false" -e "(boundp 'server-process)"
}

usage() {
    printf "Usage: $0 [OPTION]\n"
    printf "\n"
}

colors_

VERBOSE_COLOR=$BBLUE

[ -z "$JEM_URL" ] && JEM_URL="ssh://hg@bitbucket.org/jglievano/jgemacs"
[ -z "$JEM_INSTALL_DIR" ] && JEM_INSTALL_DIR="$HOME/.emacs.d"

printf "$VERBOSE_COLOR"
printf "INSTALL_DIR = $JEM_INSTALL_DIR\n"
printf "SOURCE_URL  = $JEM_URL\n"
printf "$RESET"

# If JGEmacs is already installed.
if [ -f "$JEM_INSTALL_DIR/core/jem-core.el" ]
then
    printf "\n\n$BRED"
    printf "You already have JGEmacs installed.$RESET\n"
    printf "Remove and try again."
    exit 1;
fi

printf "$CYAN Checking to see if aspell is installed..."
if hash aspell 2>&-
then
    printf "$GREEN found.$RESET\n"
else
    printf "$RED not found. Install aspell to benefit from flyspell-mode!$RESET\n"
fi

if [ $(emacs --version 2>/dev/null | sed -n 's/.*[^0-9.]\([0-9]*\.[0-9.]*\).*/\1/p;q' | sed 's/\..*//g') -lt 24 ]
then
pppp    printf "$YELLOW WARNING:$RESET JGEmacs depends on Emacs $RED 24$RESET !\n"
fi

install_jem
make_jem_dirs
cp "$JEM_INSTALL_DIR/sample/jem-modules.el" "$JEM_INSTALL_DIR"

if [ "t" == "$(server_ok)" ]; then
    printf "$GREEN Shutting down Emacs server.$RESET\n"
    emacsclient -e '(kill-emacs)'
fi

if which emacs > /dev/null 2>&1
then
    printf "$CYAN Bytecompiling JGEmacs.\n"
    emacs -batch -f batch-byte-compile "$JEM_INSTALL_DIR/core"/*.el > /dev/null 2>&1
fi

printf "\n"
printf "$BBLUE    _____ _______   _______                            \n"
printf "$BBLUE  _|     |     __| |    ___|.--------.---.-.----.-----.\n"
printf "$BBLUE |       |    |  | |    ___||        |  _  |  __|__ --|\n"
printf "$BBLUE |_______|_______| |_______||__|__|__|___._|____|_____|\n"
printf "$BBLUE                                                       \n"

