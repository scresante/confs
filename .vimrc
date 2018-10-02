" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
source $HOME/.vim/mouse_toggle.vimrc
source $HOME/.vim/maps.vimrc
source $HOME/.vim/files.vimrc

" set all default TS to 2
set shiftwidth=2
set ts=2
set sts=2
set expandtab
set autoindent
set smartindent

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch
set scrolloff=5

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

augroup vimrcEx
au!
" For all text files set 'textwidth' to 78 characters.
"  autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).

autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
"augroup END

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

"let g:airline_theme='base16_summerfruit'
let g:airline_powerline_fonts = 1
set diffopt=filler,iwhite,context:10

let g:pymode_python = 'python3'
let g:pymode_lint_checkers = ['pep8', 'mccabe', 'pyflakes'] " 'pylint', 
let g:pymode_options_max_line_length=120
let g:pymode_lint_ignore = "C0111"

let g:jedi#popup_on_dot = 0

set foldlevelstart=2
set tabpagemax=60

" dont open folds with {} movement
set fdo-=block
