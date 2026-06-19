#!/bin/sh

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode")
echo "$chi" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\\||g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//' >> ~/.wallpaper_manager/historial
tail -n 100 ~/.wallpaper_manager/historial > ~/.wallpaper_manager/.historial
mv ~/.wallpaper_manager/.historial ~/.wallpaper_manager/historial

sed -i '/^$/d' ~/.wallpaper_manager/historial
echo "`date +%x`	$chi" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's|\\||g' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//' >> ~/.wallpaper_manager/tags/datos_fechados/historial_fechado
cat ~/.wallpaper_manager/tags/datos_fechados/historial_fechado | awk '!array_temp[$0]++' > ~/.wallpaper_manager/.historial_fechado
mv ~/.wallpaper_manager/.historial_fechado ~/.wallpaper_manager/tags/datos_fechados/historial_fechado

sed -i '/^$/d' ~/.wallpaper_manager/tags/datos_fechados/historial_fechado
