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

alias sizes='du -shc -- * | sort -h'
alias fs="xrandr --output eDP-1 --mode 1366x768"
alias pacsize='expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <(pacman -Qqg base base-devel | sort )) | sort -n'
alias paclast="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 30"
alias yt="yaourt "

alias fmnt='findmnt -D -t notracefs,nonsfs,nosysfs,notmpfs,nodevtmpfs,nofuse.gvfsd-fuse | sort -hk5'
alias sizes='du -shc -- * | sort -h'

hostname=`hostname`
[[ -e $HOME/.$hostname_aliases ]] && source $HOME/.$hostname_aliases
