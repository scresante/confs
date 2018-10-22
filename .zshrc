# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gianu"
CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git vagrant python cp)
plugins=(vi-mode)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
source ~/.bash_aliases

# Colored man pages: http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
# # Less Colors for Man Pages
 export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
 export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
 export LESS_TERMCAP_me=$'\E[0m'           # end mode
 export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
 export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
 export LESS_TERMCAP_ue=$'\E[0m'           # end underline
 export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# user bin to path
[ -d $HOME/bin ] && export PATH="$HOME/bin:$PATH"

### Added by the Heroku Toolbelt
#[ -d /usr/local/heroku/bin ] && export PATH="/usr/local/heroku/bin:$PATH"

#export NVM_DIR="$HOME/.nvm"
#if [ -x "$NVM_DIR/nvm.sh" ]; then
  #echo loading nvm...
  #source "$NVM_DIR/nvm.sh"
  #source /usr/share/nvm/init-nvm.sh
#fi

CNF=/usr/share/doc/pkgfile/command-not-found.zsh
[ -e $CNF ] && source $CNF

unsetopt auto_cd
setopt extendedglob
unsetopt nonomatch
setopt nomatch
setopt notify

# fix up/down arrow bindings
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "[A" up-line-or-beginning-search
  bindkey "OA" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "[B" down-line-or-beginning-search
  bindkey "OB" down-line-or-beginning-search
fi

###__   _____ __  __ __  __  ___  ___  ___
###\ \ / /_ _|  \/  |  \/  |/ _ \|   \| __|
### \ V / | || |\/| | |\/| | (_) | |) | _|
###  \_/ |___|_|  |_|_|  |_|\___/|___/|___|
###
#  (enabled with omz plugin)
export KEYTIMEOUT=1
# fix home/end keys for vi mode!
bindkey "^[OH" beginning-of-line
bindkey -M vicmd "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey -M vicmd "^[OF" end-of-line
# fix home/end keys for vi mode in NATIVE TMUX!
bindkey "[1~" beginning-of-line
bindkey -M vicmd "[1~" beginning-of-line
bindkey "[4~" end-of-line
bindkey -M vicmd "[4~" end-of-line
# fix del/ins key
bindkey '[3~' delete-char
bindkey -M vicmd '[3~' delete-char
bindkey -M vicmd '[2~' vi-insert
# bind alt-d for delete-word
bindkey 'd' delete-word

### AWESOME AUTOSEARCH MENU
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^x^x' history-beginning-search-menu

#TMUX
if [[ ! $NONEX ]]; then
  TMUX_SESNAME=base
  if which tmux > /dev/null 2>&1; then
    if [[ -z "$TMUX" && -e $HOME/.tmux/tmx.sh ]]; then
      $HOME/.tmux/tmx.sh $TMUX_SESNAME
    fi
  fi
fi

export HISTSIZE=200000
export SAVEHIST=20000
setopt sharehistory histfcntllock histfindnodups histnostore histreduceblanks
unsetopt incappendhistory

env_default LESS '-RAiM'


##
## Completion
###

[[ -e /usr/bin/aws_zsh_completer.sh ]] && source /usr/bin/aws_zsh_completer.sh

autoload -U compinit
compinit
zmodload -i zsh/complist
#setopt hash_list_all            # hash everything before completion
#setopt completealiases          # complete aliases
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.zsh/cache              # cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # colorz !
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

globalias() {
   zle _expand_alias
   zle expand-word
   zle self-insert
}
zle -N globalias

# space expands all aliases, including global
bindkey -M emacs "^ " globalias
bindkey -M viins "^ " globalias

# control-space to make a normal space
bindkey -M emacs " " magic-space
bindkey -M viins " " magic-space

# normal space during searches
bindkey -M isearch " " magic-space

[ -x "$(which pyenv)" ]  && eval "$(pyenv init -)"

# override for oh-my-zsh needlessly aliasing ls against my will
alias ls='ls --color=auto'

export SURFRAW_graphical=no
export SURFRAW_text_browser=/usr/bin/lynx
