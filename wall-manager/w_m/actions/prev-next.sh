#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode")
echo "$chi" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//' > /tmp/background_notify

awk '!array_temp[$0]++'  < ~/.wallpaper_manager/historial > /tmp/background_notify1

var=$(cat /tmp/background_notify)

grep -A1 "^$var" /tmp/background_notify1 > /tmp/background_notify2

tail -n 1 /tmp/background_notify2 > /tmp/background_notify
rm /tmp/background_notify2
rm /tmp/background_notify1
file=$(cat /tmp/background_notify)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
sh /usr/share/wallpaper_manager/w_m/actions/color-back21.sh "$image"
sh /usr/share/wallpaper_manager/w_m/actions/color-back1.sh
rm /tmp/background_notify
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"
then



if zenity --title "Remove from the list" --question --text "Do you want to Remove the current path from history?"
	then
sed -i 's|'"$image"'||' ~/.wallpaper_manager/historial
sed -i '/^$/d' ~/.wallpaper_manager/historial
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the history"
fi
fi
	if [ "$line" -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image: ~/.wallpaper_manager/historial"
rm /tmp/background_notify
     exit
fi
fi
