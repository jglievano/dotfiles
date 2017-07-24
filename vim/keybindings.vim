let mapleader = ","
let maplocalleader = "\\"

nnoremap <leader>n :setlocal number!<CR>
nnoremap <leader>s vip:!sort -f<CR>
vnoremap <leader>s :!sort -f<CR>
nnoremap <CR> O<ESC>

" Buffer navigation ------------------------------------------------------------

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>s <C-w>s
nnoremap <leader>v <C-w>v
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <leader>p :FZF<CR>
nnoremap <C-g> viwUe
inoremap <C-g> <ESC>viwUea
