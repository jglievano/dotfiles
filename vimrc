set nocompatible " Use vim defaults instead of 100% vi compatibility

syntax on        " Enable syntax highlighting

" Installl Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Ensure ftdetect et al work
filetype plugin indent on

set autoindent
set autoread
set backspace=indent,eol,start
set backupcopy=yes
set backupdir=~/.vim/backup//
set clipboard=unnamed
set colorcolumn=80
set completeopt=menu
set cursorline
set directory=~/.vim/swap//
set encoding=utf-8
set expandtab
set exrc
set guioptions-=L
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,eol:¬,trail:▫
set modelines=0
set number
set ruler
set scrolloff=3
set secure
set shiftwidth=2
set showcmd
set showmatch
set noshowmode
set secure
set showtabline=2
set smartcase
set softtabstop=2
set tabstop=2
set term=xterm-256color
set termencoding=utf-8
set ttyfast
set t_Co=256
set undofile
set undodir=~/.vim/undo//
set visualbell
set wrap
set wildchar=<Tab>
set wildignore=log/**,node_module/**,target/**,tmp/**,*.rdc
set wildmenu
set wildmode=list:longest,full

highlight ColorColumn ctermbg=darkgray

" Keyboard shortcuts
let mapleader = ','
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>c <Plug>Kwbd
nnoremap <C-g> viwUe
inoremap <C-g> <esc>viwUea
nnoremap - ddp
nnoremap _ ddkP
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

cnoremap w!! %!sudo tee > /dev/null %

let g:gitgutter_enabled = 0

augroup extensionsgroup
  autocmd!
  " ejs.
  autocmd BufRead,BufNewFile *.ejs set filetype=html
  " fdoc is yaml.
  autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
  " md is markdown.
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.md set spell
  " gyp is python.
  autocmd BufRead,BufNewFile *.gyp set filetype=python
  autocmd BufRead,BufNewFile *.gypi set filetype=python
  autocmd BufRead,BufNewFile BUILD set filetype=python
  " Needed to override matlab default.
  autocmd BufRead,BufNewFile *.m set filetype=objc
  " automatically rebalance windows on vim resize
  autocmd VimResized * :wincmd =
augroup END

" Fix cursor in TMUX
if exists('$TMUX')
  let &t_SI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI="\<Esc>]50;CursorShape=1\x7"
  let &t_EI="\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection
vnoremap p "_dP

" Ctrl-P
let g:ctrlp_match_window='bottom,order:btt,min:1,max:10,results:10'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
