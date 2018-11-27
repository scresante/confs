#!/bin/bash
vert8 () {
tmux splitw -v
tmux splitw -v
tmux splitw -v
tmux selectp -t0
tmux splitw -v
tmux splitw -v

tmux selectp -D
tmux splitw -v

tmux selectp -t0
tmux splitw -v
tmux selectp -t0
#clear
tmux send-keys -R C-l
}

#horizontal column function
horiz4 () {
  tmux splitw -h
  tmux selectp -L
  tmux splitw -h
  tmux selectp -R
  tmux splitw -h
}
horiz2 () {
  tmux splitw -h
}
setthemes () {
  num=$1
  offset=$2
  #for (( i=0; i<$num; i++ )) do
  for i in `seq 0 $num`; do
    pnum=$i
    tn=$(( $pnum + 1 + ${offset:-0} ))
    tmux selectp -t $pnum
    tmux send-keys " tn=$tn" C-m
    tmux send-keys " source ~/.tmux/switchtheme.zsh" C-m
    sleep 0.4
    tmux send-keys -R C-l
  done
}

main () {
  vert8
  horiz2
  for x in `seq 1 7`; do
    tmux selectp -D
    horiz2
  done
  tmux selectp -t0
}
tmux set synchronize-panes off
main
setthemes ${1:-15} $2
tmux set synchronize-panes on
