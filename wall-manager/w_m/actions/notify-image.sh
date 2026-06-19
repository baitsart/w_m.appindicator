#!/bin/sh

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

image=$(gsettings get org.gnome.desktop.background picture-uri"$mode")

noti=$(echo "$image" | sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|g;s|'$HOME'|~|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//' )
notify-send -i /usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png "wallpaper-manager" "$noti"
