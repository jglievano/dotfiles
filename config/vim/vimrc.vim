set encoding=utf-8
scriptencoding utf-8

function WfMVimPath(filename)
  if has('nvim')
    return "~/.config/nvim/" . a:filename
  else
    return "~/.vim/" + a:filename
  endif
endfunction

if &shell =~# 'fish$'
  set shell=sh
endif

if filereadable(expand(WfMVimPath("bundles.vim")))
  source bundles.vim
endif

filetype plugin indent on

syntax on
"colorscheme X

set autoindent
set autoread
set noautowrite
set backspace=indent,eol,start
set backupcopy=yes
set backupdir=WfMVimPath("/backup//")
set colorcolumn=80,100
set completeopt=menu
set nocursorline
set directory=VimPath("/swap//")

