#!/bin/zsh
setopt extendedglob

# first, convert images in the current directory into thumbnails in ./thumbs
# i dont care if you dont have only images in this directory
# thats up to the user

# an artifact from the previous script
YEAR=$(date +%Y)

# LOCPATH
LOCPATH=${PWD#"$HOME"}

mkdir thumbs
echo generating thumbnails...
mogrify -format gif -path thumbs -thumbnail 150x150 (#i)*(png|jpg|jpeg|gif|bmp)

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
    <title>'''$YEAR''' unclassified photo dump ('''$LOCPATH''', colorized)</title>
<link rel="stylesheet" href="style.css">
</head>
<body bgcolor="#333">''' > index.html

# here, ignore the previously created files, index.html and style.css

for x in *~*(html|css)(.); do
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
