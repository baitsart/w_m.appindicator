#!/bin/bash

# Script #
# Eres libre de modificarlo y redistribuirlo
# por  Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart
inicio()
{
cat ~/.wallpaper_manager/buenas_imagenes > ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_animales >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_arte >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_autos >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_colores >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_crops >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_digitales >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_edificios >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_espacio >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_films >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_misticas >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_musica >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_oceano >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_paisajes >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_plantas >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_rios >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_software >> ~/.wallpaper_manager/tags/todos_favoritos
cat ~/.wallpaper_manager/tags/imagenes_tecnologia >> ~/.wallpaper_manager/tags/todos_favoritos
}
xmls()
{
sh /usr/share/wallpaper_manager/w_m/actions/xml-all-fav.sh
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
}

ver()
{
inicio
cat ~/.wallpaper_manager/tags/todos_favoritos | awk '!array_temp[$0]++' > /tmp/buenas-imagenes
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No hay imagen: "'"'"$LINE"'"'""
       fi
done < /tmp/buenas-imagenes
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Cantidad de imágenes $total_files"
then
cat /tmp/buenas-imagenes1 | awk '{ printf "%s ", $0 }' >  /tmp/buenas-imagenes
echo "#!/bin/bash" > /tmp/script_viewer
cat /tmp/buenas-imagenes | head -n1 | awk '{ print "eog --slide-show "$0"" } ' > /tmp/buenas-imagenes1
cat /tmp/buenas-imagenes | sed '1d' >> /tmp/buenas-imagenes1
cat /tmp/buenas-imagenes1 | tr '\n' ' ' > /tmp/buenas-imagenes
cat /tmp/buenas-imagenes >> /tmp/script_viewer
echo "exit" >> /tmp/script_viewer
chmod +x /tmp/script_viewer
sh /tmp/script_viewer
rm /tmp/buenas-imagenes
rm /tmp/buenas-imagenes1 
rm /tmp/script_viewer
exit
fi
	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No hay imagen:  /backgrounds/favoritos"
     exit 0
fi
}

lanza()
{
inicio
file=$(shuf -n 1 ~/.wallpaper_manager/tags/todos_favoritos)
image="$file"
	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
exit
}

edit()
{

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
					'TRUE' 		"Edit_of_animals" \
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
	if [ ${file} = 'Edit_of_animals' ]; then
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

}

open_file()
{
sh /usr/share/wallpaper_manager/w_m/actions/open_file.sh
}
open_folder()
{
sh /usr/share/wallpaper_manager/w_m/actions/open_folder_xml.sh
}
folder()
{
sh /usr/share/wallpaper_manager/w_m/actions/lanzar-folder.sh
}
folder_prev()
{
sh /usr/share/wallpaper_manager/w_m/actions/same_fold_prev_next.sh prev
}
folder_next()
{
sh /usr/share/wallpaper_manager/w_m/actions/same_fold_prev_next.sh next
}
same_directory()
{
sh /usr/share/wallpaper_manager/w_m/actions/lanzar-directory.sh
}
gru()
{
sh /usr/share/wallpaper_manager/w_m/actions/wallpaper-grub.sh
}
xmlfolder()
{
sh /usr/share/wallpaper_manager/w_m/actions/xml-actual-folder.sh
}
opcfolder()
{
sh /usr/share/wallpaper_manager/w_m/actions/saved_folder.sh
}
videowall()
{
/bin/bash /usr/share/wallpaper_manager/w_m/actions/Video-Wallpaper
}
nasawall()
{
sh /usr/share/wallpaper_manager/w_m/actions/nasa-wall-en-historial.sh
}
nat()
{
/bin/bash /usr/share/wallpaper_manager/w_m/actions/nat-geo-pic.sh
}
desc()
{
/bin/bash /usr/share/wallpaper_manager/w_m/actions/wall-from-goolge.sh
}
sat()
{
/bin/bash /usr/share/wallpaper_manager/w_m/actions/world-wall.sh
}

dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="535" --title="wallpaper manager" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Put_of_all_files" \
					'FALSE' 		"View_of_all_files" \
					'FALSE' 		"Xml_of_all_files" \
					'FALSE' 		"Edit_saved_lists" \
					'FALSE' 		"Put_on_grub2" \
					'FALSE' 		"Open_image..." \
					'FALSE' 		"Open_folder_to_xml" \
					'FALSE' 		"Same_folder_image" \
					'FALSE' 		"In_this_folder,_previous" \
					'FALSE' 		"In_this_folder,_next" \
					'FALSE' 		"Same_directory_image" \
					'FALSE' 		"Same_folder_xml" \
					'FALSE' 		"Save_or_use_folders" \
					'FALSE' 		"Video_wallpaper" \
					'FALSE' 		"Image_from_google,_by_terms" \
					'FALSE' 		"Current_image_of_the_planet" \
					'FALSE' 		"Image_from_NatGeo" \
					'FALSE' 		"Nasa_wallpaper" )
}
comando()
{
	dialogo
	if [ ${file} = 'Put_of_all_files' ]; then
		lanza
	elif [ ${file} = 'View_of_all_files' ]; then
		ver
	elif [ ${file} = 'Xml_of_all_files' ]; then
		xmls
	elif [ ${file} = 'Edit_saved_lists' ]; then
		edit
	elif [ ${file} = 'Put_on_grub2' ]; then
		gru
	elif [ ${file} = 'Open_image...' ]; then
		open_file
	elif [ ${file} = 'Open_folder_to_xml' ]; then
		open_folder
	elif [ ${file} = 'Same_folder_image' ]; then
		folder
	elif [ ${file} = 'In_this_folder,_previous' ]; then
		folder_prev
	elif [ ${file} = 'In_this_folder,_next' ]; then
		folder_next
	elif [ ${file} = 'Same_directory_image' ]; then
		same_directory
	elif [ ${file} = 'Same_folder_xml' ]; then
		xmlfolder
	elif [ ${file} = 'Save_or_use_folders' ]; then
		opcfolder
	elif [ ${file} = 'Video_wallpaper' ]; then
		videowall
	elif [ ${file} = 'Image_from_google,_by_terms' ]; then
		desc
	elif [ ${file} = 'Current_image_of_the_planet' ]; then
		sat
	elif [ ${file} = 'Image_from_NatGeo' ]; then
		nat
	elif [ ${file} = 'Nasa_wallpaper' ]; then
		nasawall
	else
		echo "No selection."
		exit 1
	fi
}

comando
exit 0
