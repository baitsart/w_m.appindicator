#!/bin/bash
if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
else
    mode=""
fi

file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_nueva)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No picture:  $file"
line=$(echo $image | grep "$1")

	if [ "$line" != "" ]; then

zenity --title "Remove from list" --question --text "Do you want to remove the background current favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_nueva
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_nueva
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "It has been removed from the list of favorites"

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No picture:  ./tags/favorites"
     exit
fi
fi
