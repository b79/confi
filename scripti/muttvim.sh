#!/bin/sh
# (c)2010 John Magolske, GPL v3
# http://b79.net/contact
# Last edit: 2010/02/11 Thu 10:17 PST 

# For use with the Mutt email client. This calls Vim as the editor, then,
# upon closing Vim, resets the screen or xterm window name to 'mutt' rather
# than 'Thanks for flying Vim' 
# ( http://vim.wikia.com/wiki/Automatically_set_screen_title )
# 
# Put this script in your $PATH and source it with a line in your muttrc:
# 
#   set editor="muttvim.sh"

vim $1

if [ "$TERM" = "screen.linux" ]
then
    echo -ne \"\\033kmutt\\033\\134\"
elif [ "$TERM" = "xterm" ]
then
    echo -ne \"\\033]0;mutt\\033\\007\"
fi

