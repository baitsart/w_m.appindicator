#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

image=`zenity --file-selection --file-filter="Images|*.jpg *.JPG *.jpeg *.JPEG *.gif *.GIF *.png *.PNG *.svg *.SVG *.BMP *.bmp" --title="Select a picture"`
case $? in
         0)
                gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image" && sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh;;

         1)
                echo "No ha seleccionado ningún archivo.";;
        -1)
                echo "Ha ocurrido un error inesperado.";;
esac
