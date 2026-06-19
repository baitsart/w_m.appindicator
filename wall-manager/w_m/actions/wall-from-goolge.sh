#!/bin/bash
IMG_FOLDER=$(xdg-user-dir PICTURES)


if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

ping -c 4 www.google.com > /dev/null
if [ "$?" -eq 0 ]
then
echo "$@"
linea=$(echo "$@")
if
termino=$(zenity --entry --entry-text="$linea Wallpaper HD" --title="Image from google, by terms" --text="Enter the text" --width="470" --height="125")
then
[[ -n "$termino" ]] || termino=" Wallpaper HD"

notify-send "This will take 5 seconds" "Searching '$termino'\nGoolge images"

echo "$termino"
[[ -d "$IMG_FOLDER"/wall-from-goolge/"$termino" ]] || mkdir -p "$IMG_FOLDER"/wall-from-goolge/"$termino"
wallpaper()
{
python /usr/share/wallpaper_manager/w_m/actions/wall-from-goolge.py "$termino" > /tmp/sintecis
ls "$IMG_FOLDER"/wall-from-goolge/"$termino" > /tmp/sintecis1
cat /tmp/sintecis1 | while read line; do archivo=$(echo "$line") archivo1=$(echo "$line" | sed 's: :%20:g' ) archivo2=$(echo "$line" | sed 's:+:%2B:g;s:á:%C3%A1:g;s: :%20:g;s:é:%C3%A9:g;s:í:%C3%AD:g;s:ó:%C3%B3:g;s:ú:%C3%BA:g;s:Á:%C3%81:g;s:É:%C3%89:g;s:Í:%C3%8D:g;s:Ó:%C3%93:g;s:Ú:%C3%9A:g;s:Ü:%C3%9C:g;s:ü:%C3%BC:g' ) archivo3=$(echo "$line" | sed 's/~/\\/g' );
if
cat /tmp/sintecis | grep "$archivo"; then
sed -i '/'"$archivo"'/d' /tmp/sintecis
fi
if
cat /tmp/sintecis | grep "$archivo1"; then
sed -i '/'"$archivo1"'/d' /tmp/sintecis
fi
if
cat /tmp/sintecis | grep "$archivo2"; then
sed -i '/'"$archivo2"'/d' /tmp/sintecis
fi
if
cat /tmp/sintecis | grep "$archivo3"; then
sed -i '/'"$archivo3"'/d' /tmp/sintecis
fi; done
}

sets()
{
background()
{
downl=$(cat /tmp/sintecis)
[[ -n "$downl" ]] || wallpaper
image=$(shuf -n 1 /tmp/sintecis)
name=$(echo "$image" | tr '/' '\n' | tail -n1 | sed 's| ||g' | sed 's:%2B:+:g;s:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g;s:\\:~:g')
wget --progress=bar:force -U 'Firefox/3.0.15' "$image" -O "$IMG_FOLDER"/wall-from-goolge/"$termino"/"$name" 2>&1 | zenity --title="Downloading image...." --text="Wait a few seconds....." --width="380" --progress --auto-kill --auto-close
sed -i 's|'"$image"'||g' /tmp/sintecis
sed -i '/^$/d' /tmp/sintecis
if
file "$IMG_FOLDER"/wall-from-goolge/"$termino"/"$name" | sed 's|'"$IMG_FOLDER"'/wall-from-goolge/'"$termino"'/'"$name"'||' | grep "image"
then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/wall-from-goolge/"$termino"/"$name"
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
echo ""$IMG_FOLDER"/wall-from-goolge/"$termino"/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
else
rm "$IMG_FOLDER"/wall-from-goolge/"$termino"/"$name"
background
fi
}
background
downl=$(cat /tmp/sintecis)
[[ -n "$downl" ]] || wallpaper
image=$(shuf -n 1 /tmp/sintecis)
name=$(echo "$image" | tr '/' '\n' | tail -n1 | sed 's| ||g' | sed 's:%2B:+:g;s:%C3%A1:á:g;s:%20: :g;s:%C3%A9:é:g;s:%C3%AD:í:g;s:%C3%B3:ó:g;s:%C3%BA:ú:g;s:%C3%81:Á:g;s:%C3%89:É:g;s:%C3%8D:Í:g;s:%C3%93:Ó:g;s:%C3%9A:Ú:g;s:%C3%9C:Ü:g;s:%C3%BC:ü:g')

sleep 15s
background
sleep 2
notify-send "Done, 2 pictures in 30 seconds!"
if zenity --question --title="What do you want?" --text="You want more pictures?"; then
sets
else
rm /tmp/sintecis
rm /tmp/sintecis1
exit 1
fi
}
wallpaper
sets
rm /tmp/sintecis
rm /tmp/sintecis1
exit 0
fi
exit
fi
if [ $? -eq 0 ]; then
notify-send "Internet connection required"
exit
fi
