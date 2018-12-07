" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" extra filetype options

au BufNewFile,BufRead *.less set filetype=less
au BufRead,BufNewFile *.strace set filetype=strace
augroup module
autocmd BufRead,BufNewFile *.test set filetype=php
autocmd BufRead,BufNewFile *.module set filetype=php
autocmd BufRead,BufNewFile *.install set filetype=php
augroup END

autocmd FileType perl set keywordprg=perldoc\ -f

au! BufRead,BufNewFile *.json set filetype=json 
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

"angular
autocmd BufRead,BufNewFile *.ts set filetype=javascript

autocmd BufRead,BufNewFile *.zsh-theme set filetype=zsh
