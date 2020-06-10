call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'pangloss/vim-javascript', { 'for': ['jsx','js','javascript'] }
Plug 'mxw/vim-jsx', { 'for': ['jsx','js','javascript'] }
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-latex/vim-latex'
Plug 'AndrewRadev/switch.vim'
Plug 'elzr/vim-json'
Plug 'chr4/nginx.vim'

"colors
"Plug 'flazz/vim-colorschemes' "| Plug 'lifepillar/vim-solarized8' | Plug 'trusktr/seti.vim'
Plug 'crusoexia/vim-monokai'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'

Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

call plug#end()
" More information: https://github.com/junegunn/vim-plug
