#!/bin/zsh
setopt extendedglob
YEAR=2013

prep() {
  start=$(python -c "from datetime import datetime; print((datetime.now() - datetime($YEAR, 1, 1)).days)")
  end=$(python -c "from datetime import datetime; print((datetime.now() - datetime($YEAR+1, 1, 1)).days)")
  #
  #copy files
  for x in ../**/*(.md+${end}md-${start}Lm-50); do cp --reflink=always "$x" ./; done
  echo $(ls | wc -l ) files copied
  #resize big ones

  for x in (#i)*(jpg|jpeg|gif|png)(Lm+2); do convert "$x" -resize 2048x "$x"; echo -n '.'; done 
  mkdir thumbs
  mogrify -format gif -path thumbs -thumbnail 100x100 (#i)*(png|jpg|jpeg|gif|bmp)
}

html() {
if [ ! -e "style.css" ]; then
    echo ''' img {
  border: 1px solid #ddd; /* Gray border */
  border-radius: 4px;  /* Rounded border */
  padding: 5px; /* Some padding */
  width: 150px; /* Set a small width */
}

/* Add a hover effect (blue shadow) */
img:hover {
  box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}

.c { position: relative; }
.x {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 11px;
  background-color: coral;
  border: 1px dotted black;
}''' > style.css
fi

echo '''
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="generator" content="zsh" />
    <title>highly classified CIA photo dump ('''$YEAR''', colorized)</title>
<link rel="stylesheet" href="style.css">
</head>
<body bgcolor="#333">''' > index.html
for x in *(.); do
    if [ ! -e thumbs/${x%.*}.gif ]; then
        img='/generic.gif'
    else
        img="thumbs/${x%.*}.gif"
    fi
    echo """<span class=\"c\">
    <a href=\"$x\">
    <img src=\"$img\">
    <span class=\"x\">$x</div>
    </a>
    </span>""" >> index.html
done

echo "</body>" >> index.html
}

if [[ "$1" == "-p" ]]; then
  prep
fi
html
