#!/bin/sh
crear()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/crear-tags.sh
}
usar()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/usar_mis_tags.sh
}
borrar()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/borrar_tags.sh
}

dialogo()
{

	file=$( zenity --list --radiolist --width="145" --height="195" --title="my categories" --text="Choose an action" \
					--column='Pick' --column='Option'  \
					'FALSE' 		"Create_a_new" \
					'TRUE' 		"My_category_use" \
					'FALSE' 		"Remove_one" )
}
comando()
{
	dialogo
	if [ ${file} = 'Create_a_new' ]; then
		crear
	elif [ ${file} = 'My_category_use' ]; then
		usar
	elif [ ${file} = 'Remove_one' ]; then
		borrar
	else
		echo "Error en selección."
		exit 1
	fi
}

comando
exit 0
