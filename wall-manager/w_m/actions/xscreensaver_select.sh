#!/bin/bash
screen=$(ls /usr/lib/xscreensaver/ | awk '{print "; "$0 }' | awk '{ print NR $0 }' | zenity --list --width="130" --height="615" --text "Pick a ScreenSaver" --title "ScreenSavers" --column "ScreenSaver")
	if [ "$screen" != "" ]; then
pantalla=$(echo "$screen" | cut -d';' -f1)
	xscreensaver-command --select "$pantalla"

exit 0
fi
	if [ $? -eq 0 ]; then

     exit
     fi

