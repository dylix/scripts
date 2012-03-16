#!/bin/bash
# forecast.sh
# copyright 2010 by Mobilediesel
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

if ping -c1 rss.wunderground.com 1>/dev/null
then
dump=$(curl -s 'http://rss.wunderground.com/auto/rss_full/GA/Atlanta.xml?units=english' | tr -d '\r\n\t' | grep -o "CDATA\[[^]]*" | sed -e 's/^CDATA\[//' -e '1d' -e 's/^[[:blank:]]*//' -e 's/[[:blank:]]*$//' -e '/^[[:blank:]]*$/d' | head -3 | fold -sw 55 | sed "s/^[^-]*-/&/")
forecast=$(echo -en "Forecast\n$dump")
else
forecast=$(echo -en "\${color grey}Forecast is Unavailable")
fi
echo "$forecast"
