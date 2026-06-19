#!/bin/sh

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri"$mode")
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//' )
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/buenas_imagenes
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/buenas_imagenes_fechado
sed -i '/^$/d' ~/.wallpaper_manager/buenas_imagenes
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list .' --no-wrap
      else
zenity --info --title "Cancel" --text "Not removed from favorites" --no-wrap
     exit
     fi
