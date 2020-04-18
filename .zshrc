#env_default LESS '-RAiM'
autoload -U colors && colors
autoload -U promptinit && promptinit
source ~/.zsh-custom/themes/duellj.zsh-theme

CASE_SENSITIVE="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

# Colored man pages: http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
# # Less Colors for Man Pages
 export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
 export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
 export LESS_TERMCAP_me=$'\E[0m'           # end mode
 export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
 export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
 export LESS_TERMCAP_ue=$'\E[0m'           # end underline
 export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

unsetopt auto_cd
setopt extendedglob
unsetopt nonomatch
setopt nomatch
setopt notify
setopt interactivecomments

###__   _____ __  __ __  __  ___  ___  ___
###\ \ / /_ _|  \/  |  \/  |/ _ \|   \| __|
### \ V / | || |\/| | |\/| | (_) | |) | _|
###  \_/ |___|_|  |_|_|  |_|\___/|___/|___|
###
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

#vi mode candidates for mode indication
#https://raw.githubusercontent.com/b4b4r07/zsh-vimode-visual/master/zsh-vimode-visual.zsh
#https://raw.githubusercontent.com/softmoth/zsh-vim-mode/master/zsh-vim-mode.plugin.zsh
#https://raw.githubusercontent.com/Nyquase/vi-mode/master/vi-mode.zsh


###
### HISTORY
###
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
### AWESOME AUTOSEARCH MENU
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^x^x' history-beginning-search-menu

# Save  each command's beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file.
setopt extendedhistory
# When searching for history entries in the line editor, do not display duplicates of a line previously found, even if the duplicates are not contiguous.
setopt histfindnodups
# remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space.
setopt histignorespace

# This option is a variant of INC_APPEND_HISTORY in which, where possible, the history entry is written out to the file after the command is finished, so that the time taken by the command is recorded  correctly  in  the history file in EXTENDED_HISTORY format.  This means that the history entry will not be available immediately from other instances of the shell that are using the same history file.  This option is only useful if INC_APPEND_HISTORY and SHARE_HISTORY are turned off.  The three options should be CONSIDERED MUTUALLY EXCLUSIVE.
# If  you  find that you want more control over when commands get imported, you may wish to turn SHARE_HISTORY off, INC_APPEND_HISTORY or INC_APPEND_HISTORY_TIME (see above) on, and then manually import commands whenever you need them using `fc -RI'.
setopt incappendhistorytime

setopt histreduceblanks histexpiredupsfirst
setopt histverify #Dont immediately execute history expansions
setopt histfcntllock

export HISTSIZE=30000
export SAVEHIST=30000
export HIST_STAMPS="%d/%m/%y %T"
export HISTFILE=~/.zsh_history

##
## Completion
##
autoload -U compinit && compinit
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
# completion / misc environment
[[ -e /usr/bin/aws_zsh_completer.sh ]] && source /usr/bin/aws_zsh_completer.sh
if [[ -e /etc/profile.d/google-cloud-sdk.sh && -e /etc/bash_completion.d/google-cloud-sdk ]]; then
  autoload -U bashcompinit && bashcompinit # needed for gcloud
  source /etc/bash_completion.d/google-cloud-sdk
fi
#[ -x "$(which pyenv)" ]  && eval "$(pyenv init -)"
CNF=/usr/share/doc/pkgfile/command-not-found.zsh
[ -e $CNF ] && source $CNF

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

source $HOME/.zsh-custom/.zsh-colors
export EDITOR='vim'
source ~/.bash_aliases
[ -d $HOME/bin ] && export PATH="$HOME/bin:$PATH"

source $HOME/.nocaps
# load per-host zsh customizations
[ -e $HOME/.zsh-custom/`hostname` ] && source $HOME/.zsh-custom/`hostname`

#export ZSH=$HOME/.oh-my-zsh
#source $ZSH/oh-my-zsh.sh
