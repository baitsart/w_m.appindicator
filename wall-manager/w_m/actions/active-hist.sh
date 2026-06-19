#!/bin/sh
active()
{
sed -i '/exit/d' /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
sed -i 's|'"'"'FALSE'"'"' \t\t\"Active\"|'"'"'TRUE'"'"' \t\t\"Active\"|' /usr/share/wallpaper_manager/w_m/actions/active-hist.sh
sed -i 's|'"'"'TRUE'"'"' \t\t\"Deactive\"|'"'"'FALSE'"'"' \t\t\"Deactive\"|' /usr/share/wallpaper_manager/w_m/actions/active-hist.sh
}
desactive()
{
sed -i 's|sh|sh\nexit|' /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
sed -i 's|'"'"'FALSE'"'"' \t\t\"Deactive\"|'"'"'TRUE'"'"' \t\t\"Deactive\"|' /usr/share/wallpaper_manager/w_m/actions/active-hist.sh
sed -i 's|'"'"'TRUE'"'"' \t\t\"Active\"|'"'"'FALSE'"'"' \t\t\"Active\"|' /usr/share/wallpaper_manager/w_m/actions/active-hist.sh
}
dialogo()
{

	file=$( zenity --list --radiolist --width="240" --height="165" --title="History Log (w-m)" --text="Current history conditions" \
					--column='Pick' --column='Opción'  \
					'TRUE' 		"Active" \
					'FALSE' 		"Deactive" )
}
comando()
{
	dialogo
	if [ ${file} = 'Active' ]; then
		active
	elif [ ${file} = 'Deactive' ]; then
		desactive
	else
		echo "Error en selección."
		exit 1
	fi
}

comando

exit 0
