#!/bin/bash

aplay ~/.sounds/voice-system-activated.wav
aplay ~/.sounds/wecome-piy-music.wav
aplay ~/.sounds/voice-access-denied-remix.wav
mpg123 ~/.sounds/remix_alarama_100.mp3

#DATE=$(date +"%Y%m%d%H%M%S")

#aplay ~/scripts/attention.wav

#ALARM_EMAIL="/tmp/myalarm.tmp"
#echo "Subject: Motion detected - $DATE" > $ALARM_EMAIL
#echo "" >> $ALARM_EMAIL
#
#echo "Motion detected - check $DATE.avi" >> $ALARM_EMAIL
#cat $ALARM_EMAIL | /usr/sbin/ssmtp dylix@localhost
