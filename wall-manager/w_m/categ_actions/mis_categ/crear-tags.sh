#!/bin/bash

# Script #
# Eres libre de modificarlo y redistribuirlo
# por  Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart
if
tag_name=$(zenity --entry --width="470" --height="125" --title="Enter the name of the category"); then
tag_name_mod=$(echo "$tag_name" | tr ' ' '_' | tr -d '\n')
isit=$(echo "$tag_name_mod" | grep "$1")
	if [ "$isit" != "" ]; then
coincidence=$(grep -x "$tag_name_mod" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/borrar_tags.sh; grep "$tag_name_mod" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/crear-tags.sh; grep "$tag_name_mod" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh; grep "$tag_name_mod" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh; grep "$tag_name_mod" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh; grep "$tag_name_mod" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh; grep "$tag_name_mod" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh; grep "$tag_name_mod" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh; grep "$tag_name_mod" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh; echo "$tag_name_mod" | grep -x "nueva")
	if [ "$coincidence" != "" ]; then
echo "Select another name that matches names of commands"
exit 0
fi
list_size=$(expr 130 + 30)
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/borrar_tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/crear-tags.sh
# LISTADO
sed -i 's|echo \"|echo \"'$tag_name_mod'\n|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/borrar_tags.sh
# GUARDAR
cp /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guarda_nueva.sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guarda_"$tag_name_mod".sh
sed -i 's|nueva|'$tag_name_mod'|g' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guarda_"$tag_name_mod".sh
sed -i "2i$tag_name_mod()\n{\n\nsh \/usr\/bin\/.wallpaper_manager\/w_m\/categ_actions\/mis_categ\/guarda_$tag_name_mod.sh\n}" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh
sed -i 's|no_commmand|no_commmand\n\telif \[ ${file} = '"'"'Save_on_'$tag_name_mod''"'"' \]; then\n\t\t'$tag_name_mod'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh
sed -i 's|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"Save_on_'$tag_name_mod'\" \\\n\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/guardar-en-tags.sh
# XML
sed -i "2i$tag_name_mod()\n{\ncat ~/.wallpaper_manager/tags/imagenes_$tag_name_mod | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/xml_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh \n}" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh
sed -i 's|no_commmand|no_commmand\n\telif \[ ${file} = '"'"'Xml_of_'$tag_name_mod''"'"' \]; then\n\t\t'$tag_name_mod'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh
sed -i 's|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"Xml_of_'$tag_name_mod'\" \\\n\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_xml.sh
# SLIDES
sed -i "2i$tag_name_mod()\n{\ncat ~/.wallpaper_manager/tags/imagenes_$tag_name_mod | shuf > /tmp/buenas-imagenes && sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_mis_tags.sh && sh /usr/bin/wallpaper_manager/w_m/actions/ir-prev.sh && sh /usr/bin/wallpaper_manager/w_m/actions/notify-image.sh \n}" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh
sed -i 's|no_commmand|no_commmand\n\telif \[ ${file} = '"'"'Slideshow_'$tag_name_mod''"'"' \]; then\n\t\t'$tag_name_mod'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh
sed -i 's|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"Slideshow_'$tag_name_mod'\" \\\n\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/slide_tags.sh
# LANZAR
cp /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar_nueva.sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar_"$tag_name_mod".sh
sed -i 's|nueva|'$tag_name_mod'|g' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar_"$tag_name_mod".sh
sed -i "2i$tag_name_mod()\n{\n\nsh \/usr\/bin\/.wallpaper_manager\/w_m\/categ_actions\/mis_categ\/lanzar_$tag_name_mod.sh\n}" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh
sed -i 's|no_commmand|no_commmand\n\telif \[ ${file} = '"'"'Put_of_'$tag_name_mod''"'"' \]; then\n\t\t'$tag_name_mod'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh
sed -i 's|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"Put_of_'$tag_name_mod'\" \\\n\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/lanzar-tags.sh
# LISTAR
cp /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_nueva.sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_"$tag_name_mod".sh
sed -i 's|nueva|'$tag_name_mod'|g' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_"$tag_name_mod".sh
sed -i "2i$tag_name_mod()\n{\n\nsh \/usr\/bin\/.wallpaper_manager\/w_m\/categ_actions\/mis_categ\/listar_$tag_name_mod.sh\n}" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh
sed -i 's|no_commmand|no_commmand\n\telif \[ ${file} = '"'"'List_de_'$tag_name_mod''"'"' \]; then\n\t\t'$tag_name_mod'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh
sed -i 's|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"List_de_'$tag_name_mod'\" \\\n\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/listar_tags.sh
# ELIMINAR
cp /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/eliminar_nueva.sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/eliminar_"$tag_name_mod".sh
sed -i 's|nueva|'$tag_name_mod'|g' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/eliminar_"$tag_name_mod".sh
sed -i "2i$tag_name_mod()\n{\n\nsh \/usr\/bin\/.wallpaper_manager\/w_m\/categ_actions\/mis_categ\/eliminar_$tag_name_mod.sh\n}" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh
sed -i 's|no_commmand|no_commmand\n\telif \[ ${file} = '"'"'Remove_of_'$tag_name_mod''"'"' \]; then\n\t\t'$tag_name_mod'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh
sed -i 's|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"Remove_of_'$tag_name_mod'\" \\\n\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/elimina_tag.sh
# VER
cp /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_nueva.sh /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_"$tag_name_mod".sh
sed -i 's|nueva|'$tag_name_mod'|g' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_"$tag_name_mod".sh
sed -i "2i$tag_name_mod()\n{\n\nsh \/usr\/bin\/.wallpaper_manager\/w_m\/categ_actions\/mis_categ\/ver_$tag_name_mod.sh\n}" /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh
sed -i 's|no_commmand|no_commmand\n\telif \[ ${file} = '"'"'Categories_viewer_'$tag_name_mod''"'"' \]; then\n\t\t'$tag_name_mod'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh
sed -i 's|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"Categories_viewer_'$tag_name_mod'\" \\\n\t\t\t\t\t'"'"'FALSE'"'"' \t\t\"\" )|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh
sed -i 's|130|'$list_size'|' /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/ver_tags.sh
echo $tag_name_mod >> /usr/bin/wallpaper_manager/w_m/categ_actions/mis_categ/"File saved in categories"
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "It has created a new category $tag_name_mod"
exit
fi
fi
	if [ $? -eq 0 ]; then
echo "You have not entered any name"
exit 0
fi
