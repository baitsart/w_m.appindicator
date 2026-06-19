#!/bin/bash

screen=$(ls /usr/lib/xscreensaver/ | awk '{print "; "$0 }' | awk '{ print NR $0 }' | zenity --list --width="130" --height="615" --text "Pick a ScreenSaver" --title "ScreenSavers" --column "ScreenSaver")
	if [ "$screen" != "" ]; then
pantalla=$(echo "$screen" >> ~/.wallpaper_manager/salvapantallas-favoritos)
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "Saving" "Is save ( $screen ), in favorites list"

exit 0
fi
	if [ $? -eq 0 ]; then

     exit
     fi

