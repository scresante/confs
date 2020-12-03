" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" set all default TS to 4??
set shiftwidth=4 ts=4 sts=4
set expandtab smarttab
set autoindent smartindent
set splitright splitbelow
set ignorecase smartcase

set noshowmatch
set guifont=Monospace\ 8
set number relativenumber
set hidden " allow switching buffers without writing
set diffopt=filler,iwhite,context:10
set foldlevelstart=2
set fdo-=block " dont open folds with {} movement

set cul
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch
set scrolloff=4

" highlight trailing whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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

" persistent undo
if has("persistent_undo")
  set undofile
  if !isdirectory($HOME . "/.vim_undodir")
    call mkdir($HOME . "/.vim_undodir", "p", 0700)
  endif
  set undodir=~/.vim_undodir
endif

" Tell vim to remember certain things when we exit
set viminfo='100,<500,s50,:1000,%
set history=1000

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" always be able to run man
runtime ftplugin/man.vim
"let g:ft_man_open_mode = 'new'

source $HOME/.vim/plugs.vimrc
source $HOME/.vim/mouse.vimrc
source $HOME/.vim/maps.vimrc
source $HOME/.vim/files.vimrc

"Only use this theme in X
if has_key(environ(), 'DISPLAY')
    colorscheme monokai
    set bg=dark
    hi! Normal ctermbg=NONE guibg=NONE
endif
