#!/bin/sh
echo -n "How many minutes are you going to watch tv? "
read -e TIME
let "TIME = $TIME*60"
tvtime -d /dev/video1 -m&
sleep $TIME
killall -9 tvtime
xset dpms force off
