set encoding=utf-8
scriptencoding utf-8

function! s:VimPath(filename)
  if has('nvim')
    return '~/.config/nvim/' . a:filename
  else
    return '~/.vim/' . a:filename
  endif
endfunction

if &shell =~# 'fish$'
  set shell=sh
endif

let bundles_path = expand(s:VimPath('bundles.vim'))
if filereadable(bundles_path)
  source bundles_path
endif

filetype plugin indent on

syntax on
"colorscheme X

set autoindent
set autoread
set noautowrite
set backspace=indent,eol,start
set backupcopy=yes
set backupdir=s:VimPath('/backup//')
set colorcolumn=80,100
set completeopt=menu
set nocursorline
set directory=s:VimPath('/swap//')

