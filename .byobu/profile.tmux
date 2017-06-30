source $BYOBU_PREFIX/share/byobu/profiles/tmux
source $BYOBU_PREFIX/share/byobu/keybindings/f-keys.tmux.disable
#
# reload tmux config
unbind r
bind r \
    source-file ~/.byobu/profile.tmux \;\
    display 'Reloaded tmux config.'
#
# i dont give a fuck whats up

#source ~/.byobu/mouseon.tmux
#source ~/.byobu/mouseoff.tmux
