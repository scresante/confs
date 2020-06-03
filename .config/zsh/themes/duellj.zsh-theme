# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888
#
#PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;34m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B[%b%{\e[0;33m%}%!%{\e[0;34m%}%B]%b%{\e[0m%}
#purple=5 blue=12 green=2 
#unset {R,L,}PROMPT PS{1..4}
color1=${color1:-34}
color2=${color1:-5}
PROMPT="%F{$color1}┌─%B[%f%F{green}%n%f%b%F{$color2}@%m%B%f%F{$color1}]%f%b - %F{$color1}%B[%b%f%F{white}%~%f%F{$color1}%B]%b%f - %F{$color1}%B[%b%F{yellow}%!%F{$color1}%B]%b%f - [%y]
%F{$color1}└─%B[%f%F{5}$%F{$color1}]%f%b "
RPROMPT='[%*]'
PS2=$' %F{blue}%B>%f%b '
