############################    BASIC SETTINGS    ############################
#set xkbdmap -option:caps:escape
#[ -z "$SSH_CLIENT" ] && export DISPLAY=:0
autoload -U colors && colors
autoload -U promptinit && promptinit
source ~/.config/zsh/themes/duellj.zsh-theme
### SET VIM AS MANPAGER ###
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma nornu nonu' -\""
unsetopt auto_cd
setopt extendedglob
unsetopt nonomatch
setopt nomatch
setopt notify
setopt interactivecomments
DIRSTACKSIZE=20
setopt autopushd pushdminus pushdtohome

##############################      VI MODE      ##############################
ZSHVER=$(zsh --version | cut -f2 -d' ' | cut -f-2 -d'.')
if [[ "$ZSHVER" -lt "5.3" ]]; then
    bindkey -v
else
    source $HOME/.config/zsh/zsh-vim-mode.plugin.zsh
    MODE_CURSOR_VIINS="#00ff00 blinking bar"
    MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
    MODE_CURSOR_VICMD="green block"
    MODE_CURSOR_SEARCH="#ff00ff steady underline"
    MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
    MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"
fi

##############################      HISTORY      ##############################
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

setopt extendedhistory
setopt histfindnodups
setopt histignorespace
setopt incappendhistorytime # works in zsh ⪆ 5.0.6
setopt histreduceblanks histexpiredupsfirst
setopt histverify #Dont immediately execute history expansions
setopt histfcntllock

HISTORY_IGNORE='(l[a,l,s,h,]*|cd|sizes|echo)'
export HISTSIZE=30000
export SAVEHIST=30000
export HIST_STAMPS="%d/%m/%y %T"
export HISTFILE=~/.zsh_history

##############################    COMPLETION    ##############################
autoload -U compinit && compinit
zmodload -i zsh/complist
#setopt hash_list_all            # hash everything before completion
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

source $HOME/.config/zsh/.zsh-colors

# load per-host zsh customizations
[ -e $HOME/.config/zsh/`hostname` ] && source $HOME/.config/zsh/`hostname`

##############################      ALIASES      ##############################
source $HOME/.config/aliases
