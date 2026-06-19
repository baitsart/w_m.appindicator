#!/bin/sh
guarda()
{
sh /usr/share/wallpaper_manager/w_m/actions/guarda.sh
}
elimina()
{
sh /usr/share/wallpaper_manager/w_m/actions/elimina.sh
}
lanza()
{
sh /usr/share/wallpaper_manager/w_m/actions/image-buenas.sh
}
poner()
{
sh /usr/share/wallpaper_manager/w_m/actions/listar.sh
}
ver()
{
sh /usr/share/wallpaper_manager/w_m/actions/view-favorits.sh
}
xmls()
{
sh /usr/share/wallpaper_manager/w_m/actions/xml_buenos_backgrounds.sh
}
dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="260" --title="wallpaper manager" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Save_in_favorites" \
					'FALSE' 		"Put_a_favorites" \
					'FALSE' 		"List_favorites" \
					'FALSE' 		"View_of_favorites" \
					'FALSE' 		"Xml_of_favorites" \
					'FALSE' 		"Remove_of_favorites" )
}
comando()
{
	dialogo
	if [ ${file} = 'Save_in_favorites' ]; then
		guarda
	elif [ ${file} = 'Put_a_favorites' ]; then
		lanza
	elif [ ${file} = 'List_favorites' ]; then
		poner
	elif [ ${file} = 'View_of_favorites' ]; then
		ver
	elif [ ${file} = 'Xml_of_favorites' ]; then
		xmls
	elif [ ${file} = 'Remove_of_favorites' ]; then
		elimina
	else
		echo "No selection."
		exit 1
	fi
}

comando
exit 0
