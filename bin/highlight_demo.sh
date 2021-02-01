#!/bin/zsh
# a terminal theme finding script.  uses highlight to find a theme
setopt shwordsplit
themes="$(highlight --list-scripts=themes | grep : | cut -f1 -d' ' | xargs)"
themes=${themes#Installed }
themes=${themes%Found*}

# file length needs to match terminal height minus one

if [ -z "$1" ]; then
  echo "script $0 needs a source file"
  exit
fi

file_display=$1

# make sure the file is longer than the terminal?

mkdir highlight_demo
sed "$(tput lines),$ d" $file_display > highlight_demo/$file_display

cd highlight_demo

for x in $themes; do echo $x; highlight -s $x -O truecolor $file_display \
  | sed "1s:.*:==============$x===========:" > ${x:s:/:_:}.txt ; done

cat *txt | less -RAiM
