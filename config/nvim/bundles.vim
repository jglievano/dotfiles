call plug#begin()

Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'vim-airline/vim-airline'

if has('mac')
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
endif

if executable('go')
	Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
endif

if executable('npm')
	Plug 'prettier/vim-prettier'
endif

" _
" Contexts
Plug 'chr4/nginx.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'bazelbuild/vim-bazel',      { 'for': ['bzl'] }
Plug 'google/vim-maktaba',        { 'for': ['bzl'] }
Plug 'justmao945/vim-clang',      { 'for': ['c', 'cpp'] }
Plug 'hail2u/vim-css3-syntax',    { 'for': 'css' }
Plug 'gko/vim-coloresque',        { 'for': ['css', 'scss', 'sass', 'stylus'] }
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elm' }
Plug 'elmcast/elm-vim',           { 'for': 'elm' }
Plug 'rix0rrr/vim-gcl',           { 'for': 'gcl' }
Plug 'jparise/vim-graphql',       { 'for': 'graphql' }
Plug 'tpope/vim-haml',            { 'for': 'haml' }
Plug 'hokaccha/vim-html5validator', { 'for': 'html' }
Plug 'othree/html5.vim',          { 'for': 'html' }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'pangloss/vim-javascript',   { 'for': 'javascript' }
Plug 'heavenshell/vim-jsdoc',     { 'for': ['javascript', 'typescript'] }
Plug 'maxmellon/vim-jsx-pretty',  { 'for': ['javascript', 'typescript'] }
Plug 'elzr/vim-json',             { 'for': 'json' }
Plug 'udalov/kotlin-vim',         { 'for': 'kotlin' }
Plug 'groenewege/vim-less',       { 'for': 'less' }
Plug 'ferrine/md-img-paste.vim',  { 'for': 'markdown' }
Plug 'jkramer/vim-checkbox',      { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown',   { 'for': 'markdown' }
Plug 'stanangeloff/php.vim',      { 'for': 'php' }
Plug 'digitaltoad/vim-pug',       { 'for': 'pug' }
Plug 'davidhalter/jedi-vim',      { 'for': 'python' }
Plug 'klen/python-mode',          { 'for': 'python' }
Plug 'tpope/vim-rails',           { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby',         { 'for': 'ruby' }
Plug 'racer-rust/vim-racer',      { 'for': 'rust' }
Plug 'rust-lang/rust.vim',        { 'for': 'rust' }
Plug 'derekwyatt/vim-scala',      { 'for': 'scala' }
Plug 'keith/swift.vim',           { 'for': 'swift' }
Plug 'cespare/vim-toml',          { 'for': 'toml' }
Plug 'leafgarland/typescript-vim',{ 'for': 'typescript' }
Plug 'quramy/tsuquyomi',          { 'for': 'typescript' }
Plug 'rhysd/vim-wasm',            { 'for': ['wast', 'wat'] }

" _
" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'danielwe/base16-vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'morhetz/gruvbox'
Plug 'nlknguyen/papercolor-theme'
Plug 'reedes/vim-colors-pencil'
Plug 'sjl/badwolf'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
