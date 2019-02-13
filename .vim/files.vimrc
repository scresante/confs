" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" extra filetype options

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

au! BufRead,BufNewFile *.pyw, *.py set filetype=python
augroup python
    autocmd!
    autocmd FileType python set shiftwidth=4
    autocmd FileType python set expandtab
    autocmd FileType python match ExtraWhiteSpace /^\t\+/
    let g:syntastic_python_pylint_quiet_messages = { 'regex': ['invalid-name', 'missing-docstring'] }
augroup END

"" file-type specific maps
let g:DisableAutoPHPFolding = 1
"autocmd FileType php map <F5> <ESC>:EnableFastPHPFolds<Cr>
"autocmd FileType php map <F6> <ESC>:EnablePHPFolds<Cr>
"autocmd FileType php map <F7> <ESC>:DisablePHPFolds<Cr>

"autocmd FileType python map <F5> <ESC>:w<CR>:!ipython -i %<CR>
"autocmd FileType python map <F6> <ESC>:w<CR>:!ipython3 -i %<CR>
"autocmd FileType python set foldmethod=manual
"autocmd FileType python set ts=4

autocmd FileType tex nnoremap <F5> :!latex % && zathura expand("%:r") . ".dvi"<CR>
