set encoding=utf-8
scriptencoding utf-8

" ___
" Helper function definitions.

function! s:MakeDir(dir)
  if !isdirectory(expand(a:dir))
    call mkdir(expand(a:dir), 'p')
  endif
endfunction

function! s:SourceVimFile(vimfile)
  let path_name = expand(s:VimPath(a:vimfile))
  if filereadable(path_name)
    execute 'source ' . fnameescape(path_name)
  endif
endfunction

function! s:VimPath(filename)
  if has('nvim')
    return '~/.config/nvim/' . a:filename
  else
    return '~/.vim/' . a:filename
  endif
endfunction

" ___
" When in Fish

if &shell =~# 'fish$'
  set shell=sh
endif

" ___

let mapleader = ','

exec s:SourceVimFile('bundles.vim')

" ___
" Custom settings.

filetype plugin indent on

syntax on
set background=light
"colorscheme X

set autoindent
set autoread
set noautowrite
set backspace=indent,eol,start
set backupcopy=yes
set backupdir=~/.local/share/nvim/backup//
set colorcolumn=80,100
set completeopt=menu
set nocursorline
set directory=~/.local/share/nvim/swap//
set expandtab
set shiftwidth=2
set showtabline=2
set softtabstop=2
set tabstop=2
set undodir=~/.local/share/nvim/undo//

exec s:MakeDir(&backupdir)
exec s:MakeDir(&directory)
exec s:MakeDir(&undodir)

"---
" Trailing whitespace
augroup trailing
  au!
  au InsertEnter * :set listchars-=trail:⌴
  au InsertLeave * :set listchars+=trail:⌴
augroup END
