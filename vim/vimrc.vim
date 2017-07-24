set nocompatible " Use vim defaults instead of 100% vi compatibility

" Install bundles
if filereadable(expand("~/.vim/bundles.vim"))
  source ~/.vim/bundles.vim
endif

" Ensure ftdetect et al work
filetype plugin indent on

syntax on
set background=dark
colorscheme gruvbox

" Better defaults --------------------------------------------------------------

set autoindent
set autoread
set noautowrite
set backspace=indent,eol,start
set backupcopy=yes
set backupdir=~/.vim/backup//
set colorcolumn=80,100
set completeopt=menu
set cursorline
set directory=~/.vim/swap//
set encoding=utf-8
set expandtab
set exrc
set fillchars=vert:\ ,stl:\ ,stlnc:\
set guifont=Operator\ Mono\ Light:h13
set guioptions-=L
set nohidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nolazyredraw
set nolinebreak
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:▫
set matchtime=3
set modelines=0
set mouse-=a
set number
set ruler
set scrolloff=3
set secure
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set statusline=%=%P\ %f\ %m
set noshowmode
set secure
set showbreak=↪
set showtabline=2
set smartcase
set splitbelow
set splitright
set softtabstop=2
set tabstop=2
set termencoding=utf-8
set textwidth=0
set notimeout
set title
set ttimeout
set ttimeoutlen=10
set ttyfast
set t_Co=256
set undofile
set undoreload=10000
set undodir=~/.vim/undo//
set visualbell
set nowrap
set wrapmargin=0
set wildchar=<Tab>
set wildignore+=log/**,node_module/**,target/**,tmp/**,*.rdc
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.u,*.obj,*.exe,*.dll
set wildignore+=.DS_Store
set wildignore+=*.pyc
set wildignore+=*.orig
set wildmenu
set wildmode=list:longest,full

if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" Cursor Line ------------------------------------------------------------------

augroup cline
  au!
  au WinLeave,InsertEnter * set nocursorline
  au WinEnter,InsertLeave * set cursorline
augroup END

" Trailing Whitespace ----------------------------------------------------------

augroup trailing
  au!
  au InsertEnter * :set listchars-=trail:⌴
  au InsertLeave * :set listchars+=trail:⌴
augroup END

" Appearance -------------------------------------------------------------------

highlight ColorColumn ctermbg=darkgray
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

iabbrev zxa ಠ_ಠ
iabbrev zxc ✓
iabbrev zxx ✘

" Extensions -------------------------------------------------------------------

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

" Vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Ctrl-P
let g:ctrlp_match_window='bottom,order:btt,min:1,max:10,results:10'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_loc_list_height=3
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_ruby_checkers = ['rubocop']

" OmniSharp
let g:OmniSharp_selector_ui="ctrlp"
let g:OmniSharp_server_type='roslyn'

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -l --ignore "node_modules/" -g ""'

" Local Vim.
let g:localvimrc_ask=0

if filereadable(expand("~/.vim/keybindings.vim"))
  source ~/.vim/keybindings.vim
endif

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
