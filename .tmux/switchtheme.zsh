#!/bin/zsh
#note this has to be sourced to work

unset {R,L,}PROMPT PS{1..4}
themelist=( $(print -l ~/.oh-my-zsh/themes/* ) )
theme=$themelist[$tn]
source $theme
tmux send-keys -R C-l
#echo $theme

#for (( i=2; i<$#themelist; i++ )) do echo $i $themelist[$[i]]; done | grep gianu
