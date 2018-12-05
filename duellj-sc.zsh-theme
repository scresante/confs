unset {R,L,}PROMPT PS{1..4}
# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888
#PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}#
#%{\e[1;32m%}%n%{\e[1;34m%}
#@
#%{\e[0m%}%{\e[0;36m%}
#%m
#%{\e[0;34m%}%B]%b
#%{\e[0m%} - %b
#%{\e[0;34m%}%B[%b
#%{\e[1;37m%}
#%~
#%{\e[0;34m%}%B]%b
#%{\e[0m%} - %{\e[0;34m%}
#%B[%b%{\e[0;33m%}%!%{\e[0;34m%}%B]%b%{\e[0m%}
#
#%{\e[0;34m%}%B└─%B[%{\e[1;35m%}
#$
#%{\e[0;34m%}%B]%{\e[0m%}%b '
#RPROMPT='[%*]'
#PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '

PROMPT_PERCENT_OF_LINE=20
# make a function, so that it can be evaluated repeatedly
function myPromptWidth() { 
  echo $(( ${COLUMNS:-80} * PROMPT_PERCENT_OF_LINE / 100 )) 
}
# for some reason you can't put a function right in PROMPT, so make an
# intermediary variable
width_part='$(myPromptWidth)'
#
#function cut path to size {
# get length of user@host + []'s + everything but path <- minlen
# get charwidth of window
# set maxlen of path to charwidth-minlen

local dc=$FG[033]
local blue_op="${dc}%B┌─[%b"
local user="$FG[046]%B%n%b${dc}@"
local host="$FG[030]%M${dc}%B]%b - "

local pth="${dc}%B[%b%/${dc}%B]%b"
## this doesnt work
#local pth="%{${dc}%}%B[%b%${width_part}<…<%3~%{${dc}%}%B]%b"

local retstat="%(?..${fg[red]}%B$FX[blink]%?$FX[no-blink]%b)$reset_color"
local privd="%(!.#.$)"

## this works
PROMPT=$'${blue_op}${user}${host}${pth}
${dc}%B└─[${retstat}${privd}${dc}%B]%b%{${reset_color}%} '
RPROMPT="%{${reset_color}%}%B[%*]%b"
PS2=" ${dc}>${reset_color} "

