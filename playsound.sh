#!/bin/bash
if [ -z "$1" ] ; then
        echo "Usage: playsound.sh <filename>"
        exit 1;
else
	T1=`xset -q | grep Monitor | awk '{print $3}'`

	T2="On"
	if [ "$T1" = "$T2" ]; then
		/usr/bin/aplay "$1" &>/dev/null
	fi
fi
