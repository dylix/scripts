#!/bin/sh
FONT="lime"

#Terminal --geometry=155x20+0+800 --hide-menubar --title=access_log -e "multitail -cS apache /mnt/www/thetruth/access_log"
#aterm -geometry 211x23+0+785 -title access_log -tr -sh 50 -bg black -fg white -ls +sb -fn $FONT -fb $FONT -e /home/dylix/scripts/multi
aterm -geometry 211x23+0+785 -title access_log -tr -bg black -fg white -ls +sb -fn $FONT -fb $FONT -e /home/dylix/scripts/multi
#-e multitail -D -cS apache -i /mnt/www/thetruth/access_log

## -e "irssi -c livehunt.com -p 31337 -w 1123"
