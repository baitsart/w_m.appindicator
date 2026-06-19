#!/bin/sh
lanzar()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/lanzar-tags.sh
}
guarda()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guardar-en-tags.sh
}
elimina()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/elimina_de_tags.sh
}
editar()
{
sh /usr/bin/wallpaper_manager/w_m/actions/edit-all-fav.sh
}
data()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/ver_por_fecha.sh
}
poner()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/listar_tags.sh
}
ver()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/ver_tags.sh
}
xmls()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/ver_xml.sh
}
tags()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/opc_mis_tags.sh
}
dialog()
{

	file=$( zenity --list --radiolist --width="150" --height="350" --title="wallpaper manager" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Save_on_categories" \
					'FALSE' 		"Put_of_categories" \
					'FALSE' 		"List_categories" \
					'FALSE' 		"Categories_viewer" \
					'FALSE' 		"Xml_of_categories" \
					'FALSE' 		"Remove_of_categories" \
					'FALSE' 		"Edit_of_categories" \
					'FALSE' 		"By_date_categories" \
					'FALSE' 		"My_personal_tags" )
}
action()
{
	dialog
	if [ ${file} = 'Save_on_categories' ]; then
		guarda
	elif [ ${file} = 'Put_of_categories' ]; then
		lanzar
	elif [ ${file} = 'List_categories' ]; then
		poner
	elif [ ${file} = 'Categories_viewer' ]; then
		ver
	elif [ ${file} = 'Xml_of_categories' ]; then
		xmls
	elif [ ${file} = 'Remove_of_categories' ]; then
		elimina
	elif [ ${file} = 'Edit_of_categories' ]; then
		editar
	elif [ ${file} = 'By_date_categories' ]; then
		data
	elif [ ${file} = 'My_personal_tags' ]; then
		tags
	else
		echo "No selection."
		exit 1
	fi
}

action
exit 0
