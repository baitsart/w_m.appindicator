#!/bin/sh

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

activar()
{
sed -i 's|#sh /usr/share/wallpaper_manager/w_m/actions/custom-dash-panel-color.sh|sh /usr/share/wallpaper_manager/w_m/actions/custom-dash-panel-color.sh|' /usr/share/wallpaper_manager/w_m/actions/color-back1.sh /usr/share/wallpaper_manager/w_m/actions/c-b
sh /usr/share/wallpaper_manager/w_m/actions/custom-dash-panel-color.sh
}
desactivar()
{
sed -i 's|sh /usr/share/wallpaper_manager/w_m/actions/custom-dash-panel-color.sh|#sh /usr/share/wallpaper_manager/w_m/actions/custom-dash-panel-color.sh|' /usr/share/wallpaper_manager/w_m/actions/color-back1.sh /usr/share/wallpaper_manager/w_m/actions/color-back1.sh /usr/share/wallpaper_manager/w_m/actions/c-bs
gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color false
}
elegirsec()
{
fila=$(gsettings get org.gnome.desktop.background primary-color)
coolor=$(echo "$fila" | sed 's/'"'"'//g')
COLOR=`zenity --color-selection --show-palette --color="$coolor"`

case $? in
         0)
		gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color true
		gsettings set org.gnome.shell.extensions.dash-to-dock background-color "$COLOR";;
         1)
                echo "No ha seleccionado ningún color.";;
        -1)
                echo "Ha ocurrido un error inesperado.";;
esac

}
act_pan()
{
sed -i 's| #reload_autocolor | reload_autocolor |' /usr/share/wallpaper_manager/w_m/actions/color-back1.sh /usr/share/wallpaper_manager/w_m/actions/c-b "$HOME"/local/bin/c-b
sh /usr/share/wallpaper_manager/w_m/actions/custom-dash-panel-color.sh
}
desact_pan()
{
sed -i 's| reload_autocolor | #reload_autocolor |' /usr/share/wallpaper_manager/w_m/actions/color-back1.sh /usr/share/wallpaper_manager/w_m/actions/c-b "$HOME"/local/bin/c-b
gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color false
}
dialogo_principal()
{

	opcion=$( zenity --list --radiolist --width="150" --height="380" --title="wallpaper manager" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Activar_ColorDash" \
					'FALSE' 	"Desactivar_ColorDash" \
					'FALSE' 	"Elegir_ColorDash" \
					'TRUE' 		"Activar_ColorPanel" \
					'FALSE' 	"Desactivar_ColorPanel" )

}

inicio()
{
	dialogo_principal
	if [ ${opcion} = 'Activar_ColorDash' ]; then
		activar
	elif [ ${opcion} = 'Desactivar_ColorDash' ]; then
		desactivar
	elif [ ${opcion} = 'Elegir_ColorDash' ]; then
		elegirsec		
	elif [ ${opcion} = 'Activar_ColorPanel' ]; then
		act_pan
	elif [ ${opcion} = 'Desactivar_ColorPanel' ]; then
		desact_pan
	else
		echo "No selection."
		exit 1
	fi
}

inicio
exit 0
