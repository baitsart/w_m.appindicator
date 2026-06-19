#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

# Script #
# Eres libre de modificarlo y redistribuirlo
# por  Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart

chi=$(gsettings get org.gnome.desktop.background picture-uri"$mode")

image=$(echo "$chi"| sed 's|'"'"'file://||g;s|\"file://||g;s|///|/|g;s|//|/|' | sed 's:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g' | sed 's/.$//')

image=$(printf '%b\n' "${image//%/\\x}")

echo "$image"

if [ ! -f "$image" ]; then
    notify-send "Error" "No se encontró la imagen"
    exit 1
fi

# Modificar "-scale 640x480", por la configuración de grub, que usted tenga. Ver en: /etc/default/grub linea 25: #GRUB_GFXMODE="640x480", para saber su configuración.
convert -scale 640x480 "$image" /tmp/image-background.jpg
# Opcional
# convert -colors 14 -scale 640x480 "$image" /tmp/image-background.jpg
pkexec sh -c "
mv /tmp/image-background.jpg /boot/grub
chmod 644 /boot/grub/background.jpg &&
update-grub2
"

notify-send "Hecho!" "El fondo de escritorio es la imagen del grub"

exit 0
