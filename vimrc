set nocompatible " Use vim defaults instead of 100% vi compatibility

syntax on        " Enable syntax highlighting

" Installl Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Ensure ftdetect et al work
filetype plugin indent on

set autoindent     " Autoindents to indentation from previous line
set autoread       " Reload files when changed on disk
set backspace=indent,eol,start " More powerful backspacing
set backupcopy=yes " Make a copy of the file and overwrite the original
set backupdir=~/.vim/backup// " Store backup files in specified directory
set clipboard=unnamed " Yank and paste with the system clipboard
set completeopt=menu " Use a pop up menu to show completion options
set cursorline     " Highlights the current line
set directory=~/.vim/swap// " Store swapfiles in specified directory
set encoding=utf-8
set expandtab      " Insert spaces whenever <Tab> is pressed
set exrc
set guioptions-=L  " Disable scrollbar in MacVim
set hlsearch       " Highlight previous search
set ignorecase     " case-insensitive search
set incsearch      " Search as word is typed
set laststatus=2   " Always show status bar
set list           " Show trailing whitespace
set listchars=tab:▸\ ,eol:¬,trail:▫ " Display <Tab>s, <EOL>s, trails  nicer
set modelines=0    " CVE-2007-2438
set number         " Show line numbers
set ruler          " Show where you are
set scrolloff=3    " Scroll up or down when there are 3 extra lines
set shiftwidth=2   " Autoindent (<<, >>) with 2 spaces
set showcmd        " Show command in the last line of the screen
set showmatch      " Briefly show braket match
set noshowmode     " Hide the default mode text
set secure
set showtabline=2  " Always show tabline
set smartcase      " case-sensitive search if any caps
set softtabstop=2  " Number of spaces inserted when editing
set tabstop=2      " <Tab> counts for 2 spaces
set term=xterm-256color
set termencoding=utf-8
set ttyfast        " Improves smoothness of redrawing
set t_Co=256       " Make use of 256 terminal colors
set undofile       " ...
set undodir=~/.vim/undo// " Store undo files in specified directory
set visualbell     " Use visual bell instead of beeping
set wrap           " Display text by wrapping it
set wildchar=<Tab> " Set completion character to <Tab>
set wildignore=log/**,node_module/**,target/**,tmp/**,*.rdc
set wildmenu       " Enables usage of autocompletion using 'wildchar'
set wildmode=list:longest,full " List completions, previous completions

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

" Plugin settings
let g:NERDSpaceDelims=1
let NERDTreeQuitOnOpen=1
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
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection
vnoremap p "_dP

" Ctrl-P
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'

" Syntastic
set statusline+=%#warningmsg#  " Add Error ruler.
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsEditSplit="vertical"

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
