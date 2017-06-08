alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Git aliases
alias gba="git branch -a"
alias go="git checkout $1"
alias gl="git log"
alias gst="git status"
alias gsh="git show"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit" 

# remote tripark aliases
alias janus="ssh -t shawn@janus tmux attach"
alias demeter="ssh -t shawn@demeter tmux attach"
alias tcfm="ssh -t shawn@makedirtnotwaste.org tmux attach"

alias sizes='du -shc -- * | sort -h'
alias fs="xrandr --output eDP-1 --mode 1366x768"
alias brightness="xrandr --output eDP-1 --brightness $x"
