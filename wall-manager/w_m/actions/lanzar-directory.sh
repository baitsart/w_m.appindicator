#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

IMG_FOLDER=$(xdg-user-dir PICTURES)/Imagenes

chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode"| sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

special_folder=$(echo "$chi" | sed "s|$IMG_FOLDER/||" | cut -d'/' -f1)

target="$IMG_FOLDER/$special_folder"

echo "$target"

if [ -d "$target" ];
then
find "$IMG_FOLDER/$special_folder/$directory" -regex ".*\(.jpg\|.JPG\|.jpeg\|.JPEG\|.gif\|.GIF\|.png\|.PNG\|.svg\|.SVG\|.BMP\|.bmp\)" > /tmp/images-temp1
find "$IMG_FOLDER/$special_folder/$directory" ! -name '*.jpg' ! -name '*.JPG' ! -name '*.jpeg' ! -name '*.JPEG' ! -name '*.gif' ! -name '*.GIF' ! -name '*.png' ! -name '*.PNG' ! -name '*.svg' ! -name '*.SVG' ! -name '*.bmp' ! -name '*.BMP' ! -name '*.xml' ! -name '*.XML' ! -name '*.url' ! -name '*.URL' ! -name '*.pdf' ! -name '*.PDF' ! -name '*.txt' ! -name '*.TXT' ! -name '*.zip' ! -name '*.rar' ! -name '*.torrent' ! -name '*.db' ! -name '*.xmp' ! -name '*.tar' ! -name '*.bz' ! -name '*.gz' ! -name '*.jar' ! -name '*.7z' ! -name '*.ar' ! -name '*.cb' ! -name '*.exe' ! -name '*.xz' ! -name '*.inf' ! -name '*.mp3' ! -name '*.html' ! -name '*.js' ! -name '*.ini' | while read line; do
if [ -f "$line" ];then
if file "$line" | sed 's|'"$line"':||' | grep -q image
then
echo "$line" >> /tmp/images-temp1
fi
fi
done
image=$(shuf -n 1 /tmp/images-temp1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file://"$image"
rm /tmp/images-temp1
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/color-back21.sh "$image"
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image: "$image""
rm /tmp/images-temp1
     exit
fi
fi
