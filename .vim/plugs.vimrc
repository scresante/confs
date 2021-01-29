call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Make sure to install coc extensions
" :CoCInstall coc-pyright
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dense-analysis/ale'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" multilanguage syntax highlighting
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf'

Plug 'tpope/vim-fugitive'

"colors
"Plug 'flazz/vim-colorschemes' "| Plug 'lifepillar/vim-solarized8' | Plug 'trusktr/seti.vim'
Plug 'crusoexia/vim-monokai'

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
    \   'left': [ [ 'mode', 'paste' ], ['cocstatus', 'readonly','modified' ], ['buffers'] ],
    \   'right': [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype' ] ]
    \  },
    \ 'component_function': { 'cocstatus': 'coc#status' },
    \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
    \ 'component_type': {'buffers': 'tabsel'},
    \ 'component': {
    \   'lineinfo': '%3l:%-2v%<',
    \   }
    \ }
set showtabline=1
set laststatus=2
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:ale_linters = {
            \ 'python': [ 'pylint', 'pyflakes', 'yapf', 'pycodestyle'],
            \ 'haskell': ['hlint', 'hdevtools', 'hfmt'],
            \ 'javascript': ['eslint'],
            \}
let g:ale_fixers = {
            \ 'python': ['yapf'],
            \}
