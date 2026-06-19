#!/bin/sh

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

file=$(cat $HOME/.wallpaper_manager/imagen_especial)
image="$file"
	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"
notify-send -i /usr/share/icons/gnome/32x32/actions/insert-image.png "wallpaper-manager" "Special image, as background"
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
line=$(echo $image | grep "$1")

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from Special image?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/favoritos
sed -i '/^$/d' ~/.wallpaper_manager/favoritos
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the Special image list "

      fi
else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/imagen_especial"
     exit
fi
fi
fi
