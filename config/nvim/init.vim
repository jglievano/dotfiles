set encoding=utf-8
scriptencoding utf-8

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

if &shell =~# 'fish$'
  set shell=sh
endif

exec s:SourceVimFile('bundles.vim')

filetype plugin indent on

syntax on
"colorscheme X

set autoindent
set autoread
set noautowrite
set backspace=indent,eol,start
set backupcopy=yes
set backupdir=~/.local/share/nvim/site/backup//
set colorcolumn=80,100
set completeopt=menu
set nocursorline
set directory=~/.local/share/nvim/site/swap//

