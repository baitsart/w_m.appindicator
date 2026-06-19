#!/bin/bash
IMG_FOLDER=$(xdg-user-dir PICTURES)


if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

cat ~/.wallpaper_manager/buenas_imagenes | sed '/./!d' | shuf > /tmp/buenas-imagenes2
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
mv $BACK "$IMG_FOLDER"/
image="$IMG_FOLDER"/$BACK"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./buenas-imagenes"
     exit
fi
fi
