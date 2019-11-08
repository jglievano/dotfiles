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
set background=dark
colorscheme nord
let g:airline_theme='badwolf'

" Tab settings.
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Better defaults.
set autoindent
set backspace=indent,eol,start
set cursorline
set hidden
set laststatus=2
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set modelines=0
set relativenumber
set ruler
set scrolloff=3
set showbreak="↪ "
set showcmd
set showmode
set undofile
set visualbell
set wildmenu
set wildmode=list:longest

" Spelling.
set dictionary=/usr/share/dict/words
"set spellfile=~/.vim/custom-dictionary.utf-8.add,~/.vim-local-dictionary.utf-8.add
nnoremap zG 2zg

" Searching / Moving improvements.
nnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap / /\v
vnoremap <tab> %
set gdefault
set hlsearch
set ignorecase
set incsearch
set showmatch
set smartcase

set autoread
set noautowrite
set backupcopy=yes
set backupdir=~/.local/share/nvim/backup//
set colorcolumn=80,100
set completeopt=menu
set nocursorline
set directory=~/.local/share/nvim/swap//
set showtabline=2
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

augroup extension_formats
  autocmd!
  autocmd BufRead,BufNewFile *.borg  set filetype=gcl
  autocmd BufRead,BufNewFile *.fish  set filetype=fish
  autocmd BufRead,BufNewFile *.m     set filetype=objc
  autocmd BufRead,BufNewFile *.md    set filetype=markdown
  autocmd BufRead,BufNewFile *.swift set filetype=swift
  autocmd BufRead,BufNewFile BUCK    set filetype=python
  autocmd BufRead,BufNewFile BUILD   set filetype=python
augroup END

" ---
"  Plugin configuration

" vim-tmux-navigator.
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
