#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode"| sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')



folder=$(echo "$chi" | sed 's|/|\n|g' | sed '$d' | tr '\n' '/' )

	if [ -d "$folder" ];
then
cd "$folder"
/bin/bash /usr/share/wallpaper_manager/w_m/actions/create-xml-background

# Reiniciar notificador de wallpapers
#pkill -f wallpaper-notify.sh 2>/dev/null
#/usr/share/wallpaper_manager/w_m/actions/wallpaper-notify.sh &

exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No such directory: "$folder""

     exit
fi
fi

