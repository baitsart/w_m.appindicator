#!/bin/sh
animales()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_animales.sh
}
arte()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_arte.sh
}
autos()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_autos.sh
}
colores()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_colores.sh
}
crops()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_crops.sh
}
digitales()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_digitales.sh
}
edificios()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_edificios.sh
}
espacio()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_espacio.sh
}
films()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_films.sh
}
misticos()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_misticas.sh
}
mus()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_musica.sh
}
ocean()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_oceano.sh
}
paisajes()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_paisajes.sh
}
plantas()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_plantas.sh
}
rios()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_rios.sh
}
soft()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_soft.sh
}
tecno()
{
sh /usr/bin/wallpaper_manager/w_m/categ_actions/guarda_tecnologi.sh
}

dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="515" --title="Categorías de Imágenes" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Save_on_animals" \
					'FALSE' 		"Save_on_art" \
					'FALSE' 		"Save_on_cars" \
					'FALSE' 		"Save_on_colors" \
					'FALSE' 		"Save_on_crops_circles" \
					'FALSE' 		"Save_on_digital" \
					'FALSE' 		"Save_on_buildings" \
					'FALSE' 		"Save_on_space" \
					'FALSE' 		"Save_on_movies" \
					'FALSE' 		"Save_on_mystical" \
					'FALSE' 		"Save_on_music" \
					'FALSE' 		"Save_on_ocean" \
					'FALSE' 		"Save_on_scenery" \
					'FALSE' 		"Save_on_vegetation" \
					'FALSE' 		"Save_on_rivers_and_lakes" \
					'FALSE' 		"Save_on_software_images" \
					'FALSE' 		"Save_on_technology" )
}
comando()
{
	dialogo
	if [ ${file} = 'Save_on_animals' ]; then
		animales
	elif [ ${file} = 'Save_on_art' ]; then
		arte
	elif [ ${file} = 'Save_on_cars' ]; then
		autos
	elif [ ${file} = 'Save_on_colors' ]; then
		colores
	elif [ ${file} = 'Save_on_crops_circles' ]; then
		crops
	elif [ ${file} = 'Save_on_digital' ]; then
		digitales
	elif [ ${file} = 'Save_on_buildings' ]; then
		edificios
	elif [ ${file} = 'Save_on_space' ]; then
		espacio
	elif [ ${file} = 'Save_on_movies' ]; then
		films
	elif [ ${file} = 'Save_on_mystical' ]; then
		misticos
	elif [ ${file} = 'Save_on_music' ]; then
		mus
	elif [ ${file} = 'Save_on_ocean' ]; then
		ocean
	elif [ ${file} = 'Save_on_scenery' ]; then
		paisajes
	elif [ ${file} = 'Save_on_vegetation' ]; then
		plantas
	elif [ ${file} = 'Save_on_rivers_and_lakes' ]; then
		rios
	elif [ ${file} = 'Save_on_software_images' ]; then
		soft
	elif [ ${file} = 'Save_on_technology' ]; then
		tecno
	else
		echo "No selection."
		exit 1
	fi
}

comando
exit 0
