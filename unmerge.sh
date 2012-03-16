#!/bin/bash
# umerge.sh - unmerge packages easily
# v0.0.2b

UMERGELIST=`mktemp -t "unmerge_list_XXXXX"`

dialog --title 'Dialog unmerger' --single-quoted --checklist 'Select packages to unmerge' 0 0 0 `while read LINE; do echo -n "$LINE | off "; done < /var/lib/portage/world | sort` 2> "$UMERGELIST"
clear

sed -i "s/'//g" $UMERGELIST

emerge -vaC `cat $UMERGELIST`

rm $UMERGELIST
