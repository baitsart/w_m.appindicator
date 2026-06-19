#!/bin/sh
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from history?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri"$mode")
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/historial
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/historial_fechado
sed -i '/^$/d' ~/.wallpaper_manager/historial
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the history list "

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the history list .' --no-wrap
      else
zenity --info --title "Cancel" --text "Not removed from history" --no-wrap
     exit
     fi
