#!/bin/bash

cat ~/.wallpaper_manager/tags/* > ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/buenas_imagenes >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_especiales >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/todos_favoritos | awk '!array_temp[$0]++' > /tmp/buenas-imagenes
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < /tmp/buenas-imagenes
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Cantidad de imágenes $total_files"
then
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
