" Change the color scheme from a list of color scheme names.
" Version 2010-09-12 from http://vim.wikia.com/wiki/VimTip341
" Set the list of color schemes used by the above (default is 'all'):
"   :SetColors all              (all $VIMRUNTIME/colors/*.vim)
"   :SetColors blue slate ron   (these schemes)
"   :SetColors                  (display current scheme names)

" could search for any directory named colors in ~/.vim ...
let paths = split(globpath(&runtimepath, 'plugged/vim-colorschemes/colors/*.vim'), "\n")
let g:mycolors = uniq(sort(map(paths, 'fnamemodify(v:val, ":t:r")')))

function! SwitchColor(swinc)
	" if have switched background: dark/light
    if exists('g:colorscheme')
      let current = index(g:mycolors, g:colorscheme)
    else
      let current = -1
      echo 'setting current to -1'
    endif
    let s:swindex = a:swinc + current
    "echo "s:swindex(".s:swindex") = a:swinc(".a:swinc.") + current(".current")"
    let i = s:swindex % len(g:mycolors)
    let g:colorscheme = g:mycolors[i]
    execute "colorscheme ".g:colorscheme
	redraw
	execute "colorscheme"
    "echo "i is: ".i
    "hi! Normal ctermbg=NONE guibg=NONE
endfunction

let g:is_transparent = 0
function! Toggle_transparent()
    if g:is_transparent == 0
        hi! Normal ctermbg=NONE guibg=NONE
        let g:is_transparent = 1
        echo 'g:is_transparent is ' . g:is_transparent
        sleep 1
    else
        set bg=dark
        let g:is_transparent = 0
        echo 'g:is_transparent is ' . g:is_transparent
        sleep 1
    endif
endfunction


