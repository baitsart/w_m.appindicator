#!/bin/sh
if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
else
    mode=""
fi

animales()
{
if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_animales | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_animales
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_animales
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
arte()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_arte | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_arte
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_arte
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
autos()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_autos | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_autos
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_autos
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
colores()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_colores | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_colores
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_colores
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
crops()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_crops | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_crops
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_crops
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
edificios()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_edificios | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_edificios
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_edificios
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
digitales()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_digitales | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_digitales
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_digitales
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
espacio()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_espacio | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_espacio
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_espacio
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
films()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_films | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_films
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_films
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
misticas()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_misticas | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_misticas
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_misticas
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
mus()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_musica | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_musica
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_musica
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
ocean()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_oceano | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_oceano
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_oceano
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
paisajes()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_paisajes | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_paisajes
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_paisajes
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
plantas()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_plantas | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_plantas
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_plantas
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
rios()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_rios | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_rios
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_rios
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}

soft()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_software | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_software
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_software
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
tecno()
{

if CHOICE=$(tac ~/.wallpaper_manager/tags/imagenes_tecnologia | zenity --list --width="850" --height="515" --text "Select a picture" --title "Wallpaper" --column "Saved backgrounds")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

		if [ $? -eq 0 ]; then

if
echo $image | grep "$1"
then

if

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"
then

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_tecnologia
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_tecnologia
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

     exit
fi
fi
fi
fi
}
dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="515" --title="Categorías de Imágenes" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"List_animals" \
					'FALSE' 		"List_art" \
					'FALSE' 		"List_cars" \
					'FALSE' 		"List_colors" \
					'FALSE' 		"List_crops_circles" \
					'FALSE' 		"List_digital_art" \
					'FALSE' 		"List_buildings" \
					'FALSE' 		"List_space" \
					'FALSE' 		"List_movies" \
					'FALSE' 		"List_mystical" \
					'FALSE' 		"List_music" \
					'FALSE' 		"List_ocean" \
					'FALSE' 		"List_scenery" \
					'FALSE' 		"List_vegetation" \
					'FALSE' 		"List_rivers_and_lakes" \
					'FALSE' 		"List_software_images" \
					'FALSE' 		"List_technology" )
}
comando()
{
	dialogo
	if [ ${file} = 'List_animals' ]; then
		animales
	elif [ ${file} = 'List_art' ]; then
		arte
	elif [ ${file} = 'List_cars' ]; then
		autos
	elif [ ${file} = 'List_colors' ]; then
		colores
	elif [ ${file} = 'List_crops_circles' ]; then
		crops
	elif [ ${file} = 'List_digital_art' ]; then
		digitales
	elif [ ${file} = 'List_buildings' ]; then
		edificios
	elif [ ${file} = 'List_space' ]; then
		espacio
	elif [ ${file} = 'List_movies' ]; then
		films
	elif [ ${file} = 'List_mystical' ]; then
		misticas
	elif [ ${file} = 'List_music' ]; then
		mus
	elif [ ${file} = 'List_ocean' ]; then
		ocean
	elif [ ${file} = 'List_scenery' ]; then
		paisajes
	elif [ ${file} = 'List_vegetation' ]; then
		plantas
	elif [ ${file} = 'List_rivers_and_lakes' ]; then
		rios
	elif [ ${file} = 'List_software_images' ]; then
		soft
	elif [ ${file} = 'List_technology' ]; then
		tecno
	else
		echo "No selection."
		exit 1
	fi
}

comando
exit 0




