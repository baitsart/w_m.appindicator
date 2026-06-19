#!/bin/bash
#Script #
# Eres libre de modificarlo y redistribuirlo
# por  Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart
if
tag_name=$(echo "
"| zenity --list --width="470" --height="130" --title="Choose the name of the category" --column "lista"); then
if echo $tag_name  | tr -d '\n'| grep "$1" ;then
if zenity --title "Remove from list" --question --text "Do you want to delete the category/$tag_name?"
then
if [ -f ~/.wallpaper_manager/tags/imagenes_$tag_name ]; then
rm ~/.wallpaper_manager/tags/imagenes_$tag_name
rm ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_$tag_name
fi
rm /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/eliminar_$tag_name.sh
rm /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guarda_$tag_name.sh
rm /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar_$tag_name.sh
rm /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_$tag_name.sh
rm /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_$tag_name.sh
list_size=$(expr 130 - 30)
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/borrar_tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/crear-tags.sh
sed -i '/'$tag_name'/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh
sed -i '/^$/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh
python -c 'import sys; print sys.stdin.read().replace("{\n}", "")' < /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh > /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh1 
mv /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh1 /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh && chmod +x /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh
sed -i '/'$tag_name'/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh
sed -i '/^$/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh
python -c 'import sys; print sys.stdin.read().replace("{\n}", "")' < /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh > /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh1 
mv /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh1 /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh && chmod +x /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh
sed -i '/'$tag_name'/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh
sed -i '/^$/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh
python -c 'import sys; print sys.stdin.read().replace("{\n}", "")' < /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh > /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh1 
mv /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh1 /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh && chmod +x /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh
sed -i '/'$tag_name'/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh
sed -i '/^$/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh
python -c 'import sys; print sys.stdin.read().replace("{\n}", "")' < /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh > /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh1 
mv /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh1 /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh && chmod +x /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh
sed -i '/'$tag_name'/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh
sed -i '/^$/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh
python -c 'import sys; print sys.stdin.read().replace("{\n}", "")' < /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh > /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh1 
mv /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh1 /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh && chmod +x /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh
sed -i '/'$tag_name'/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh
sed -i '/^$/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh
python -c 'import sys; print sys.stdin.read().replace("{\n}", "")' < /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh > /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh1 
mv /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh1 /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh && chmod +x /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh
sed -i '/'$tag_name'/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh
sed -i '/^$/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh
python -c 'import sys; print sys.stdin.read().replace("{\n}", "")' < /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh > /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh1 
mv /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh1 /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh && chmod +x /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh
sed -i 's|'$tag_name'||' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/borrar_tags.sh
sed -i 's|'$tag_name'||' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/"File saved in categories"
sed -i '/^$/d' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/borrar_tags.sh
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "It has been removed from the tag list/$tag_name"
zenity --info --title "Remove from list" --text '<b>...done!.</b>\\nIt has been removed from the tag list/'$tag_name'.' --no-wrap
      else
zenity --info --title "canceled" --text "Tag will not be deleted/'$tag_name'" --no-wrap
     exit
     fi
fi
fi
	if [ $? -eq 0 ]; then
exit
fi
fi
