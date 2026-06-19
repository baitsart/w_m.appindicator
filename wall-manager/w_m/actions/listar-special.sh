#!/bin/sh

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

if CHOICE=$(cat $HOME/.wallpaper_manager/tags/imagenes_especiales | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)
	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi
		if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "in image:  $file"
if
echo $image | grep "$1"
then
if
zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from: imagenes_especiales?"
then
sed -i 's|'"$image"'||' ~/.wallpaper_manager/favoritos
sed -i '/^$/d' ~/.wallpaper_manager/favoritos
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from: imagenes_especiales"
      fi
else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "in image:  ./tags/imagenes_especiales"
     exit
fi
fi
fi
fi
