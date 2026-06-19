#!/bin/bash

# Script #
# Eres libre de modificarlo y redistribuirlo
# por  Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart
tac ~/.wallpaper_manager/historial > /tmp/list_recents
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo "$LINE" >> /tmp/buenas-imagenes
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < /tmp/list_recents
if total_files=$(cat /tmp/buenas-imagenes | wc -l | grep "$1")
echo "Total files $total_files"
then
feh -t -E 128 -y 128 -W 1024  -f /tmp/buenas-imagenes
rm /tmp/buenas-imagenes
rm /tmp/list_recents
     exit
fi
fi
	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
