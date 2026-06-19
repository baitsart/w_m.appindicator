#!/bin/bash

# Script #
# Eres libre de modificarlo y redistribuirlo
# por  Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

save()
{
chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode"| sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')



folder=$(echo "$chi" | sed 's|/|\n|g' | sed '$d' | tr '\n' '/' )

	if [ -d "$folder" ];
then
echo "$folder" >> ~/.wallpaper_manager/tags/saved_folders
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Folder saved, on the list"
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "There is not a correct path: "$folder""
     exit
fi
}
delete()
{
if image=$(cat ~/.wallpaper_manager/tags/saved_folders | zenity --list --width="850" --height="515" --text="Folders saved" --title "Wallpaper" --column "Select a path"); then
ruta=$(echo "$image"| cut -d'|' -f1 | sed 's|\]|\\]|g;s|\[|\\[|g')
if zenity --title "Remove from list" --question --text "Do you want to remove the path to the directory listing?"
then
sed -i 's|'"$ruta"'||' ~/.wallpaper_manager/tags/saved_folders
sed -i '/./!d' ~/.wallpaper_manager/tags/saved_folders
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Route has been removed from the list"
fi
fi
	if [ $? -eq 0 ]; then
exit
fi
}
ver()
{
image=$(cat ~/.wallpaper_manager/tags/saved_folders | zenity --list --width="850" --height="515" --text="Folders saved" --title "Wallpaper" --column "Select a path")
ruta=$(echo "$image"| cut -d'|' -f1)
find "$ruta" -regex ".*\(.jpg\|.JPG\|.jpeg\|.JPEG\|.gif\|.GIF\|.png\|.PNG\|.svg\|.SVG\|.BMP\|.bmp\)" | while read line; do echo ""'"'"$line"'"'"" >> /tmp/buenas-imagenes1; done
find "$ruta" ! -name '*.jpg' ! -name '*.JPG' ! -name '*.jpeg' ! -name '*.JPEG' ! -name '*.gif' ! -name '*.GIF' ! -name '*.png' ! -name '*.PNG' ! -name '*.svg' ! -name '*.SVG' ! -name '*.bmp' ! -name '*.BMP' ! -name '*.xml' ! -name '*.XML' ! -name '*.url' ! -name '*.URL' ! -name '*.pdf' ! -name '*.PDF' ! -name '*.txt' ! -name '*.TXT' ! -name '*.zip' ! -name '*.rar' ! -name '*.torrent' ! -name '*.db' ! -name '*.xmp' ! -name '*.tar' ! -name '*.bz' ! -name '*.gz' ! -name '*.jar' ! -name '*.7z' ! -name '*.ar' ! -name '*.cb' ! -name '*.exe' ! -name '*.xz' ! -name '*.inf' ! -name '*.mp3' ! -name '*.html' ! -name '*.js' ! -name '*.ini' | while read line; do
if [ -f "$line" ];then
if file "$line" | sed 's|'"$line"':||' | grep -q image
then
echo ""'"'"$line"'"'"" >> /tmp/buenas-imagenes1
fi
fi
done
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
then
cat /tmp/buenas-imagenes1 | awk '{ printf "%s ", $0 }' >  /tmp/buenas-imagenes
echo "#!/bin/bash" > /tmp/script_viewer
cat /tmp/buenas-imagenes | head -n1 | awk '{ print "eog "$0"" } ' > /tmp/buenas-imagenes1
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "in image:  /backgrounds/favoritos"
     exit 0
fi
}
slide()
{
image=$(cat ~/.wallpaper_manager/tags/saved_folders | zenity --list --width="850" --height="515" --text="Folders saved" --title "Wallpaper" --column "Select a path")
ruta=$(echo "$image"| cut -d'|' -f1)
find "$ruta" -regex ".*\(.jpg\|.JPG\|.jpeg\|.JPEG\|.gif\|.GIF\|.png\|.PNG\|.svg\|.SVG\|.BMP\|.bmp\)" | while read line; do echo ""'"'"$line"'"'"" >> /tmp/buenas-imagenes1; done
find "$ruta" ! -name '*.jpg' ! -name '*.JPG' ! -name '*.jpeg' ! -name '*.JPEG' ! -name '*.gif' ! -name '*.GIF' ! -name '*.png' ! -name '*.PNG' ! -name '*.svg' ! -name '*.SVG' ! -name '*.bmp' ! -name '*.BMP' ! -name '*.xml' ! -name '*.XML' ! -name '*.url' ! -name '*.URL' ! -name '*.pdf' ! -name '*.PDF' ! -name '*.txt' ! -name '*.TXT' ! -name '*.zip' ! -name '*.rar' ! -name '*.torrent' ! -name '*.db' ! -name '*.xmp' ! -name '*.tar' ! -name '*.bz' ! -name '*.gz' ! -name '*.jar' ! -name '*.7z' ! -name '*.ar' ! -name '*.cb' ! -name '*.exe' ! -name '*.xz' ! -name '*.inf' ! -name '*.mp3' ! -name '*.html' ! -name '*.js' ! -name '*.ini' | while read line; do
if [ -f "$line" ];then
if file "$line" | sed 's|'"$line"':||' | grep -q image
then
echo ""'"'"$line"'"'"" >> /tmp/buenas-imagenes1
fi
fi
done
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "in image:  /backgrounds/favoritos"
     exit 0
fi
}
listar()
{
if image=$(cat ~/.wallpaper_manager/tags/saved_folders | zenity --list --width="850" --height="515" --text="Folders saved" --title "Wallpaper" --column "Select a path"); then
ruta=$(echo "$image"| cut -d'|' -f1)
	if [ -d "$ruta" ];
then

find "$ruta" -regex ".*\(.jpg\|.JPG\|.jpeg\|.JPEG\|.gif\|.GIF\|.png\|.PNG\|.svg\|.SVG\|.BMP\|.bmp\)" > /tmp/temporal-line-numbers
find "$ruta" ! -name '*.jpg' ! -name '*.JPG' ! -name '*.jpeg' ! -name '*.JPEG' ! -name '*.gif' ! -name '*.GIF' ! -name '*.png' ! -name '*.PNG' ! -name '*.svg' ! -name '*.SVG' ! -name '*.bmp' ! -name '*.BMP' ! -name '*.xml' ! -name '*.XML' ! -name '*.url' ! -name '*.URL' ! -name '*.pdf' ! -name '*.PDF' ! -name '*.txt' ! -name '*.TXT' ! -name '*.zip' ! -name '*.rar' ! -name '*.torrent' ! -name '*.db' ! -name '*.xmp' ! -name '*.tar' ! -name '*.bz' ! -name '*.gz' ! -name '*.jar' ! -name '*.7z' ! -name '*.ar' ! -name '*.cb' ! -name '*.exe' ! -name '*.xz' ! -name '*.inf' ! -name '*.mp3' ! -name '*.html' ! -name '*.js' ! -name '*.ini' | while read line; do
if [ -f "$line" ];then
if file "$line" | sed 's|'"$line"':||' | grep -q image
then
echo "$line" >> /tmp/temporal-line-numbers
fi
fi
done
if image=$(cat /tmp/temporal-line-numbers | zenity --list --width="850" --height="515" --text="Images from this folder" --title "Wallpaper" --column "Select a path"); then
ruta=$(echo "$image"| cut -d'|' -f1)

gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$ruta"
rm /tmp/temporal-line-numbers
fi
fi
exit 1
	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "There is not a correct path: "$folder""
     exit
fi
fi
}

lanzar()
{
if image=$(cat ~/.wallpaper_manager/tags/saved_folders | zenity --list --width="850" --height="515" --text="Folders saved" --title "Wallpaper" --column "Select a path"); then
ruta=$(echo "$image"| cut -d'|' -f1)
find "$ruta" -regex ".*\(.jpg\|.JPG\|.jpeg\|.JPEG\|.gif\|.GIF\|.png\|.PNG\|.svg\|.SVG\|.BMP\|.bmp\)" > /tmp/images-temp1
find "$ruta" ! -name '*.jpg' ! -name '*.JPG' ! -name '*.jpeg' ! -name '*.JPEG' ! -name '*.gif' ! -name '*.GIF' ! -name '*.png' ! -name '*.PNG' ! -name '*.svg' ! -name '*.SVG' ! -name '*.bmp' ! -name '*.BMP' ! -name '*.xml' ! -name '*.XML' ! -name '*.url' ! -name '*.URL' ! -name '*.pdf' ! -name '*.PDF' ! -name '*.txt' ! -name '*.TXT' ! -name '*.zip' ! -name '*.rar' ! -name '*.torrent' ! -name '*.db' ! -name '*.xmp' ! -name '*.tar' ! -name '*.bz' ! -name '*.gz' ! -name '*.jar' ! -name '*.7z' ! -name '*.ar' ! -name '*.cb' ! -name '*.exe' ! -name '*.xz' ! -name '*.inf' ! -name '*.mp3' ! -name '*.html' ! -name '*.js' ! -name '*.ini' | while read line; do
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
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"
fi
fi
exit 1
	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "There is not a correct path:  $image"
exit
fi
}
xmls()
{
if image=$(cat ~/.wallpaper_manager/tags/saved_folders | zenity --list --width="850" --height="515" --text="Folders saved" --title "Wallpaper" --column "Select a path"); then
ruta=$(echo "$image"| cut -d'|' -f1)

find "$ruta" -regex ".*\(.jpg\|.JPG\|.jpeg\|.JPEG\|.gif\|.GIF\|.png\|.PNG\|.svg\|.SVG\|.BMP\|.bmp\)" > /tmp/buenas-imagenes1
find "$ruta" ! -name '*.jpg' ! -name '*.JPG' ! -name '*.jpeg' ! -name '*.JPEG' ! -name '*.gif' ! -name '*.GIF' ! -name '*.png' ! -name '*.PNG' ! -name '*.svg' ! -name '*.SVG' ! -name '*.bmp' ! -name '*.BMP' ! -name '*.xml' ! -name '*.XML' ! -name '*.url' ! -name '*.URL' ! -name '*.pdf' ! -name '*.PDF' ! -name '*.txt' ! -name '*.TXT' ! -name '*.zip' ! -name '*.rar' ! -name '*.torrent' ! -name '*.db' ! -name '*.xmp' ! -name '*.tar' ! -name '*.bz' ! -name '*.gz' ! -name '*.jar' ! -name '*.7z' ! -name '*.ar' ! -name '*.cb' ! -name '*.exe' ! -name '*.xz' ! -name '*.inf' ! -name '*.mp3' ! -name '*.html' ! -name '*.js' ! -name '*.ini' | while read line; do
if [ -f "$line" ];then
if file "$line" | sed 's|'"$line"':||' | grep -q image
then
echo "$line" >> /tmp/buenas-imagenes1
fi
fi
done
cat /tmp/buenas-imagenes1 | sed '/./!d' | shuf > /tmp/buenas-imagenes2
tail -n +2 < /tmp/buenas-imagenes1 > /tmp/buenas-imagenes
first=$(head -n1 /tmp/buenas-imagenes1)
DEBUG=y
LINES=$(wc -l < "$first")

if [ "$LINES" != "" ]; then

TIME=$(zenity --scale --title "$(gettext "Time configuration")" --text \
"$(gettext "Length of wallpaper (minutes.")" --min-value=1 --max-value=120 --value=5)
[ $? -ne 0 ] 
echo ${DEBUG:+"The time was set$TIME minutes."}

TIME=$(($TIME*60))

ANIMATION=$(zenity --scale --title "$(gettext "Time configuration")" --text \
"$(gettext "Length of animation (seconds.")" --min-value=1 --max-value=10 --value=5)
[ $? -ne 0 ] 
echo ${DEBUG:+"The animation time was set to $ANIMATION seconds."}

until [ -n "$NAMEXML" ]; do
	NAMEXML=$(zenity --entry --entry-text "background" --text \
"$(gettext "Input the name of .xml background file")")
	[ $? -ne 0 ] 
	[ -z "$NAMEXML" ] && echo ${DEBUG:+"Invalid name, trying again."}
done

BACK="$NAMEXML.xml"
echo ${DEBUG:+"The name of the xml file is $BACK."}
echo ${DEBUG:+"Creating the xml file."}

echo "<!-- GENERADO CON CREATE XML BACKGROUND ~WALLPAPER-MANAGER -->" > "$BACK"
echo "<background>
  <starttime>
    <year>2013</year>
    <month>04</month>
    <day>03</day>
    <hour>00</hour>
    <minute>00</minute>
    <second>00</second>
  </starttime>
  <static>
    <duration>$TIME.0</duration>
    <file>$first</file>
  </static>
  <transition>
    <duration>$ANIMATION.0</duration>
    <from>$first</from>" >> "$BACK"

awk '{ print "  <to>"$0"</to>  </transition>  <static>    <duration>'$TIME'.0</duration>" } '  /tmp/buenas-imagenes > /tmp/xml_back
awk '{ print "    <file>"$0"</file>  </static>  <transition>    <duration>'$ANIMATION'.0</duration>" } '  /tmp/buenas-imagenes > /tmp/xml_back1
awk '{ print "    <from>"$0"</from>" } '  /tmp/buenas-imagenes > /tmp/xml_back2
paste -d"\n" /tmp/xml_back  /tmp/xml_back1 /tmp/xml_back2 > /tmp/xml_backs
sed -i 'N;s|  </transition>  <static>    <duration>|  </transition>\n  <static>\n    <duration>|g' /tmp/xml_backs
sed -i 'N;s|</file>  </static>  <transition>    |</file>\n  </static>\n  <transition>\n    |g' /tmp/xml_backs
sed -i 'N;s|</to>|</to>\n|g' /tmp/xml_backs
sed -i 'N;s|</file>  </static>  <transition>    <duration>|</file>\n  </static>\n  <transition>\n    <duration>|g' /tmp/xml_backs
sed -i '/^$/d'  /tmp/xml_backs
cat /tmp/xml_backs >>  "$BACK"
echo "    <to>$first</to>
  </transition>
</background>" >> "$BACK"

echo ${DEBUG:+"The xml file was created."}

zenity --question --text "$(gettext "Do you want to put the .xml file as background.")"
OPTION=$?
mv $BACK $HOME/Imágenes/
image="$HOME/Imágenes/$BACK"
if [ $OPTION -eq 0 ]; then
	echo ${DEBUG:+"Putting the $BACK file as background."}
	gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi

echo ${DEBUG:+"Deleting the temp file and finishing the execution."}
rm /tmp/buenas-imagenes
rm /tmp/buenas-imagenes1
rm /tmp/buenas-imagenes2
rm /tmp/xml_backs
rm /tmp/xml_back
rm /tmp/xml_back1
rm /tmp/xml_back2
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "There is not a correct path:  ./$image"
     exit
fi
fi
}
options()
{

	file=$( zenity --list --radiolist --width="295" --height="235" --title="Folders saved" --text="Cick the action" \
					--column='(   *   )' --column='Option'  \
					'FALSE' 		"View_saved_folder" \
					'FALSE' 		"Slideshow_saved_folder" \
					'TRUE' 		"Launch_of_saved_folder" \
					'FALSE' 		"Xml_saved_folder" \
					'FALSE' 		"List_folder_Contents" )
}
comands()
{
	options
	if [ ${file} = 'View_saved_folder' ]; then
		ver
	elif [ ${file} = 'Slideshow_saved_folder' ]; then
		slide
	elif [ ${file} = 'Launch_of_saved_folder' ]; then
		lanzar
	elif [ ${file} = 'Xml_saved_folder' ]; then
		xmls
	elif [ ${file} = 'List_folder_Contents' ]; then
		listar
	else
		echo "Error en selección."
		exit 1
	fi
}
dialogo()
{

	file=$( zenity --list --radiolist --width="240" --height="190" --title="Folders saved" --text="Cick the action" \
					--column='(   *   )' --column='Option'  \
					'FALSE' 		"Save_folder" \
					'TRUE' 		"Use_saved_folder" \
					'FALSE' 		"Remove_from_folders" )
}
comando()
{
	dialogo
	if [ ${file} = 'Save_folder' ]; then
		save
	elif [ ${file} = 'Use_saved_folder' ]; then
		comands
	elif [ ${file} = 'Remove_from_folders' ]; then
		delete
	else
		echo "Error en selección."
		exit 1
	fi
}

comando

exit 0
