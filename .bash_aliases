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

alias fs="xrandr --output eDP-1 --mode 1366x768"
alias pacsize='expac -H M "%011m\t%-20n\t%10d" $(comm -23 <(pacman -Qqen | sort) <(pacman -Qqg base base-devel | sort )) | sort -n'
alias paclast="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 30"
alias yt="yaourt "

if [[ ${SHELL##*/} = 'zsh' ]]; then
  alias sizes='du -shc -- *(D) | sort -h'
  else alias sizes='du -shc -- * | sort -h';fi

hostname=`hostname`
[[ -e $HOME/.${hostname}_aliases ]] && source $HOME/.${hostname}_aliases

alias h='fc -nl -15'
alias vi="vim"
alias lsblk='lsblk -o NAME,MAJ:MIN,RM,TYPE,MOUNTPOINT,SIZE,FSTYPE,LABEL'
alias fmnt='findmnt -D -t notracefs,nonsfs,nosysfs,notmpfs,nodevtmpfs,nofuse.gvfsd-fuse | sort -hk5'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias inst='sudo pacman -S --noconfirm'
alias svi='sudo -E vim'
alias updb='updatedb -U $HOME -l 0 -o $HOME/.locate.db'
alias loc='locate -d $HOME/.locate.db'
