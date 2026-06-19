#!/bin/bash

fila=$(gsettings get org.gnome.desktop.background primary-color)
coolor=$(echo "$fila" | sed 's/'"'"'//g')
COLOR=`zenity --color-selection --show-palette --color="$coolor"`

case $? in
         0)
		gsettings set org.gnome.desktop.background primary-color $COLOR
		echo "$COLOR" > /tmp/clementine_color;;
         1)
                echo "No ha seleccionado ningún color.";;
        -1)
                echo "Ha ocurrido un error inesperado.";;
esac
