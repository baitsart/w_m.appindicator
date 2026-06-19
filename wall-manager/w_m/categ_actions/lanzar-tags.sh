#!/bin/sh
if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
else
    mode=""
fi

animales()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_animales)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_animales
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_animales
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
arte()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_arte)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_arte
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_arte
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
autos()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_autos)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_autos
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_autos
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
colores()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_colores)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_colores
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_colores
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
crops()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_crops)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_crops
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_crops
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
digitales()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_digitales)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_digitales
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_digitales
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
edificios()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_edificios)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_edificios
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_edificios
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
espacio()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_espacio)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_espacio
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_espacio
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
films()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_films)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_films
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_films
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
misticos()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_misticas)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_misticas
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_misticas
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
mus()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_musica)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_musica
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_musica
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
ocean()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_oceano)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_oceano
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_oceano
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
paisajes()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_paisajes)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_paisajes
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_paisajes
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
plantas()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_plantas)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_plantas
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_plantas
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
rios()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_rios)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_rios
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_rios
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
soft()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_software)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_software
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_software
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}
tecno()
{
file=$(shuf -n 1 ~/.wallpaper_manager/tags/imagenes_tecnologia)
image="$file"

	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"

sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"


then

zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from favorites?"

sed -i 's|'"$image"'||' ~/.wallpaper_manager/tags/imagenes_tecnologia
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_tecnologia
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list "

      else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/favoritos"
     exit
fi
fi
}

dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="515" --title="Categorías de Imágenes" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Put_of_animals" \
					'FALSE' 		"Put_of_art" \
					'FALSE' 		"Put_of_cars" \
					'FALSE' 		"Put_of_colors" \
					'FALSE' 		"Put_of_crops_circles" \
					'FALSE' 		"Put_of_digital_art" \
					'FALSE' 		"Put_of_buildings" \
					'FALSE' 		"Put_of_space" \
					'FALSE' 		"Put_of_movies" \
					'FALSE' 		"Put_of_mystical" \
					'FALSE' 		"Put_of_music" \
					'FALSE' 		"Put_of_ocean" \
					'FALSE' 		"Put_of_scenery" \
					'FALSE' 		"Put_of_vegetation" \
					'FALSE' 		"Put_of_rivers_and_lakes" \
					'FALSE' 		"Put_of_software_images" \
					'FALSE' 		"Put_of_technology" )
}
comando()
{
	dialogo
	if [ ${file} = 'Put_of_animals' ]; then
		animales
	elif [ ${file} = 'Put_of_art' ]; then
		arte
	elif [ ${file} = 'Put_of_cars' ]; then
		autos
	elif [ ${file} = 'Put_of_colors' ]; then
		colores
	elif [ ${file} = 'Put_of_crops_circles' ]; then
		crops
	elif [ ${file} = 'Put_of_digital_art' ]; then
		digitales
	elif [ ${file} = 'Put_of_buildings' ]; then
		edificios
	elif [ ${file} = 'Put_of_space' ]; then
		espacio
	elif [ ${file} = 'Put_of_movies' ]; then
		films
	elif [ ${file} = 'Put_of_mystical' ]; then
		misticos
	elif [ ${file} = 'Put_of_music' ]; then
		mus
	elif [ ${file} = 'Put_of_ocean' ]; then
		ocean
	elif [ ${file} = 'Put_of_scenery' ]; then
		paisajes
	elif [ ${file} = 'Put_of_vegetation' ]; then
		plantas
	elif [ ${file} = 'Put_of_rivers_and_lakes' ]; then
		rios
	elif [ ${file} = 'Put_of_software_images' ]; then
		soft
	elif [ ${file} = 'Put_of_technology' ]; then
		tecno
	else
		echo "No selection."
		exit 1
	fi
}

comando
exit 0
