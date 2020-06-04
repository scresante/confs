" key mappings

" Map a mode for preserving indent when pasting
nnoremap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>
set showmode

nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
cnoremap q <Nop>
cnoremap qa <Nop>


nnoremap <F2> <ESC>:NERDTreeToggle<Cr>
noremap <F3> <ESC>:tabp<Cr>
noremap <F4> <ESC>:tabn<Cr>
nmap <leader><F6> :set bg=dark<CR>
"nmap <F6> :hi! Normal ctermbg=NONE guibg=NONE<CR>
nnoremap <leader><F7> :call SwitchColor(1)<CR>:echo g:colorscheme<CR>
nnoremap <F7> :call SwitchColor(1)<CR>:echo g:colorscheme<CR>

let t:is_transparent = 0
function! Toggle_transparent_background()
  if t:is_transparent == 0
    hi Normal guibg=#111111 ctermbg=black
    let t:is_transparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 0
  endif
endfunction
nnoremap <F6> :call Toggle_transparent_background()<CR>
" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" center searches
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" make space more useful
nnoremap <space> <C-d>zz
nnoremap <s-space> <c-u>zz

" reload vimrc
noremap <leader>r :source ~/.vimrc<CR>

" vh is help vert right
cnoremap vh vert bo help

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
nnoremap <leader>[ <ESC>:bp<CR>
nnoremap <leader>] <ESC>:bn<CR>
nnoremap <leader>b :bnext<CR>
nnoremap <leader>B :bprev<CR>
nnoremap <leader>D :bd<CR>


" fix ctrl + arrows
map [1;5D <C-Left>
map [1;5C <C-right>
map [1;5A <C-up>
map [1;5B <C-down>


" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
"map <C-p> "+P

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
