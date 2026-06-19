#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode"| sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')
echo "Wallpaper: $chi"


folder=$(echo "$chi" | sed 's|/|\n|g' | sed '$d' | tr '\n' '/' )

	if [ -d "$folder" ];
then
find "$folder" -regex ".*\(.jpg\|.JPG\|.jpeg\|.JPEG\|.gif\|.GIF\|.png\|.PNG\|.svg\|.SVG\|.BMP\|.bmp\)"  | while read line; do echo ""'"'"$line"'"'"" >> /tmp/buenas-imagenes1; done
find "$folder" ! -name '*.jpg' ! -name '*.JPG' ! -name '*.jpeg' ! -name '*.JPEG' ! -name '*.gif' ! -name '*.GIF' ! -name '*.png' ! -name '*.PNG' ! -name '*.svg' ! -name '*.SVG' ! -name '*.bmp' ! -name '*.BMP' ! -name '*.xml' ! -name '*.XML' ! -name '*.url' ! -name '*.URL' ! -name '*.pdf' ! -name '*.PDF' ! -name '*.txt' ! -name '*.TXT' ! -name '*.zip' ! -name '*.rar' ! -name '*.torrent' ! -name '*.db' ! -name '*.xmp' ! -name '*.tar' ! -name '*.bz' ! -name '*.gz' ! -name '*.jar' ! -name '*.7z' ! -name '*.ar' ! -name '*.cb' ! -name '*.exe' ! -name '*.xz' ! -name '*.inf' ! -name '*.mp3' ! -name '*.html' ! -name '*.js' ! -name '*.ini' | while read line; do
if [ -f "$line" ];then
if file "$line" | sed 's|'"$line"':||' | grep -q image
then
echo ""'"'"$line"'"'"" >> /tmp/buenas-imagenes1
fi
fi
done
cat /tmp/buenas-imagenes1 | awk '{ printf "%s ", $0 }' >  /tmp/buenas-imagenes
echo "#!/bin/bash" > /tmp/script_viewer
cat /tmp/buenas-imagenes | head -n1 | awk '{ print "eog --slide-show "$0"" } ' > /tmp/buenas-imagenes1
cat /tmp/buenas-imagenes | sed '1d' >> /tmp/buenas-imagenes1
cat /tmp/buenas-imagenes1 | tr '\n' ' ' > /tmp/buenas-imagenes
cat /tmp/buenas-imagenes >> /tmp/script_viewer
echo "exit" >> /tmp/script_viewer
chmod +x /tmp/script_viewer
sh /tmp/script_viewer
rm /tmp/buenas-imagenes
rm /tmp/buenas-imagenes1
rm /tmp/script_viewer
exit
fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
fi
