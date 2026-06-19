#!/bin/bash

# Script #
# Eres libre de modificarlo y redistribuirlo
# por  Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

archivo=$(echo "$chi" | sed 's|/|\n|g'| tail -n1  | sed 's|\]||g;s|\[||g')


folder=$(echo "$chi" | sed 's|/|\n|g' | sed '$d' | tr '\n' '/' )
file=$(echo "$archivo" | sed 's|.jpg||g;s|.JPG||g;s|.jpeg||g;s|.JPEG||g;s|.gif||g;s|.GIF||g;s|.png||g;s|.PNG||g;s|.svg||g;s|.SVG||g;s|.BMP||g;s|.bmp||')

convert -rotate 180 "$chi" "$folder/$file-rotated-invert.jpg"
gsettings set org.gnome.desktop.background picture-uri"$mode" file://"$folder/$file-rotated-invert.jpg"
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
