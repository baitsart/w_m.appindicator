#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

inver()
{
chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode"| sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

archivo=$(echo "$chi" | sed 's|/|\n|g'| tail -n1  | sed 's|\]||g;s|\[||g')


folder=$(echo "$chi" | sed 's|/|\n|g' | sed '$d' | tr '\n' '/' )
file=$(echo "$archivo" | sed 's|.jpg||g;s|.JPG||g;s|.jpeg||g;s|.JPEG||g;s|.gif||g;s|.GIF||g;s|.png||g;s|.PNG||g;s|.svg||g;s|.SVG||g;s|.BMP||g;s|.bmp||')

convert -negate "$chi" "$folder/$file-complementarios.jpg"
gsettings set org.gnome.desktop.background picture-uri"$mode" file://"$folder/$file-complementarios.jpg"
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
}
nocolor()
{
chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

archivo=$(echo "$chi" | sed 's|/|\n|g'| tail -n1  | sed 's|\]||g;s|\[||g')


folder=$(echo "$chi" | sed 's|/|\n|g' | sed '$d' | tr '\n' '/' )
file=$(echo "$archivo" | sed 's|.jpg||g;s|.JPG||g;s|.jpeg||g;s|.JPEG||g;s|.gif||g;s|.GIF||g;s|.png||g;s|.PNG||g;s|.svg||g;s|.SVG||g;s|.BMP||g;s|.bmp||')

convert -monochrome "$chi" "$folder/$file-blanco-y-negro.jpg"
gsettings set org.gnome.desktop.background picture-uri"$mode" file://"$folder/$file-blanco-y-negro.jpg"
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
}
text()
{
IMAGEN=$(gsettings get org.gnome.desktop.background picture-uri"$mode"| sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')
cp "$IMAGEN" /tmp/picture_temporal.jpg
DIMENSIONES=`identify -format "%wx%h" /tmp/picture_temporal.jpg`
x=`echo $DIMENSIONES | awk -F"x" '{print $1}'`
y=`echo $DIMENSIONES | awk -F"x" '{print $2}'`
xsel >> /tmp/texto_pegado_temp
TEXT=$(cat /tmp/texto_pegado_temp)
rm /tmp/texto_pegado_temp
TEXTO_SELECT=$(zenity --entry --width="470" --height="25" --entry-text "$TEXT" --text "Text to write in the picture")
	if [ "$TEXTO_SELECT" != "" ]; then
CARACTERES=$(zenity --scale --title "Characters per line" --text "Number of characters per line" --min-value=1 --max-value=150 --value=35)
TEXTO=$(echo $TEXTO_SELECT | xargs -s $CARACTERES)
COLOR=$(echo "RED
YELLOW
BLUE
GREEN
VIOLET
ORANGE
MAGENTA
PINK
SKY-BLUE
BROWN
WHITE
BLACK
GRAY"| zenity --list --width="250" --height="420" --text "Select text color" --title "Write in wallpaper" --column "Select text color"| sed 's|RED|red|g;s|YELLOW|yellow|g;s|SKY-BLUE|cyan|g;s|BLUE|blue|g;s|GREEN|green|g;s|MAGENTA|magenta|g;s|ORANGE|orange|g;s|VIOLET|indigo|g;s|PINK|pink|g;s|BROWN|SaddleBrown|g;s|WHITE|white|g;s|BLACK|black|g;s|GRAY|grey|')
	if [ "$COLOR" != "" ]; then
BORDER_COLOR=$(echo "RED
YELLOW
BLUE
GREEN
VIOLET
ORANGE
MAGENTA
PINK
SKY-BLUE
BROWN
WHITE
BLACK
GRAY"| zenity --list --width="250" --height="420" --text "Select the border text color" --title "Write in wallpaper" --column "Select text color"| sed 's|RED|red|g;s|YELLOW|yellow|g;s|SKY-BLUE|cyan|g;s|BLUE|blue|g;s|GREEN|green|g;s|MAGENTA|magenta|g;s|ORANGE|orange|g;s|VIOLET|indigo|g;s|PINK|pink|g;s|BROWN|SaddleBrown|g;s|WHITE|white|g;s|BLACK|black|g;s|GRAY|grey|')
	if [ "$BORDER_COLOR" != "" ]; then
TEXT_SIZE=$(zenity --scale --title "Font size" --text "Select the font size" --min-value=1 --max-value=150 --value=32)
	if [ "$TEXT_SIZE" != "" ]; then
POSITION=$(echo "TOP CENTER
ABOVE LEFT
ABOVE RIGHT
FOCUSED
RIGHT
LEFT
DOWN
DOWN LEFT
DOWN RIGHT"| zenity --list --width="250" --height="325" --text "The text position el la imagen" --title "The text position" --column "The text position"| sed 's|TOP CENTER|North|g;s|ABOVE LEFT|NorthWest|g;s|ABOVE RIGHT|NorthEast|g;s|DOWN LEFT|SouthWest|g;s|DOWN RIGHT|SouthEast|g;s|FOCUSED|Center|g;s|RIGHT|East|g;s|LEFT|West|g;s|DOWN|South|')
	if [ "$POSITION" != "" ]; then
#For select the font each time, uncomment the next # , and change in the convert command (Bookman-DemiItalic) to ("/usr/share/fonts/$FONT")
#FONT=$(ls /usr/share/fonts/*/*/* | grep ".ttf" | sed 's|/usr/share/fonts/||g' | zenity --list --width="65" --height="515" --text "Selecciona una fuente" --title "Fuentes" --column "Fuentes")
echo $FONT

convert -size $DIMENSIONES canvas:none -gravity $POSITION -font Bookman-DemiItalic -pointsize $TEXT_SIZE -draw "text 25,60 '$TEXTO'" -channel RGBA -blur 0x6 -fill $COLOR -stroke $BORDER_COLOR -draw "text 20,55 '$TEXTO'" /tmp/temp_text_image.png

composite /tmp/temp_text_image.png "$IMAGEN" "${IMAGEN}_texto.jpg"
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"${IMAGEN}_texto.jpg"
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
rm /tmp/temp_text_image.png
rm /tmp/picture_temporal.jpg
fi
exit 0
	fi

	if [ $? -eq 0 ]; then
exit
fi
fi
fi
fi
}
cloc()
{
chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

archivo=$(echo "$chi" | sed 's|/|\n|g'| tail -n1  | sed 's|\]||g;s|\[||g')


folder=$(echo "$chi" | sed 's|/|\n|g' | sed '$d' | tr '\n' '/' )
file=$(echo "$archivo" | sed 's|.jpg||g;s|.JPG||g;s|.jpeg||g;s|.JPEG||g;s|.gif||g;s|.GIF||g;s|.png||g;s|.PNG||g;s|.svg||g;s|.SVG||g;s|.BMP||g;s|.bmp||')

convert -rotate 90 "$chi" "$folder/$file-rotated-clock.jpg"
gsettings set org.gnome.desktop.background picture-uri"$mode" file://"$folder/$file-rotated-clock.jpg"
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
}
anti_cloc()
{
chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

archivo=$(echo "$chi" | sed 's|/|\n|g'| tail -n1  | sed 's|\]||g;s|\[||g')


folder=$(echo "$chi" | sed 's|/|\n|g' | sed '$d' | tr '\n' '/' )
file=$(echo "$archivo" | sed 's|.jpg||g;s|.JPG||g;s|.jpeg||g;s|.JPEG||g;s|.gif||g;s|.GIF||g;s|.png||g;s|.PNG||g;s|.svg||g;s|.SVG||g;s|.BMP||g;s|.bmp||')

convert -rotate -90 "$chi" "$folder/$file-rotated-anti-clock.jpg"
gsettings set org.gnome.desktop.background picture-uri"$mode" file://"$folder/$file-rotated-anti-clock.jpg"
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
}
rot_inver()
{
chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

archivo=$(echo "$chi" | sed 's|/|\n|g'| tail -n1  | sed 's|\]||g;s|\[||g')


folder=$(echo "$chi" | sed 's|/|\n|g' | sed '$d' | tr '\n' '/' )
file=$(echo "$archivo" | sed 's|.jpg||g;s|.JPG||g;s|.jpeg||g;s|.JPEG||g;s|.gif||g;s|.GIF||g;s|.png||g;s|.PNG||g;s|.svg||g;s|.SVG||g;s|.BMP||g;s|.bmp||')

convert -rotate 180 "$chi" "$folder/$file-rotated-invert.jpg"
gsettings set org.gnome.desktop.background picture-uri"$mode" file://"$folder/$file-rotated-invert.jpg"
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
}
#----------------------------------------------------------------------#
# Eres libre de modificarlo y redistribuirlo			       #
# por Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart #
#----------------------------------------------------------------------#
# Use imagemagick 						       #
# For more info visit:						       #	
# http://www.imagemagick.org/script/command-line-options.php           #
#----------------------------------------------------------------------#
dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="265" --title="wallpaper manager" \
					--column='Pick' --column='Opción'  \
					'FALSE' 		"Invert_colors" \
					'FALSE' 		"Black_and_white" \
					'FALSE' 		"Write_the_picture" \
					'FALSE' 		"Rotate_clock" \
					'FALSE' 		"Rotate_anti_clock" \
					'FALSE' 		"Rotate_invert" )
}
comando()
{
	dialogo
	if [ ${file} = 'Invert_colors' ]; then
		inver
	elif [ ${file} = 'Black_and_white' ]; then
		nocolor
	elif [ ${file} = 'Write_the_picture' ]; then
		text
	elif [ ${file} = 'Rotate_clock' ]; then
		cloc
	elif [ ${file} = 'Rotate_anti_clock' ]; then
		anti_cloc
	elif [ ${file} = 'Rotate_invert' ]; then
		rot_inver
	else
		echo "Error en selección."
		exit 1
	fi
}

comando

exit 0
