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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git vagrant python cp)
plugins=(python cp)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.bash_aliases

bindtc ()
{
  setopt localoptions
  local keyval=$(echotc "$1" 2>&- )
  [[ $keyval == "no" ]] && keyval=""
  bindkey "${keyval:-$2}" "$3"
}
#bindtc kP "^[[I" history-beginning-search-backward
#bindtc kN "^[[G" history-beginning-search-forward
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward
#bindkey  "${key[PageUp]}"    history-beginning-search-backward
#bindkey  "${key[PageDown]}"  history-beginning-search-forward

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
[ -d /usr/local/heroku/bin ] && export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -x "$NVM_DIR/nvm.sh" ] && \
  echo loading nvm... ;\
  \. "$NVM_DIR/nvm.sh"  ;\
  source /usr/share/nvm/init-nvm.sh

#source /etc/zsh_command_not_found
CNF=/usr/share/doc/pkgfile/command-not-found.zsh
[ -e $CNF ] && source $CNF

unsetopt auto_cd
setopt extendedglob
unsetopt nonomatch
setopt nomatch
setopt notify
