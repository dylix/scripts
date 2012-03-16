#!/bin/bash
#FONT="edges"
#scrot 'ss-%m.%d.%y-%H%M.png' -e 'mv $f /mnt/dylix/public_html/screenshots/'
#scrot 'ss-%m.%d.%y-%H%M.jpg' -q 95 -e 'composite -gravity southeast /mnt/dylix/public_html/screenshots/deadarea.png $f $f' -e 'mv $f /mnt/dylix/public_html/screenshots/'
#scrot 'hmm.jpg' -q 95
scrot 'ss-%m.%d.%y-%H%M.jpg' -q 95 -e 'mv $f /mnt/dylix/public_html/screenshots/'
#aterm -geometry 80x10+100+100 -tr -sh 50 -bg black -fg white -ls +sb -fn $FONT -fb $FONT -e /home/dylix/scripts/screenshot-thumbnail
Terminal --geometry=80x10+0+0 -e /home/dylix/scripts/screenshot-thumbnail
