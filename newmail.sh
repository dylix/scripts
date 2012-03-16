#!/bin/sh
/usr/bin/notify-send -i /home/dylix/.icons/ggn-new.png 'New Email' 'You have new email!'
#stock_mail
T1=`xset -q | grep Monitor | awk '{print $3}'`
#echo $MONON

T2="On"
if [ "$T1" = "$T2" ]; then
	/usr/bin/aplay ~/.sounds/e-mail.wav &>/dev/null
fi


