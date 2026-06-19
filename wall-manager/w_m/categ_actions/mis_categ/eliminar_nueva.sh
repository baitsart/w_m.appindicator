#!/bin/bash
if zenity --title "Remove from list" --question --text "¿Want to delete the current background tag/imagenes_nueva?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_nueva
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_nueva 
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "It has been removed from the tag list/imagenes_nueva"

zenity --info --title "Remove from list" --text '<b>...Hecho!.</b>\nIt has been removed from the tag list/imagenes_nueva.' --no-wrap
      else
zenity --info --title "canceled" --text "Tag will not be deleted/imagenes_nueva" --no-wrap
     exit
     fi
