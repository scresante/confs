#!/bin/sh
xset r rate 200 50 &
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &
xcompmgr &
unclutter &
dunst &
nitrogen --restore &
xbindkeys
exec dwm
