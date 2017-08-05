" key mappings

" Map a mode for preserving indent when pasting
nnoremap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>
set showmode
nnoremap <F12> :q<CR>

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" center display after searches
nnoremap n nzz
nnoremap N Nzz

nnoremap <F2> <ESC>:Vexplore<Cr>
nnoremap <F3> <ESC>:tabp<Cr>
nnoremap <F4> <ESC>:tabn<Cr>
" write file and drop to explorer
nnoremap <F9> <ESC>:w<Cr>:bro e<Cr>

" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"" file-type specific maps
autocmd FileType php map <F5> <ESC>:EnableFastPHPFolds<Cr>
autocmd FileType php map <F6> <ESC>:EnablePHPFolds<Cr>
autocmd FileType php map <F7> <ESC>:DisablePHPFolds<Cr>
let g:DisableAutoPHPFolding = 1

autocmd FileType python map <F5> <ESC>:w<CR>:!ipython -i %<CR>
autocmd FileType python map <F6> <ESC>:w<CR>:!ipython3 -i %<CR>
autocmd FileType python set foldmethod=manual
autocmd FileType python set ts=4

" center searches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" make space more useful
nnoremap <space> <C-f>zz
nnoremap <Nul> <c-b>zz

" reload vimrc
nnoremap <leader>r :source ~/.vimrc<CR>

" open help by default vert right
cnoremap help vert bo help

nnoremap <leader><space> :noh<CR>
