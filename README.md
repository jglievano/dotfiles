# My Dot files

This is where my dot files lie.

## What's the purpose of this dotfiles repo?

1. Provide configuration files that can be used in platforms useful to me:
       - macOS.
       - Ubuntu/Debian.
       - ArchOS.
       - Windows.
2. Provide a flexible installation script that dynamically detects system
   needs but also allows for manual setup.

## How it does it?

`dotfiles-init` is a script that can be called remotely. It will download
all relevant files and create symbolic links where necessary via `stow`.
Then it will install programs and application necessaryf or each
platform.

## Configuration files:

- Bash
- Git
- Vim/Neovim
- SSH
- Tmux

## Installations:

- Tmux
- Neovim
- Git (latest)
- Bash (latest)
- Rust
- Bazel
- Stow
- Exa
- Go
- Hack Nerd Font
- Docker
- GPG

## macOS specific installations:

- iTerm 3

## Ubuntu specific installations:

- mailspring
