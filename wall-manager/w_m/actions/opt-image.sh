#!/bin/bash
zoom()
{
gsettings set org.gnome.desktop.background picture-options 'zoom'
}
centered()
{
gsettings set org.gnome.desktop.background picture-options 'centered'
}
scaled()
{
gsettings set org.gnome.desktop.background picture-options 'scaled'
}
fondo()
{
gsettings set org.gnome.desktop.background picture-options 'wallpaper'
}
relleno()
{
gsettings set org.gnome.desktop.background picture-options 'stretched'
}
dialogo()
{

	file=$( zenity --list --radiolist --width="75" --height="235" --title="wallpaper manager" \
					--column='Pick' --column='Option'  \
					'FALSE' 		"Zoom" \
					'FALSE' 		"Centered" \
					'FALSE' 		"Scaled" \
					'FALSE' 		"Wallpaper" \
					'FALSE' 		"Stretched" )
}
comando()
{
	dialogo
	if [ ${file} = 'Zoom' ]; then
		zoom
	elif [ ${file} = 'Centered' ]; then
		centered
	elif [ ${file} = 'Scaled' ]; then
		scaled
	elif [ ${file} = 'Wallpaper' ]; then
		fondo
	elif [ ${file} = 'Stretched' ]; then
		relleno
	else
		echo "No selection."
		exit 1
	fi
}

comando
exit 0
