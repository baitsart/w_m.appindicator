#!/bin/bash
if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
else
    mode=""
fi

CHOICE=$(cat ~/.wallpaper_manager/tags/imagenes_nueva | zenity --list --width="850" --height="515" --text "Select an image" --title "Wallpaper" --column "images saved")
image="$CHOICE"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

line=$(echo $image | grep "$1")

	if [ "$line" != "" ]; then

zenity --title "Remove from list" --question --text "Do you want to remove the background current favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_nueva
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_nueva
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "It has been removed from the list of favorites"

     exit
fi
fi
