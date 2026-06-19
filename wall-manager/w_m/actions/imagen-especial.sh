#!/bin/sh
guarda()
{
chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode")
echo "$chi" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//' > /tmp/background_notify
cat /tmp/background_notify > $HOME/.wallpaper_manager/imagen_especial
cat /tmp/background_notify >> $HOME/.wallpaper_manager/tags/imagenes_especiales
sed -i '/^$/d' ~/.wallpaper_manager/tags/imagenes_especiales
rm /tmp/background_notify
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Image save as special"
}
poner()
{
file=$(cat $HOME/.wallpaper_manager/imagen_especial)
image="$file"
	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"
notify-send -i /usr/share/icons/gnome/32x32/actions/insert-image.png "wallpaper-manager" "Special image, as background"
ir_prev
exit 0
	fi

	if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  /imagen_especial"
     exit
fi

}
lista()
{
if CHOICE=$(cat $HOME/.wallpaper_manager/tags/imagenes_especiales | zenity --list --width="850" --height="515" --text "Selecciona una imagen" --title "Wallpaper" --column "Imágenes guardadas")
then
image=$(echo "$CHOICE"| cut -d'|' -f1)
	if [ -f "$image" ];
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$image"
notif
ir_prev
exit 0
	fi
		if [ $? -eq 0 ]; then
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  $file"
if
echo $image | grep "$1"
then
if
zenity --title "Eliminar de la lista" --question --text "¿Desea eliminar el fondo actual de imagenes_especiales?"
then
sed -i 's|'"$image"'||' ~/.wallpaper_manager/favoritos
sed -i '/^$/d' ~/.wallpaper_manager/favoritos
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Se ha eliminado de la lista de imagenes_especiales"
      fi
else
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "w-m" "No image:  ./tags/imagenes_especiales"
     exit
fi
fi
fi
}
rem()
{
if zenity --title "Eliminar de la lista" --question --text "¿Desea eliminar el fondo actual de imagenes_especiales?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri"$mode")
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')
sed -i 's|'"$chi"'||' $HOME/.wallpaper_manager/tags/imagenes_especiales
sed -i '/^$/d' $HOME/.wallpaper_manager/tags/imagenes_especiales
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Se ha eliminado de la lista de imagenes_especiales"

zenity --info --title "Eliminar de la lista" --text '<b>...Hecho!.</b>\nSe ha eliminado de la lista de imagenes_especiales.' --no-wrap
      else
zenity --info --title "Cancelado" --text "No se eliminará de imagenes_especiales" --no-wrap
     exit
     fi
}
dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="225" --title="wallpaper manager" \
					--column='Pick' --column='Option'  \
					'FALSE' 		"Save_image_as_special" \
					'FALSE' 		"Active_special_image" \
					'FALSE' 		"List_Special_images" \
					'FALSE' 		"Remove_from_Special" )
}
comando()
{
	dialogo
	if [ ${file} = 'Save_image_as_special' ]; then
		guarda
	elif [ ${file} = 'Active_special_image' ]; then
		poner
	elif [ ${file} = 'List_Special_images' ]; then
		lista
	elif [ ${file} = 'Remove_from_Special' ]; then
		rem
	else
		echo "No selection."
		exit 1
	fi
}
comando

exit 0
