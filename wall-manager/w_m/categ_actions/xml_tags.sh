#!/bin/bash

IMG_FOLDER=$(xdg-user-dir PICTURES)

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
else
    mode=""
fi

sed -i '/./!d' /tmp/buenas-imagenes
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo "$LINE" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < /tmp/buenas-imagenes
tail -n +2 < /tmp/buenas-imagenes1 > /tmp/buenas-imagenes
first=$(head -n1 /tmp/buenas-imagenes1)
DEBUG=y
LINES=$(wc -l < "$first")

if [ "$LINES" != "" ]; then

TIME=$(zenity --scale --title "$(gettext "Configuration del tiempo")" --text \
"$(gettext "Duración del wallpaper (minutos)")" --min-value=1 --max-value=120 --value=5)
[ $? -ne 0 ] 
echo ${DEBUG:+"La duración se configuró en $TIME minutos."}

TIME=$(($TIME*60))

ANIMATION=$(zenity --scale --title "$(gettext "Configuration del tiempo")" --text \
"$(gettext "Duración de la transición (segundos)")" --min-value=1 --max-value=10 --value=5)
[ $? -ne 0 ] 
echo ${DEBUG:+"La transición es de $ANIMATION segundos."}

until [ -n "$NAMEXML" ]; do
	NAMEXML=$(zenity --entry --entry-text "background" --text \
"$(gettext "Nombre del archivo .xml background")")
	[ $? -ne 0 ] 
	[ -z "$NAMEXML" ] && echo ${DEBUG:+"Nombre incorrecto, prueba otra vez."}
done

BACK="$NAMEXML.xml"
echo ${DEBUG:+"El nombre del archivo xml es $BACK."}
echo ${DEBUG:+"Creando el archivo xml."}

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

zenity --question --text "$(gettext "¿Quieres poner el archivo .xml como background?")"
OPTION=$?
mv $BACK $IMG_FOLDER
image="$IMG_FOLDER"/"$BACK"
if [ $OPTION -eq 0 ]; then
	echo ${DEBUG:+"Poner el archivo $BACK como background."}
	gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"
fi

echo ${DEBUG:+"Borrando archivos temp y finalizando la ejecución ."}
rm /tmp/buenas-imagenes
rm /tmp/buenas-imagenes1
rm /tmp/xml_backs
rm /tmp/xml_back
rm /tmp/xml_back1
rm /tmp/xml_back2
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
