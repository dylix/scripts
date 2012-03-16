#!/bin/sh
if [ -z "$1" ] ; then
	echo "Usage: split-wall.sh <filename>"
	exit 1;
else
	if [ -d ~/.wallpaper ]; then
		convert -crop 50%x100% "$1" ~/.wallpaper/mon.jpg
		xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s ~/.wallpaper/mon-0.jpg
		xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor1/image-path -s ~/.wallpaper/mon-1.jpg
		xfdesktop -reload &>/dev/null
	else
		echo "Error: Please create ~/.wallpaper"
		exit 1;
	fi
fi
