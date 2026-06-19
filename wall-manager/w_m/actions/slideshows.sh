#!/bin/bash
cat()
{
sh /usr/share/wallpaper_manager/w_m/categ_actions/slide_tags.sh
}
fav()
{
sh /usr/share/wallpaper_manager/w_m/actions/slide_fav.sh
}
plac()
{
sh /usr/share/wallpaper_manager/w_m/actions/slide_current.sh
}
fold()
{
sh /usr/share/wallpaper_manager/w_m/actions/slide_folder.sh
}
dialogo()
{

	file=$( zenity --list --radiolist --width="190" --height="215" --title="Categories of Slideshows" \
					--column='Pick' --column='Option'  \
					'FALSE' 		"Slideshows_of_categories" \
					'FALSE' 		"Slideshows_of_favorites" \
					'TRUE' 		"Slideshows_of_current_place" \
					'FALSE' 		"Open_a_Slideshows_folder" )
}
comando()
{
	dialogo
	if [ ${file} = 'Slideshows_of_categories' ]; then
		cat
	elif [ ${file} = 'Slideshows_of_favorites' ]; then
		fav
	elif [ ${file} = 'Slideshows_of_current_place' ]; then
		plac
	elif [ ${file} = 'Open_a_Slideshows_folder' ]; then
		fold
	else
		echo "Error en selección."
		exit 1
	fi
}
comando
exit 0
