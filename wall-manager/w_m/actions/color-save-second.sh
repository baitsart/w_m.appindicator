#!/bin/bash
coolor=$(gsettings get org.gnome.desktop.background secondary-color)

if file=$(zenity --entry --title="Save color as..." --text="Write the color name")
then
var=$(echo "'"$file"'")
existing=$(cat | grep "$var" ~/.wallpaper_manager/colors-list )
	if [ "$existing" != "" ]; then
zenity --warning --title="w_m" --text="This name was used:  "$var"\nPlease change the name"
     exit 0
	fi
	if [ $? -eq 0 ]; then
texto=$(echo "$coolor" | sed 's/'"'"'//g')
echo ""$texto"	~$var" >> ~/.wallpaper_manager/colors-list
sed -i '/^$/d' ~/.wallpaper_manager/colors-list
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Color save in the colors list"

exit
fi
fi
