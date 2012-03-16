#!/bin/sh
cd /home/dylix/.wallpaper
curl -O -s "http://static.die.net/earth/mercator/1600.jpg"
convert -crop 1280x1024+50+0 1600.jpg 1600.jpg
#+100+0
#TEXT=$(date)
#convert 1600.jpg -fill white -undercolor '#00000080' -gravity SouthEast -annotate +100+0 " $TEXT" 1600.jpg
DISPLAY=:0.0 /usr/bin/xfdesktop --reload &>/dev/null
