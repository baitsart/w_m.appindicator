#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi


cat ~/.wallpaper_manager/tags/*imagenes* > ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/buenas_imagenes >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_especiales >> ~/.wallpaper_manager/tags/todos_favoritos
file=$(shuf -n 1 ~/.wallpaper_manager/tags/todos_favoritos)
image="$file"
imagen=$(cat "$image")
	if [ "$imagen" != "" ]; then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/color-back21.sh "$image"
sh /usr/share/wallpaper_manager/w_m/actions/color-back1.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/*imagenes*
sed -i '/^$/d' ~/.wallpaper_manager/tags/*imagenes*
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      fi
else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
fi
