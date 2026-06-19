#!/bin/bash
guarda()
{
coolor=$(gsettings get org.gnome.desktop.background secondary-color)

if file=$(zenity --entry --title="Save color as..." --text="Write the color name")
then
var=$(echo "'"$file"'")
existing=$(cat | grep "$var" ~/.wallpaper_manager/colors-list )
	if [ "$existing" != "" ]; then
zenity --warning --title="w_m" --text="This name was used:  "$var"\nPlease change the name"
comando
     exit 0
	fi
	if [ $? -eq 0 ]; then
texto=$(echo "$coolor" | sed 's/'"'"'//g')
echo ""$texto"	~$var" >> ~/.wallpaper_manager/colors-list
sed -i '/^$/d' ~/.wallpaper_manager/colors-list
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Color save in the colors list"
comando
exit
fi
fi
}
elegir()
{
fila=$(gsettings get org.gnome.desktop.background secondary-color)
coolor=$(echo "$fila" | sed 's/'"'"'//g')
COLOR=`zenity --color-selection --show-palette --color="$coolor"`

case $? in
         0)
		gsettings set org.gnome.desktop.background secondary-color "$COLOR"
		comando;;
         1)
                echo "No ha seleccionado ningún color.";;
        -1)
                echo "Ha ocurrido un error inesperado.";;
esac

}
vertical()
{
gsettings set org.gnome.desktop.background color-shading-type 'vertical'
comando
}
horizontal()
{
gsettings set org.gnome.desktop.background color-shading-type 'horizontal'
comando
}
solid()
{
gsettings set org.gnome.desktop.background color-shading-type 'solid'
comando
}
dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="230" --title="wallpaper manager" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"vertical" \
					'FALSE' 		"horizontal" \
					'FALSE' 		"solid" \
					'FALSE' 		"Pic_secondary" \
					'FALSE' 		"Save_secondary" )
}
comando()
{
	dialogo
	if [ ${file} = 'vertical' ]; then
		vertical
	elif [ ${file} = 'horizontal' ]; then
		horizontal
	elif [ ${file} = 'solid' ]; then
		solid
	elif [ ${file} = 'Pic_secondary' ]; then
		elegir
	elif [ ${file} = 'Save_secondary' ]; then
		guarda
	else
		echo "No selection."
		exit 1
	fi
}

comando

exit 0
