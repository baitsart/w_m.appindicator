#!/bin/sh
IMG_FOLDER=$(xdg-user-dir PICTURES)/Imagenes/


find "$IMG_FOLDER"/ -regex ".*\(.jpg\|.JPG\|.jpeg\|.JPEG\|.gif\|.GIF\|.png\|.PNG\|.svg\|.SVG\|.bmp\|.BMP\)" > ~/.wallpaper_manager/fondo-de-escritorio
find /usr/share/backgrounds -regex ".*\(.jpg\|.JPG\|.jpeg\|.JPEG\|.gif\|.GIF\|.png\|.PNG\|.svg\|.SVG\|.bmp\|.BMP\)" >> ~/.wallpaper_manager/fondo-de-escritorio
find /usr/share/backgrounds -regex ".*\(.jpg\|.JPG\|.jpeg\|.JPEG\|.gif\|.GIF\|.png\|.PNG\|.svg\|.SVG\|.bmp\|.BMP\)" >> ~/.wallpaper_manager/fondo-de-escritorio
find "$IMG_FOLDER"/ ! -name '*.jpg' ! -name '*.JPG' ! -name '*.jpeg' ! -name '*.JPEG' ! -name '*.gif' ! -name '*.GIF' ! -name '*.png' ! -name '*.PNG' ! -name '*.svg' ! -name '*.SVG' ! -name '*.bmp' ! -name '*.BMP' ! -name '*.xml' ! -name '*.XML' ! -name '*.url' ! -name '*.URL' ! -name '*.pdf' ! -name '*.PDF' ! -name '*.txt' ! -name '*.TXT' ! -name '*.zip' ! -name '*.rar' ! -name '*.torrent' ! -name '*.db' ! -name '*.xmp' ! -name '*.tar' ! -name '*.bz' ! -name '*.gz' ! -name '*.jar' ! -name '*.7z' ! -name '*.ar' ! -name '*.cb' ! -name '*.exe' ! -name '*.xz' ! -name '*.inf' ! -name '*.mp3' ! -name '*.html' ! -name '*.js' ! -name '*.ini' | while read line; do
if [ -f "$line" ];then
if file "$line" | sed 's|'"$line"':||' | grep -q image
then
echo "$line" >> ~/.wallpaper_manager/fondo-de-escritorio
fi
fi
done
if grep -q ""$IMG_FOLDER"/" ~/.wallpaper_manager/fondo-de-escritorio ; then
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-refresh.png "wallpaper-manager" "The images list its reload"
exit
fi
notify-send "No images on: "$IMG_FOLDER"/" "Put some file there, or you can download some, with:
~\*.All images:
Nasa wallpaper
Image from NatGeo
Image from google, by terms
Google search by images"
exit 0
