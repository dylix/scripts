#!/bin/sh

#firefox https://mail.google.com/mail?view=cm&tf=0&to=`echo $1 | sed ‘s/mailto://’`

BROWSER="chromium"

#when we are passed an email address like this:
#mailto:vdog@domain.com?subject=hi%20vernon&body=please%20unsubscribe%20me%20from%20this%20mad%20list&cc=mad@max.com&bcc=jo@mama.com

#we want to generate a uri like this:
#http://mail.google.com/mail/?view=cm&tf=0&to=vdog@domain.com&cc=mad@max.com&bcc=jo@mama.com&su=hi%20vernon&body=please%20unsubscribe%20me%20from%20this%20mad%20list&zx=9i09cu-h33iui

#Unless you are using gmail for a hosted domain, then you want to use this:
#http://mail.google.com/a/domain.tld/?view=cm&tf=0&to=vdog@domain.com&cc=mad@max.com&bcc=jo@mama.com&su=hi%20vernon&body=please%20unsubscribe%20me%20from%20this%20mad%20list&zx=9i09cu-h33iui

#NOTE from and the editor of the above line: the /a/ may differ from domain to domain, I'm not sure I only have one hosted domain.

# remove the ? from the uri
uri=`echo "$1" | sed -e 's/subject=/su=/' -e 's/^mailto:\([^&?]\+\)[?&]\?\(.*\)$/\1\&\2/'`

if [ "$uri" ];
 then exec $BROWSER "https://mail.google.com/mail?view=cm&tf=0&ui=1&to=$uri"
fi

exec $BROWSER "https://mail.google.com/"

