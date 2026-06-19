#!/bin/bash
#----------------------------------------------------------------------#
# Eres libre de modificarlo y redistribuirlo			       #
# por Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart #
#----------------------------------------------------------------------#

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

day()
{
age=$(zenity --calendar --text="Pictures of this date")
case $? in
         0)
		cat ~/.wallpaper_manager/tags/datos_fechados/historial_fechado | grep -n "$age" | cut -d':' -f1 > /tmp/temporal-line-numbers
sed -i '/^$/d' /tmp/temporal-line-numbers
cat /tmp/temporal-line-numbers | while read line ; do linea=$(echo $line); sed ''$linea'!d' ~/.wallpaper_manager/tags/datos_fechados/historial_fechado | cat >> /tmp/temporal-line-numbers1; done
comands
exit;;
         1)
                exit 1;;
        -1)
                echo "Ha ocurrido un error inesperado.";;
esac
}

yea()
{
age=$(zenity --calendar --text="Pictures of this date" | cut -c 7-8)
case $? in
         0)
		cat ~/.wallpaper_manager/tags/datos_fechados/historial_fechado | cut -c 7-8 | grep -n "$age" | cut -d':' -f1 > /tmp/temporal-line-numbers
sed -i '/^$/d' /tmp/temporal-line-numbers
cat /tmp/temporal-line-numbers | while read line ; do linea=$(echo $line); sed ''$linea'!d' ~/.wallpaper_manager/tags/datos_fechados/historial_fechado | cat >> /tmp/temporal-line-numbers1; done
comands
exit;;
         1)
                exit 1;;
        -1)
                echo "Ha ocurrido un error inesperado.";;
esac
}
mon()
{
age=$(zenity --calendar --text="Pictures of this date"| cut -c 4-8)
case $? in
         0)
		cat ~/.wallpaper_manager/tags/datos_fechados/historial_fechado | cut -c 4-8 | grep -n "$age" | cut -d':' -f1 > /tmp/temporal-line-numbers
sed -i '/^$/d' /tmp/temporal-line-numbers
cat /tmp/temporal-line-numbers | while read line ; do linea=$(echo $line); sed ''$linea'!d' ~/.wallpaper_manager/tags/datos_fechados/historial_fechado | cat >> /tmp/temporal-line-numbers1; done
comands
exit;;
         1)
                exit 1;;
        -1)
                echo "Ha ocurrido un error inesperado.";;
esac
}
ver()
{
archivos=$(cat /tmp/temporal-line-numbers1 | cut --output-delimiter='\t' -f2 | awk '!array_temp[$0]++' )
echo "$archivos" > /tmp/temporal-line-numbers
cat  /tmp/temporal-line-numbers | awk '!array_temp[$0]++' > /tmp/buenas-imagenes
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done <  /tmp/temporal-line-numbers
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Cantidad de imágenes $total_files"
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
rm /tmp/temporal-line-numbers
rm /tmp/temporal-line-numbers1
rm /tmp/buenas-imagenes
rm /tmp/buenas-imagenes1
rm /tmp/script_viewer
exit
fi
	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
slide()
{
archivos=$(cat /tmp/temporal-line-numbers1 | cut --output-delimiter='\t' -f2 | awk '!array_temp[$0]++' )
echo "$archivos" > /tmp/temporal-line-numbers
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done <  /tmp/temporal-line-numbers
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
rm /tmp/temporal-line-numbers
rm /tmp/temporal-line-numbers1
rm /tmp/buenas-imagenes
rm /tmp/buenas-imagenes1
rm /tmp/script_viewer
exit
fi
	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
listar()
{

archivos=$(cat /tmp/temporal-line-numbers1 | cut --output-delimiter='\t' -f2 | awk '!array_temp[$0]++' )
if file=$(echo "$archivos" | zenity --list --width="850" --height="515" --text="Pictures of this date; /$age/" --title "Wallpaper" --column "Backgrounds history"); then

	if [ -f "$file" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$file"
rm /tmp/temporal-line-numbers
rm /tmp/temporal-line-numbers1
fi
fi
exit 1
	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
line=$(echo $file | grep "$1")

	if [ "$line" != "" ]; then

if zenity --title "Remove from the list" --question --text "Do you want to Remove the current path from history?"
then
sed -i 's|'"$file"'||' ~/.wallpaper_manager/tags/datos_fechados/historial_fechado
sed -i '/^$/d' ~/.wallpaper_manager/tags/datos_fechados/historial_fechado
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the history"
rm /tmp/temporal-line-numbers
rm /tmp/temporal-line-numbers1
fi
fi
else
exit
fi
}
xmls()
{
archivos=$(cat /tmp/temporal-line-numbers1 | cut --output-delimiter='\t' -f2 | awk '!array_temp[$0]++' )
echo "$archivos" > /tmp/temporal-line-numbers
cat /tmp/temporal-line-numbers | sed '/./!d' | shuf > /tmp/buenas-imagenes2
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo "$LINE" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < /tmp/buenas-imagenes2
tail -n +2 < /tmp/buenas-imagenes1 > /tmp/buenas-imagenes
first=$(head -n1 /tmp/buenas-imagenes1)
DEBUG=y
LINES=$(wc -l < "$first")

if [ "$LINES" != "" ]; then

TIME=$(zenity --scale --title "$(gettext "Time configuration")" --text \
"$(gettext "Length of wallpaper (minutes)")" --min-value=1 --max-value=120 --value=5)
[ $? -ne 0 ] 
echo ${DEBUG:+"The time was set$TIME minutes."}

TIME=$(($TIME*60))

ANIMATION=$(zenity --scale --title "$(gettext "Time configuration")" --text \
"$(gettext "Length of animation (seconds)")" --min-value=1 --max-value=10 --value=5)
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

zenity --question --text "$(gettext "Do you want to put the .xml file as background?")"
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
rm /tmp/temporal-line-numbers
rm /tmp/temporal-line-numbers1
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./buenas-imagenes"
     exit
fi
}
options()
{

	file=$( zenity --list --radiolist --width="295" --height="215" --title="Dated history" --text="Choose an action" \
					--column='Pick' --column='Option'  \
					'FALSE' 		"View_dated_history" \
					'TRUE' 		"Slideshow_dated_history" \
					'FALSE' 		"List_dated_history" \
					'FALSE' 		"Xml_dated_history" )
}
comands()
{
	options
	if [ ${file} = 'View_dated_history' ]; then
		ver
	elif [ ${file} = 'Slideshow_dated_history' ]; then
		slide
	elif [ ${file} = 'List_dated_history' ]; then
		listar
	elif [ ${file} = 'Xml_dated_history' ]; then
		xmls
	else
		echo "No selection."
		exit 1
	fi
}

dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="190" --title="Dated history" --text="Choose the time range" \
					--column='Pick' --column='Option'  \
					'FALSE' 		"Of_a_day" \
					'TRUE' 		"Of_a_month" \
					'FALSE' 		"Of_a_year" )
}
comando()
{
	dialogo
	if [ ${file} = 'Of_a_day' ]; then
		day
	elif [ ${file} = 'Of_a_month' ]; then
		mon
	elif [ ${file} = 'Of_a_year' ]; then
		yea
	else
		echo "No selection."
		exit 1
	fi
}

comando

exit 0
