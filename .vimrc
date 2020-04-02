" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
source $HOME/.vim/mouse_toggle.vimrc
"source $HOME/.vim/colors.vim
source $HOME/.vim/vim-plug.vimrc
source $HOME/.vim/maps.vimrc
source $HOME/.vim/files.vimrc

" set all default TS to 4??
set shiftwidth=4
set ts=4
set sts=4
set expandtab
set autoindent
set smartindent
set smarttab
set splitright
set splitbelow
set ignorecase smartcase

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch
set scrolloff=4

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  if &term =~ '^screen'
    set ttymouse=xterm2
  endif
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" restore cursor stuff
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).

autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" Tell vim to remember certain things when we exit
set viminfo='100,<1000,s50,:1000,%
set history=1000

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set showmatch
set guifont=Monospace\ 8

set number
let g:number=1
set relativenumber
let g:relnum=1

if has("persistent_undo")
  set undofile
  if !isdirectory($HOME . "/.vim_undodir")
    call mkdir($HOME . "/.vim_undodir", "p", 0700)
  endif
  set undodir=~/.vim_undodir
endif

set hidden " allow switching buffers without writing
set diffopt=filler,iwhite,context:10

let g:jedi#popup_on_dot = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0
let g:jedi#rename_command = '<leader>R'

set foldlevelstart=2
"set tabpagemax=40

set fdo-=block " dont open folds with {} movement

" lightline, fonts, and colors
set noshowmode
" alternative; wombat
let g:lightline = { 'colorscheme': 'darcula', }
colorscheme dracula
"let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
"let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
"let g:lightline.component_type   = {'buffers': 'tabsel'}
"set tabline=2

set termguicolors
" I forgot what this does:
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set laststatus=2
let g:indentLine_concealcursor=''

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_loc_list_height = 6
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


function! Searchall()
    call inputsave()
    let search = input('search for: ')
    call inputrestore()
    redraw
    echo search
    "call setqflist([])
    cex []
    execute 'bufdo!' 'vimgrepadd!' '/'.expand(search).'/' '%'
    "cope
    cw
endfunction
map <F9> <ESC>:call Searchall()<CR>
