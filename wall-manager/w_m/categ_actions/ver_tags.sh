#!/bin/sh
animales()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_animal.sh
}
arte()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_arte.sh
}
autos()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_auto.sh
}
colores()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_color.sh
}
crops()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_crops.sh
}
digitales()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_digitales.sh
}
edificios()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_edific.sh
}
espacio()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_espace.sh
}
films()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_film.sh
}
misticas()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_mistic.sh
}
mus()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_music.sh
}
ocean()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_oceano.sh
}
paisajes()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_paisaje.sh
}
plantas()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_plant.sh
}
soft()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_soft.sh
}
rios()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_rios.sh
}
tecno()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/view-favorits_tecno.sh
}

dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="515" --title="Categorías de Imágenes" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"View_animals" \
					'FALSE' 		"View_cars" \
					'FALSE' 		"View_art" \
					'FALSE' 		"View_colors" \
					'FALSE' 		"View_crops_circles" \
					'FALSE' 		"View_digital" \
					'FALSE' 		"View_buildings" \
					'FALSE' 		"View_space" \
					'FALSE' 		"View_movies" \
					'FALSE' 		"View_mystical" \
					'FALSE' 		"View_music" \
					'FALSE'			"View_ocean" \
					'FALSE' 		"View_scenery" \
					'FALSE' 		"View_vegetation" \
					'FALSE' 		"View_software_images" \
					'FALSE' 		"View_rivers_and_lakes" \
					'FALSE' 		"View_technology" )
}
comando()
{
	dialogo
	if [ ${file} = 'View_animals' ]; then
		animales
	elif [ ${file} = 'View_art' ]; then
		arte
	elif [ ${file} = 'View_cars' ]; then
		autos
	elif [ ${file} = 'View_colors' ]; then
		colores
	elif [ ${file} = 'View_crops_circles' ]; then
		crops
	elif [ ${file} = 'View_digital' ]; then
		digitales
	elif [ ${file} = 'View_buildings' ]; then
		edificios
	elif [ ${file} = 'View_space' ]; then
		espacio
	elif [ ${file} = 'View_movies' ]; then
		films
	elif [ ${file} = 'View_mystical' ]; then
		misticas
	elif [ ${file} = 'View_music' ]; then
		mus
	elif [ ${file} = 'View_ocean' ]; then
		ocean
	elif [ ${file} = 'View_scenery' ]; then
		paisajes
	elif [ ${file} = 'View_vegetation' ]; then
		plantas
	elif [ ${file} = 'View_rivers_and_lakes' ]; then
		rios
	elif [ ${file} = 'View_software_images' ]; then
		soft
	elif [ ${file} = 'View_technology' ]; then
		tecno
	else
		echo "No selection."
		exit 1
	fi
}

comando
exit 0
