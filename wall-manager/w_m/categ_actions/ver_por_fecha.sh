#!/bin/sh
animales()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_animales | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
arte()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_arte | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
autos()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_autos | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh & 
}
colores()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_colores | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
crops()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_crops | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
digitales()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_digitales | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
edificios()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_edificios | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh & 
}
espacio()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_espacio | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
films()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_films | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
misticas()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_misticas | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
mus()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_musica | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
ocean()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_oceano | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
paisajes()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_paisajes | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
plantas()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_plantas | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
soft()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_software | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
rios()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_rios | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}
tecno()
{
cat ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_tecnologia | awk '!array_temp[$0]++'  >  /tmp/tags-dated && sh /usr/bin/wallpaper_manager/w_m/categ_actions/por_fecha_tags.sh &
}

dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="515" --title="Images tags" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Dated_of_animals" \
					'FALSE' 		"Dated_of_cars" \
					'FALSE' 		"Dated_of_art" \
					'FALSE' 		"Dated_of_colors" \
					'FALSE' 		"Dated_of_crops_circles" \
					'FALSE' 		"Dated_of_digital_art" \
					'FALSE' 		"Dated_of_buildings" \
					'FALSE' 		"Dated_of_space" \
					'FALSE' 		"Dated_of_movies" \
					'FALSE' 		"Dated_of_mystical" \
					'FALSE' 		"Dated_of_music" \
					'FALSE'			"Dated_of_ocean" \
					'FALSE' 		"Dated_of_scenery" \
					'FALSE' 		"Dated_of_vegetation" \
					'FALSE' 		"Dated_of_software_images" \
					'FALSE' 		"Dated_of_rivers_and_lakes" \
					'FALSE' 		"Dated_of_technology" )
}
comando()
{
	dialogo
	if [ ${file} = 'Dated_of_animals' ]; then
		animales
	elif [ ${file} = 'Dated_of_art' ]; then
		arte
	elif [ ${file} = 'Dated_of_cars' ]; then
		autos
	elif [ ${file} = 'Dated_of_colors' ]; then
		colores
	elif [ ${file} = 'Dated_of_crops_circles' ]; then
		crops
	elif [ ${file} = 'Dated_of_digital_art' ]; then
		digitales
	elif [ ${file} = 'Dated_of_buildings' ]; then
		edificios
	elif [ ${file} = 'Dated_of_space' ]; then
		espacio
	elif [ ${file} = 'Dated_of_movies' ]; then
		films
	elif [ ${file} = 'Dated_of_mystical' ]; then
		misticas
	elif [ ${file} = 'Dated_of_music' ]; then
		mus
	elif [ ${file} = 'Dated_of_ocean' ]; then
		ocean
	elif [ ${file} = 'Dated_of_scenery' ]; then
		paisajes
	elif [ ${file} = 'Dated_of_vegetation' ]; then
		plantas
	elif [ ${file} = 'Dated_of_rivers_and_lakes' ]; then
		rios
	elif [ ${file} = 'Dated_of_software_images' ]; then
		soft
	elif [ ${file} = 'Dated_of_technology' ]; then
		tecno
	else
		echo "No selection."
		exit 1
	fi
}

comando
exit 0
