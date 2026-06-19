#!/bin/bash
fold=`zenity --file-selection --directory --title="Select a folder with images "`
case $? in
         0)
                cd "$fold" && /bin/bash /usr/share/wallpaper_manager/w_m/actions/create-xml-background;;

         1)
                echo "No ha seleccionado ningún archivo.";;
        -1)
                echo "Ha ocurrido un error inesperado.";;
esac
