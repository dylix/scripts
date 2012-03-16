#!/bin/sh
/home/dylix/scripts/xplanet/update_xplanet.pl
#xplanet -config /home/dylix/.xplanet.cfg --num_times 1 --output /home/dylix/.wallpaper/xplanet/xplanet.jpg --latitude +33.88 --longitude -84.30 --radius 60 --geometry 1280x1024
#xplanet -config /home/dylix/.xplanet.cfg --num_times 1 --output /home/dylix/.wallpaper/xplanet/xplanet.jpg --latitude +33.88 --longitude -84.30 --radius 60 --geometry 1920x1090 -projection rectangular
/usr/bin/xplanet -config /home/dylix/scripts/xplanet/.xplanet.cfg --num_times 1 --output /home/dylix/scripts/xplanet/xplanet.png --latitude +33.88 --longitude -0 --radius 60 --geometry 1920x1080 -projection rectangular -label -quality 100 -date_format "%x %I:%M%p" -color white -fontsize 8
DISPLAY=:0.0 /usr/bin/xfdesktop --reload
