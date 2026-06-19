#!/bin/bash
if CHOICE=$(cat ~/.wallpaper_manager/colors-list | zenity --list \
   --width="280" \
   --height="515" \
   --text="Pick a color" \
   --title="Wallpaper" \
   --column "List of colors")
then
color=$(echo "$CHOICE" | awk '{print $1}')
gsettings set org.gnome.desktop.background primary-color "$color"
	else
     exit
fi
