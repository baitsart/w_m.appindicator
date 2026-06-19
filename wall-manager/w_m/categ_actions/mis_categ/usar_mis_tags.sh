#!/bin/sh
lanzar()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh
}
guarda()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh
}
elimina()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_de_tags.sh
}
poner()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh
}
ver()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh
}
slide()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh
}
xmls()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh
}
dialogo()
{

	file=$( zenity --list --radiolist --width="130" --height="290" --title="wallpaper manager" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Save_on_categories" \
					'FALSE' 		"Put_of_categories" \
					'FALSE' 		"List_categories" \
					'FALSE' 		"Categories_viewer" \
					'FALSE' 		"Slideshow_categories" \
					'FALSE' 		"Xml_of_categories" \
					'FALSE' 		"Remove_of_categories" )
}
comando()
{
	dialogo
	if [ ${file} = 'Save_on_categories' ]; then
		guarda
	elif [ ${file} = 'Put_of_categories' ]; then
		lanzar
	elif [ ${file} = 'List_categories' ]; then
		poner
	elif [ ${file} = 'Categories_viewer' ]; then
		ver
	elif [ ${file} = 'Slideshow_categories' ]; then
		slide
	elif [ ${file} = 'Xml_of_categories' ]; then
		xmls
	elif [ ${file} = 'Remove_of_categories' ]; then
		elimina
	else
		echo "Error en selección."
		exit 1
	fi
}
exist=$(cat /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/"File saved in categories" | tr -d '\n' | grep "$1")
	if [ "$exist" != "" ]; then
comando
exit 0
fi
	if [ $? -eq 0 ]; then
notify-send "You have not entered any category"
exit 0
fi
fi
