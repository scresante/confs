call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'davidhalter/jedi-vim', { 'for': 'python' }
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'prabirshrestha/asyncomplete.vim'

Plug 'dense-analysis/ale'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" multilanguage syntax highlighting
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf'

"Plug 'pangloss/vim-javascript', { 'for': ['jsx','js','javascript'] }
"Plug 'mxw/vim-jsx', { 'for': ['jsx','js','javascript'] }
"Plug 'mbbill/undotree'
"Plug 'tpope/vim-fugitive'
"Plug 'vim-syntastic/syntastic'
"Plug 'vim-latex/vim-latex'
"Plug 'elzr/vim-json'
"Plug 'chr4/nginx.vim'

"colors
"Plug 'flazz/vim-colorschemes' "| Plug 'lifepillar/vim-solarized8' | Plug 'trusktr/seti.vim'
Plug 'crusoexia/vim-monokai'
"Plug 'tomasr/molokai'

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

call plug#end() " More information: https://github.com/junegunn/vim-plug

"""""""""""""""""" PLUGIN SPECIFIC SETTINGS """"""""""""""""""

" lightline, fonts, and colors
"set noshowmode
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], ['readonly','modified' ], ['buffers'] ],
    \   'right': [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype' ] ]
    \  },
    \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
    \ 'component_type': {'buffers': 'tabsel'},
    \ 'component': {
    \   'lineinfo': '%3l:%-2v%<',
    \   }
    \ }
set showtabline=1
set laststatus=2

"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_loc_list_height = 6
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_pylint_quiet_messages = { 'regex': ['invalid-name', 'missing.*docstring', 'unused-variable'] }

let g:jedi#popup_on_dot = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0
let g:jedi#rename_command = '<leader>R'

let g:ale_linters = {
            \ 'python': ['flake8', 'pylint'],
            \ 'haskell': ['cabal_ghc', 'ghc'],
            \ 'javascript': ['eslint'],
            \}
let g:ale_fixers = {
            \ 'python': ['yapf'],
            \}

