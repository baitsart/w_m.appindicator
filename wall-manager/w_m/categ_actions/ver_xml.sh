#!/bin/sh
animales()
{
cat ~/.wallpaper_manager/tags/imagenes_animales | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
arte()
{
cat ~/.wallpaper_manager/tags/imagenes_arte | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
autos()
{
cat ~/.wallpaper_manager/tags/imagenes_autos | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh  
}
colores()
{
cat ~/.wallpaper_manager/tags/imagenes_colores | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
crops()
{
cat ~/.wallpaper_manager/tags/imagenes_crops | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
digitales()
{
cat ~/.wallpaper_manager/tags/imagenes_digitales | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
edificios()
{
cat ~/.wallpaper_manager/tags/imagenes_edificios | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh  
}
espacio()
{
cat ~/.wallpaper_manager/tags/imagenes_espacio | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
films()
{
cat ~/.wallpaper_manager/tags/imagenes_films | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
misticas()
{
cat ~/.wallpaper_manager/tags/imagenes_misticas | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
mus()
{
cat ~/.wallpaper_manager/tags/imagenes_musica | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
ocean()
{
cat ~/.wallpaper_manager/tags/imagenes_oceano | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
paisajes()
{
cat ~/.wallpaper_manager/tags/imagenes_paisajes | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
plantas()
{
cat ~/.wallpaper_manager/tags/imagenes_plantas | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
soft()
{
cat ~/.wallpaper_manager/tags/imagenes_software | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
rios()
{
cat ~/.wallpaper_manager/tags/imagenes_rios | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}
tecno()
{
cat ~/.wallpaper_manager/tags/imagenes_tecnologia | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh 
}

dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="515" --title="Categorías de Imágenes" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Xml_of_animals" \
					'FALSE' 		"Xml_of_cars" \
					'FALSE' 		"Xml_of_art" \
					'FALSE' 		"Xml_of_colors" \
					'FALSE' 		"Xml_of_crops_circles" \
					'FALSE' 		"Xml_of_digital_art" \
					'FALSE' 		"Xml_of_buildings" \
					'FALSE' 		"Xml_of_space" \
					'FALSE' 		"Xml_of_movies" \
					'FALSE' 		"Xml_of_mystical" \
					'FALSE' 		"Xml_of_music" \
					'FALSE'			"Xml_of_ocean" \
					'FALSE' 		"Xml_of_scenery" \
					'FALSE' 		"Xml_of_vegetation" \
					'FALSE' 		"Xml_of_software_images" \
					'FALSE' 		"Xml_of_rivers_and_lakes" \
					'FALSE' 		"Xml_of_technology" )
}
comando()
{
	dialogo
	if [ ${file} = 'Xml_of_animals' ]; then
		animales
	elif [ ${file} = 'Xml_of_art' ]; then
		arte
	elif [ ${file} = 'Xml_of_cars' ]; then
		autos
	elif [ ${file} = 'Xml_of_colors' ]; then
		colores
	elif [ ${file} = 'Xml_of_crops_circles' ]; then
		crops
	elif [ ${file} = 'Xml_of_digital_art' ]; then
		digitales
	elif [ ${file} = 'Xml_of_buildings' ]; then
		edificios
	elif [ ${file} = 'Xml_of_space' ]; then
		espacio
	elif [ ${file} = 'Xml_of_movies' ]; then
		films
	elif [ ${file} = 'Xml_of_mystical' ]; then
		misticas
	elif [ ${file} = 'Xml_of_music' ]; then
		mus
	elif [ ${file} = 'Xml_of_ocean' ]; then
		ocean
	elif [ ${file} = 'Xml_of_scenery' ]; then
		paisajes
	elif [ ${file} = 'Xml_of_vegetation' ]; then
		plantas
	elif [ ${file} = 'Xml_of_rivers_and_lakes' ]; then
		rios
	elif [ ${file} = 'Xml_of_software_images' ]; then
		soft
	elif [ ${file} = 'Xml_of_technology' ]; then
		tecno
	else
		echo "No selection."
		exit 1
	fi
}

comando
exit 0
