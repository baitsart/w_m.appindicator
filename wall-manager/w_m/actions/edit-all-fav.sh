#!/bin/bash
animales()
{
gedit ~/.wallpaper_manager/tags/imagenes_animales
}
arte()
{
gedit ~/.wallpaper_manager/tags/imagenes_arte
}
autos()
{
gedit ~/.wallpaper_manager/tags/imagenes_autos
}
colores()
{
gedit ~/.wallpaper_manager/tags/imagenes_colores
}
crops()
{
gedit ~/.wallpaper_manager/tags/imagenes_crops
}
digitales()
{
gedit ~/.wallpaper_manager/tags/imagenes_digitales
}
edificios()
{
gedit ~/.wallpaper_manager/tags/imagenes_edificios
}
espacio()
{
gedit ~/.wallpaper_manager/tags/imagenes_espacio
}
films()
{
gedit ~/.wallpaper_manager/tags/imagenes_films
}
misticos()
{
gedit ~/.wallpaper_manager/tags/imagenes_misticas
}
mus()
{
gedit ~/.wallpaper_manager/tags/imagenes_musica
}
ocean()
{
gedit ~/.wallpaper_manager/tags/imagenes_oceano
}
paisajes()
{
gedit ~/.wallpaper_manager/tags/imagenes_paisajes
}
plantas()
{
gedit ~/.wallpaper_manager/tags/imagenes_plantas
}
rios()
{
gedit ~/.wallpaper_manager/tags/imagenes_rios
}
soft()
{
gedit ~/.wallpaper_manager/tags/imagenes_software
}
tecno()
{
gedit ~/.wallpaper_manager/tags/imagenes_tecnologia
}
histo()
{
gedit ~/.wallpaper_manager/historial
}
favorit()
{
gedit ~/.wallpaper_manager/buenas_imagenes
}
dialoga()
{

	file=$( zenity --list --radiolist --width="150" --height="560" --title="Categorías de Imágenes" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Editar_animales" \
					'FALSE' 		"Edit_of_art" \
					'FALSE' 		"Edit_of_cars" \
					'FALSE' 		"Edit_of_colors" \
					'FALSE' 		"Edit_of_crops_circles" \
					'FALSE' 		"Edit_of_digital_art" \
					'FALSE' 		"Edit_of_buildings" \
					'FALSE' 		"Edit_of_space" \
					'FALSE' 		"Edit_of_movies" \
					'FALSE' 		"Edit_of_mystical" \
					'FALSE' 		"Edit_of_music" \
					'FALSE' 		"Edit_of_ocean" \
					'FALSE' 		"Edit_of_scenery" \
					'FALSE' 		"Edit_of_vegetation" \
					'FALSE' 		"Edit_of_rivers_and_lakes" \
					'FALSE' 		"Edit_of_software_images" \
					'FALSE' 		"Edit_of_technology" \
					'FALSE' 		"Edit_history" \
					'FALSE' 		"Edit_favorites" )
}
comand()
{
	dialoga
	if [ ${file} = 'Editar_animales' ]; then
		animales
	elif [ ${file} = 'Edit_of_art' ]; then
		arte
	elif [ ${file} = 'Edit_of_cars' ]; then
		autos
	elif [ ${file} = 'Edit_of_colors' ]; then
		colores
	elif [ ${file} = 'Edit_of_crops_circles' ]; then
		crops
	elif [ ${file} = 'Edit_of_digital_art' ]; then
		digitales
	elif [ ${file} = 'Edit_of_buildings' ]; then
		edificios
	elif [ ${file} = 'Edit_of_space' ]; then
		espacio
	elif [ ${file} = 'Edit_of_movies' ]; then
		films
	elif [ ${file} = 'Edit_of_mystical' ]; then
		misticos
	elif [ ${file} = 'Edit_of_music' ]; then
		mus
	elif [ ${file} = 'Edit_of_ocean' ]; then
		ocean
	elif [ ${file} = 'Edit_of_scenery' ]; then
		paisajes
	elif [ ${file} = 'Edit_of_vegetation' ]; then
		plantas
	elif [ ${file} = 'Edit_of_rivers_and_lakes' ]; then
		rios
	elif [ ${file} = 'Edit_of_software_images' ]; then
		soft
	elif [ ${file} = 'Edit_of_technology' ]; then
		tecno
	elif [ ${file} = 'Edit_history' ]; then
		histo
	elif [ ${file} = 'Edit_favorites' ]; then
		favorit
	else
		echo "No selection."
		exit 1
	fi
}
comand
exit 0
