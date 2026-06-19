#!/bin/bash
historial()
{
sh /usr/bin/wallpaper_manager/w_m/actions/elimina_history.sh
}
animales()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_animales?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_animales
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_animales
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_animales"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_animales.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_animales" --no-wrap
     exit
     fi
}
arte()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_arte?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_arte
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_arte
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_arte"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_arte.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_arte" --no-wrap
     exit
     fi
}
autos()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_autos?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_autos
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_autos
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_autos"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_autos.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_autos" --no-wrap
     exit
     fi
}
colores()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_colores?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_colores
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_colores 
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_colores"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_colores.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_colores" --no-wrap
     exit
     fi
}
crops()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_crops?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_crops
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_crops
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_crops"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_crops.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_crops" --no-wrap
     exit
     fi
}
digitales()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_digitales?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_digitales
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_digitales 
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_digitales"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_digitales.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_digitales" --no-wrap
     exit
     fi
}
edificios()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_edificios?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_edificios
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_edificios 
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_edificios"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_edificios.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_edificios" --no-wrap
     exit
     fi
}
espacio()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_espacio?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_espacio
sed -i 's|'"$chi"'||'  ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_espacio
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_espacio"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_espacio.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_espacio" --no-wrap
     exit
     fi
}
films()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_films?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_films
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_films
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_films"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_films.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_films" --no-wrap
     exit
     fi
}
misticos()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_misticas?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_misticas
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_misticas
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_misticas"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_misticas.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_misticas" --no-wrap
     exit
     fi
}
mus()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_musica?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_musica
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_musica
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_musica"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_musica.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_musica" --no-wrap
     exit
     fi
}
ocean()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_oceano?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_oceano
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_oceano 
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_oceano"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_oceano.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_oceano" --no-wrap
     exit
     fi
}
paisajes()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_paisajes?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_paisajes
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_paisajes
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_paisajes"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_paisajes.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_paisajes" --no-wrap
     exit
     fi
}
plantas()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_plantas?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_plantas
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_plantas
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_plantas"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_plantas.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_plantas" --no-wrap
     exit
     fi
}
rios()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_rios?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_rios
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_rios 
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_rios"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_rios.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_rios" --no-wrap
     exit
     fi
}
soft()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_software?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_software
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_software
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_software"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_software.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_software" --no-wrap
     exit
     fi
}
tecno()
{
if zenity --title "Remove from the list" --question --text "Do you want to Remove the current background from tag/imagenes_tecnologia?"
then

image=$(gsettings get org.gnome.desktop.background picture-uri)
chi=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\[|\\[|g;s|\]|\\]|g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/imagenes_tecnologia
sed -i 's|'"$chi"'||' ~/.wallpaper_manager/tags/datos_fechados/datos_fechados_tecnologia
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Removed from the favorites list tag/imagenes_tecnologia"

zenity --info --title "Remove from the list" --text '<b>...Done!.</b>\nRemoved from the favorites list tag/imagenes_tecnologia.' --no-wrap
      else
zenity --info --title "Cancel" --text "No se eliminará de tag/imagenes_tecnologia" --no-wrap
     exit
     fi
}

dialogo()
{

	file=$( zenity --list --radiolist --width="150" --height="540" --title="Categorías de Imágenes" \
					--column='Pick' --column='Option'  \
					'TRUE' 		"Remove_of_animals" \
					'FALSE' 		"Remove_of_art" \
					'FALSE' 		"Remove_of_cars" \
					'FALSE' 		"Remove_of_colors" \
					'FALSE' 		"Remove_of_crops_circles" \
					'FALSE' 		"Remove_of_digital_art" \
					'FALSE' 		"Remove_of_buildings" \
					'FALSE' 		"Remove_of_space" \
					'FALSE' 		"Remove_of_movies" \
					'FALSE' 		"Remove_of_mystical" \
					'FALSE' 		"Remove_of_music" \
					'FALSE' 		"Remove_of_ocean" \
					'FALSE' 		"Remove_of_scenery" \
					'FALSE' 		"Remove_of_vegetation" \
					'FALSE' 		"Remove_of_rivers_and_lakes" \
					'FALSE' 		"Remove_of_software_images" \
					'FALSE' 		"Remove_of_technology" \
					'FALSE' 		"Remove_from_history" )
}
comando()
{
	dialogo
	if [ ${file} = 'Remove_of_animals' ]; then
		animales
	elif [ ${file} = 'Remove_of_art' ]; then
		arte
	elif [ ${file} = 'Remove_of_cars' ]; then
		autos
	elif [ ${file} = 'Remove_of_colors' ]; then
		colores
	elif [ ${file} = 'Remove_of_crops_circles' ]; then
		crops
	elif [ ${file} = 'Remove_of_digital_art' ]; then
		digitales
	elif [ ${file} = 'Remove_of_buildings' ]; then
		edificios
	elif [ ${file} = 'Remove_of_space' ]; then
		espacio
	elif [ ${file} = 'Remove_of_movies' ]; then
		films
	elif [ ${file} = 'Remove_of_mystical' ]; then
		misticos
	elif [ ${file} = 'Remove_of_music' ]; then
		mus
	elif [ ${file} = 'Remove_of_ocean' ]; then
		ocean
	elif [ ${file} = 'Remove_of_scenery' ]; then
		paisajes
	elif [ ${file} = 'Remove_of_vegetation' ]; then
		plantas
	elif [ ${file} = 'Remove_of_rivers_and_lakes' ]; then
		rios
	elif [ ${file} = 'Remove_of_software_images' ]; then
		soft
	elif [ ${file} = 'Remove_of_technology' ]; then
		tecno
	elif [ ${file} = 'Remove_from_history' ]; then
		historial
	else
		echo "No selection."
		exit 1
	fi
}

comando
exit 0
