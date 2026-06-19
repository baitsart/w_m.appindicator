#!/bin/bash
elegir()
{
fila=$(gsettings get org.gnome.desktop.background primary-color)
coolor=$(echo "$fila" | sed 's/'"'"'//g')
COLOR=`zenity --color-selection --show-palette --color="$coolor"`

case $? in
         0)
		gsettings set org.gnome.desktop.background primary-color "$COLOR"
		comando;;
         1)
                echo "No ha seleccionado ningún color.";;
        -1)
                echo "Ha ocurrido un error inesperado.";;
esac

}
guarda()
{
coolor=$(gsettings get org.gnome.desktop.background primary-color)

if file=$(zenity --entry --title="Save color as..." --text="Write the color name")
then
var=$(echo "'"$file"'")
existing=$(cat | grep "$var" ~/.wallpaper_manager/colors-list )
	if [ "$existing" != "" ]; then
zenity --warning --title="w_m" --text="This name was used:  "$var"\nPlease change the name"
     exit 0
	fi
	if [ $? -eq 0 ]; then
texto=$(echo "$coolor" | sed 's/'"'"'//g')
echo ""$texto"	~$var" >> ~/.wallpaper_manager/colors-list
sed -i '/^$/d' ~/.wallpaper_manager/colors-list
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Color save in the colors list"

exit
fi
fi
}
listar()
{
if CHOICE=$(cat ~/.wallpaper_manager/colors-list | zenity --list --width="280" --height="515" --text "Pick a color" --title "Wallpaper" --column "List of colors")
then
color=$(echo "$CHOICE" | awk '{print $1}')
gsettings set org.gnome.desktop.background primary-color "$color"
	else
     exit
fi
}
edit()
{
gedit ~/.wallpaper_manager/colors-list
}
second()
{
guardasec()
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
elegirsec()
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
solido()
{
gsettings set org.gnome.desktop.background color-shading-type 'solid'
comando
}
dialogos()
{

	file=$( zenity --list --radiolist --width="150" --height="230" --title="wallpaper manager" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"vertical" \
					'FALSE' 		"horizontal" \
					'FALSE' 		"solido" \
					'FALSE' 		"Pic_secondary" \
					'FALSE' 		"Save_secondary" )
}
comandos()
{
	dialogos
	if [ ${file} = 'vertical' ]; then
		vertical
	elif [ ${file} = 'horizontal' ]; then
		horizontal
	elif [ ${file} = 'solido' ]; then
		solido
	elif [ ${file} = 'Pic_secondary' ]; then
		elegirsec
	elif [ ${file} = 'Save_secondary' ]; then
		guardasec
	else
		echo "No selection."
		exit 1
	fi
}

comandos

exit 0
}
dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="235" --title="wallpaper manager" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Pic_color" \
					'FALSE' 		"Save_in_color" \
					'FALSE' 		"List_colors" \
					'FALSE' 		"Edit_list" \
					'FALSE' 		"Secondary" )
}
comando()
{
	dialogo
	if [ ${file} = 'Pic_color' ]; then
		elegir
	elif [ ${file} = 'Save_in_color' ]; then
		guarda
	elif [ ${file} = 'List_colors' ]; then
		listar
	elif [ ${file} = 'Edit_list' ]; then
		edit
	elif [ ${file} = 'Secondary' ]; then
		second
	else
		echo "No selection."
		exit 1
	fi
}

comando

exit 0

