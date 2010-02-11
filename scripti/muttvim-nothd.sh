#!/bin/sh
# (c)2010 John Magolske, GPL v3
# http://b79.net/contact
# Last edit: 2010/02/11 Thu 10:27 PST 

# For use with the Mutt email client; allows you to compose new messages to a
# list, group or individual by "replying" to an email without having the new
# message attached to it in a thread. It also deletes the old message body and
# subject title. To be used with the companion script muttvim.sh & things like
# this in your muttrc (+ 2 additional lines with <group-reply> & <list-reply>):
# 
# macro index \Cr ":set editor=\"~/.mutt/muttvim-nothd.sh\";set edit_headers\n<reply>:set editor=\"~/.mutt/muttvim.sh\";unset edit_headers\n"

# Delete everything in the message body from & including the 'In-Reply-To:'
# header to the last two blank lines before my signature (this works because
# there are two blank lines before the -- in my ~/.signature file), add back in
# two blank lines, and delete the subject, leaving the cursor positioned after
# the 'Subject: ' header with Vim in insert mode.
vim "+:g/^In-Reply-To:/?In-Reply-To?,/\n$\n$/d" "+norm o" "+norm o" \
"+%s/^Subject.*$/Subject: /" "+norm $" "+:star!" $1

# Reset screen / xterm window name to 'mutt' rather than 'Thanks for flying Vim'
# ( http://vim.wikia.com/wiki/Automatically_set_screen_title )
if [ "$TERM" = "screen.linux" ]
then
    echo -ne \"\\033kmutt\\033\\134\"
elif [ "$TERM" = "xterm" ]
then
    echo -ne \"\\033]0;mutt\\033\\007\"
fi

