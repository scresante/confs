set nocp
filetype plugin on
let loaded_netrw = 1

" Augroup VimStartup:
augroup VimStartup
  au!
  au VimEnter * if expand("%") == "" | e . | endif
augroup END

