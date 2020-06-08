#!/bin/sh
xset r rate 200 50
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
exec dwm
