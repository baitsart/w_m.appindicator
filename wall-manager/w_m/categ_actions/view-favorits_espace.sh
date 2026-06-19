#!/bin/bash
	if [ -f ~/.wallpaper_manager/tags/imagenes_espacio ]; then

cat ~/.wallpaper_manager/tags/imagenes_espacio | awk '!array_temp[$0]++' > /tmp/buenas-imagenes
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done <  /tmp/buenas-imagenes
cat /tmp/buenas-imagenes1 | awk '{ printf "%s ", $0 }' >  /tmp/buenas-imagenes
echo "#!/bin/sh" > /tmp/script_viewer
cat /tmp/buenas-imagenes | head -n1 | awk '{ print "eog  "$0"" } ' > /tmp/buenas-imagenes1
cat /tmp/buenas-imagenes | sed '1d' >> /tmp/buenas-imagenes1
cat /tmp/buenas-imagenes1 | tr '\n' ' ' > /tmp/buenas-imagenes
cat /tmp/buenas-imagenes >> /tmp/script_viewer
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
