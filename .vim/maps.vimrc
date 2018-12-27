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

nnoremap <F2> <ESC>:NERDTreeToggle<Cr>
nnoremap <F3> <ESC>:tabp<Cr>
nnoremap <F4> <ESC>:tabn<Cr>
nmap <leader><F6> :set bg=dark<CR>
nmap <F6> :hi! Normal ctermbg=NONE guibg=NONE<CR>
nnoremap <leader><F7> :call SwitchColor(1)<CR>:echo g:colorscheme<CR>
nnoremap <F7> :call SwitchColor(1)<CR>:echo g:colorscheme<CR>

" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"" file-type specific maps
let g:DisableAutoPHPFolding = 1
"autocmd FileType php map <F5> <ESC>:EnableFastPHPFolds<Cr>
"autocmd FileType php map <F6> <ESC>:EnablePHPFolds<Cr>
"autocmd FileType php map <F7> <ESC>:DisablePHPFolds<Cr>

"autocmd FileType python map <F5> <ESC>:w<CR>:!ipython -i %<CR>
"autocmd FileType python map <F6> <ESC>:w<CR>:!ipython3 -i %<CR>
"autocmd FileType python set foldmethod=manual
"autocmd FileType python set ts=4

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
noremap <leader>r :source ~/.vimrc<CR>

" open help by default vert right
"cnoremap help vert bo help

noremap <leader><space> :noh<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>h :wincmd h<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>

" easier buffer navigation
nnoremap <leader>\ :ls<CR>
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>
