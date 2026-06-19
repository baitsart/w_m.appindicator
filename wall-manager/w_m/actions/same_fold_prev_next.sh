#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

if echo "$1" | grep -i "prev"; then
line_opt="head"
fi
if echo "$1" | grep -i "next"; then
line_opt="tail"
fi

chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode"| sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')
folder=$(echo "$chi" | sed 's|/|\n|g' | sed '$d' | tr '\n' '/' )

	if [ -d "$folder" ];
then

find "$folder" -maxdepth 1 -type f | grep ".jpg\|.JPG\|.jpeg\|.JPEG\|.gif\|.GIF\|.png\|.PNG\|.svg\|.SVG\|.BMP\|.bmp" > /tmp/images-temp1
find "$folder" ! -name '*.jpg' ! -name '*.JPG' ! -name '*.jpeg' ! -name '*.JPEG' ! -name '*.gif' ! -name '*.GIF' ! -name '*.png' ! -name '*.PNG' ! -name '*.svg' ! -name '*.SVG' ! -name '*.bmp' ! -name '*.BMP' ! -name '*.xml' ! -name '*.XML' ! -name '*.url' ! -name '*.URL' ! -name '*.pdf' ! -name '*.PDF' ! -name '*.txt' ! -name '*.TXT' ! -name '*.zip' ! -name '*.rar' ! -name '*.torrent' ! -name '*.db' ! -name '*.xmp' ! -name '*.tar' ! -name '*.bz' ! -name '*.gz' ! -name '*.jar' ! -name '*.7z' ! -name '*.ar' ! -name '*.cb' ! -name '*.exe' ! -name '*.xz' ! -name '*.inf' ! -name '*.mp3' ! -name '*.html' ! -name '*.js' ! -name '*.ini' | while read line; do
if [ -f "$line" ];then
if file "$line" | sed 's|'"$line"':||' | grep -q image
then
echo "$line" >> /tmp/images-temp1
fi
fi
done
sort -V /tmp/images-temp1 | uniq > /tmp/images-temp
first_line=$(head -n1 /tmp/images-temp)
last_line=$(tail -n1 /tmp/images-temp)
if echo "$first_line" | grep -x -q "$chi"; then
if echo "$line_opt" | grep -x -q "head"; then
sed -i '1i\
'"$last_line"'' /tmp/images-temp
fi
fi
if echo "$last_line" | grep -x -q "$chi"; then
if echo "$line_opt" | grep -x -q "tail"; then
echo "$first_line" >> /tmp/images-temp
fi
fi

grep -1 "^$chi" /tmp/images-temp > /tmp/images-temp1

$line_opt -n 1 /tmp/images-temp1 > /tmp/images-temp
image=$(cat /tmp/images-temp)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file://"$image"
rm /tmp/images-temp1
rm /tmp/images-temp
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
sh /usr/share/wallpaper_manager/w_m/actions/color-back1.sh
sh /usr/share/wallpaper_manager/w_m/actions/color-back21.sh 
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image: "$image""
rm /tmp/images-temp1
rm /tmp/images-temp
     exit
fi
fi
