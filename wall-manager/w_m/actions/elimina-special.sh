#!/bin/sh
if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from Special image?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri"$mode")
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_especiales
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_especiales 
sed -i '/^$/d' $HOME/.wallpaper_manager/tags/imagenes_especiales
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the Special image list "

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the Special image list .' --no-wrap
      else
zenity --info --title "Cancel" --text "Not removed from Special image list" --no-wrap
     exit
     fi
