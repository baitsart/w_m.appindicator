#!/bin/sh

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

file=$(shuf -n 1 ~/.wallpaper_manager/fondo-de-escritorio)

image="$file"
	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
sh /usr/share/wallpaper_manager/w_m/actions/color-back1.sh
sh /usr/share/wallpaper_manager/w_m/actions/color-back21.sh "$image"
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  "$image"
Execute Reload"
sh /usr/share/wallpaper_manager/w_m/actions/reload.sh
     exit
fi
fi
