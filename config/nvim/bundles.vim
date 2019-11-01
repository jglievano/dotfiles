call plug#begin()

Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'gko/vim-g'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/vim-github-dashboard', {
      \ 'on': [
      \ 'GHdashboard',
      \ 'GHActivity'
      \ ] }
Plug 'kien/rainbow_parentheses.vim'
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'mattesgroeger/vim-bookmarks'
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim', { 'on': ['Gist'] }
Plug 'mattn/webapi-vim'
Plug 'mhinz/vim-startify'
Plug 'pbrisbin/vim-mkdir'
Plug 'raimondi/delimitmate'
Plug 'ruanyl/vim-gh-line'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sedm0784/vim-you-autocorrect', {
      \ 'on': [
      \ 'EnableAutocorrect',
      \ 'DisableAutocorrect'
      \ ] }
Plug 'shougo/vimproc.vim', { 'do': 'make' }
Plug 'sirver/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/TaskList.vim', { 'on': 'TaskList' }
Plug 'wsdjeg/vim-fetch'
Plug 'w0rp/ale', {
      \ 'for': [
      \ 'javascript',
      \ 'typescript',
      \ 'css',
      \ 'scss',
      \ 'go',
      \ 'rust',
      \ 'scala'
      \ ] }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags', {
      \ 'on': [
      \ 'UpdateTags',
      \ 'HighlightTags'
      \ ] }

if has('mac')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
endif

if executable('go')
  Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
  Plug 'mdempsky/gocode', { 'for': 'go' }
endif

if executable('npm')
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install' }
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'prettier/vim-prettier', {
        \ 'do': 'npm install',
        \ 'for': [
        \ 'javascript',
        \ 'html',
        \ 'typescript',
        \ 'css',
        \ 'less',
        \ 'scss',
        \ 'json',
        \ 'graphql',
        \ 'markdown',
        \ 'vue',
        \ 'yaml'
        \ ] }
  let g:UltiSnipsExpandTrigger="<nop>"
endif

" _
" Contexts
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'chr4/nginx.vim'
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elm' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'ferrine/md-img-paste.vim', { 'for': 'markdown' }
Plug 'gko/vim-coloresque', { 'for': ['css', 'scss', 'sass', 'stylus'] }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'typescript'] }
Plug 'hokaccha/vim-html5validator', { 'for': 'html' }
Plug 'jkramer/vim-checkbox', { 'for': 'markdown' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'justmao945/vim-clang', { 'for': ['c', 'cpp'] }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'typescript'] }
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'quramy/tsuquyomi',        { 'for': 'typescript' }
Plug 'tpope/vim-haml',          { 'for': 'haml' }
Plug 'udalov/kotlin-vim',       { 'for': 'kotlin' }
Plug 'stanangeloff/php.vim',    { 'for': 'php' }
Plug 'tpope/vim-rails',         { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby',       { 'for': 'ruby' }
Plug 'racer-rust/vim-racer',    { 'for': 'rust' }
Plug 'rust-lang/rust.vim',      { 'for': 'rust' }
Plug 'keith/swift.vim',         { 'for': 'swift' }
Plug 'cespare/vim-toml',        { 'for': 'toml' }
Plug 'rhysd/vim-wasm',          { 'for': ['wast', 'wat'] }

" _
" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'alxhnr/clear_colors'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'cormacrelf/vim-colors-github'
Plug 'danielwe/base16-vim'
Plug 'dterei/VimCobaltColourScheme'
Plug 'fxn/vim-monochrome'
Plug 'jpo/vim-railscasts-theme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'nightsense/cosmic_latte'
Plug 'nightsense/snow'
Plug 'nightsense/stellarized'
Plug 'reedes/vim-colors-pencil'
Plug 'rhysd/vim-color-spring-night'
Plug 'sjl/badwolf'
Plug 'tpope/vim-vividchalk'
Plug 'trapd00r/neverland-vim-theme'
Plug 'trevordmiller/nova-vim'
Plug 'twerth/ir_black'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Wombat'
Plug 'w0ng/vim-hybrid'
Plug 'zaiste/Atom'

call plug#end()
