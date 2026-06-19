#!/bin/sh

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode")
echo "$chi" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//' >> ~/.wallpaper_manager/buenas_imagenes
sed -i '/^$/d' ~/.wallpaper_manager/buenas_imagenes
awk '!array_temp[$0]++' ~/.wallpaper_manager/buenas_imagenes > ~/.wallpaper_manager/.buenas_imagenes
mv  ~/.wallpaper_manager/.buenas_imagenes  ~/.wallpaper_manager/buenas_imagenes
echo "`date +%x`	$chi" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//' >> ~/.wallpaper_manager/tags/datos_fechados/buenas_imagenes_fechado
cat ~/.wallpaper_manager/tags/datos_fechados/buenas_imagenes_fechado | awk '!array_temp[$0]++' > ~/.wallpaper_manager/tags/datos_fechados/.buenas_imagenes_fechado
mv ~/.wallpaper_manager/tags/datos_fechados/.buenas_imagenes_fechado  ~/.wallpaper_manager/tags/datos_fechados/buenas_imagenes_fechado

sed -i '/^$/d' ~/.wallpaper_manager/tags/datos_fechados/buenas_imagenes_fechado
notify-send -i /usr/share/icons/gnome/32x32/actions/gtk-save.png "wallpaper-manager" "Image save in backgrounds list"
