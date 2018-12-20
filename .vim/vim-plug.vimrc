call plug#begin('~/.vim/plugged')
"
" Make sure you use single quotes
"
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'pangloss/vim-javascript', { 'for': ['jsx','js','javascript'] }
Plug 'mxw/vim-jsx', { 'for': ['jsx','js','javascript'] }
Plug 'vim-syntastic/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'trusktr/seti.vim'
"Plug 'itchyny/lightline.vim'
"Plug 'mengelbrecht/lightline-bufferline'

"
" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" On-demand loading
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
"
" Plugin options
"jPlug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
"
" Initialize plugin system
call plug#end()

" Then reload .vimrc and :PlugInstall to install plugins.
"
" Plug options:
"
"| Option                  | Description                                      |
"| ----------------------- | ------------------------------------------------ |
"| `branch`/`tag`/`commit` | Branch/tag/commit of the repository to use       |
"| `rtp`                   | Subdirectory that contains Vim plugin            |
"| `dir`                   | Custom directory for the plugin                  |
"| `as`                    | Use different name for the plugin                |
"| `do`                    | Post-update hook (string or funcref)             |
"| `on`                    | On-demand loading: Commands or `<Plug>`-mappings |
"| `for`                   | On-demand loading: File types                    |
"| `frozen`                | Do not update unless explicitly specified        |
"
" More information: https://github.com/junegunn/vim-plug
"
