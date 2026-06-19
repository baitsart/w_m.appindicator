#!/bin/sh
animales()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_animales
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
arte()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_arte
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
autos()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_autos
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi 
}
colores()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_colores
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
crops()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_crops
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
digitales()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_digitales
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
edificios()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_edificios
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi 
}
espacio()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_espacio
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
films()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_films
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
misticas()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_misticas
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
mus()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_musica
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
ocean()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_oceano
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
paisajes()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_paisajes
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
plantas()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_plantas
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
soft()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_software
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
rios()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_rios
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}
tecno()
{
while read LINE
do
    if [ -f "$LINE" ]
    then
       echo ""'"'"$LINE"'"'"" >> /tmp/buenas-imagenes1
    else
       echo "No image: "'"'"$LINE"'"'""
       fi
done < ~/.wallpaper_manager/tags/imagenes_tecnologia
if total_files=$(cat /tmp/buenas-imagenes1 | wc -l | grep "$1")
echo "Total files $total_files"
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
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /backgrounds/favoritos"
     exit 0
fi
}

dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="515" --title="Categorías de Imágenes" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Slideshows_of_animals" \
					'FALSE' 		"Slideshows_of_cars" \
					'FALSE' 		"Slideshows_of_art" \
					'FALSE' 		"Slideshows_of_colors" \
					'FALSE' 		"Slideshows_of_crops_circles" \
					'FALSE' 		"Slideshows_of_digital_art" \
					'FALSE' 		"Slideshows_of_buildings" \
					'FALSE' 		"Slideshows_of_space" \
					'FALSE' 		"Slideshows_of_movies" \
					'FALSE' 		"Slideshows_of_mystical" \
					'FALSE' 		"Slideshows_of_music" \
					'FALSE'			"Slideshows_of_ocean" \
					'FALSE' 		"Slideshows_of_scenery" \
					'FALSE' 		"Slideshows_of_vegetation" \
					'FALSE' 		"Slideshows_of_software_images" \
					'FALSE' 		"Slideshows_of_rivers_and_lakes" \
					'FALSE' 		"Slideshows_of_technology" )
}
comando()
{
	dialogo
	if [ ${file} = 'Slideshows_of_animals' ]; then
		animales
	elif [ ${file} = 'Slideshows_of_art' ]; then
		arte
	elif [ ${file} = 'Slideshows_of_cars' ]; then
		autos
	elif [ ${file} = 'Slideshows_of_colors' ]; then
		colores
	elif [ ${file} = 'Slideshows_of_crops_circles' ]; then
		crops
	elif [ ${file} = 'Slideshows_of_digital_art' ]; then
		digitales
	elif [ ${file} = 'Slideshows_of_buildings' ]; then
		edificios
	elif [ ${file} = 'Slideshows_of_space' ]; then
		espacio
	elif [ ${file} = 'Slideshows_of_movies' ]; then
		films
	elif [ ${file} = 'Slideshows_of_mystical' ]; then
		misticas
	elif [ ${file} = 'Slideshows_of_music' ]; then
		mus
	elif [ ${file} = 'Slideshows_of_ocean' ]; then
		ocean
	elif [ ${file} = 'Slideshows_of_scenery' ]; then
		paisajes
	elif [ ${file} = 'Slideshows_of_vegetation' ]; then
		plantas
	elif [ ${file} = 'Slideshows_of_rivers_and_lakes' ]; then
		rios
	elif [ ${file} = 'Slideshows_of_software_images' ]; then
		soft
	elif [ ${file} = 'Slideshows_of_technology' ]; then
		tecno
	else
		echo "Error en selección."
		exit 1
	fi
}

comando
exit 0
