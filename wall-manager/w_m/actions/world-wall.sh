#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

ping -c 1 -W 2 www.google.com > /dev/null 2>&1
if [ $? -ne 0 ]; then
    notify-send -i /usr/share/icons/Humanity/apps/48/vinagre.svg \
    "Internet connection required" \
    "“Current image of the planet” cannot start without connection."
    
    exit
fi

DIR="$HOME/.earth-wallpaper"
mkdir -p "$DIR"

CONFIG="$DIR/config"

if [ -f "$CONFIG" ]; then
    source "$CONFIG"
fi

# valores por defecto si no existen
MODE="${MODE:-Rectangular}"
CYCLE="${CYCLE:-1}"


########################################
# Selector de proyección
########################################
MODE=$(zenity --list \
--title="Earth Wallpaper" \
--text="Select projection" \
--radiolist \
--column="" --column="Mode" \
TRUE "Rectangular" \
FALSE "Two hemispheres")

[ $? -ne 0 ] && exit

########################################
# Selector ciclo de horas
########################################
CYCLE=$(zenity --scale \
--title="Rotation cycle" \
--text="Indicate hours\nwallpaper rotation.\n(Maximum 24h)" \
--min-value=1 \
--max-value=24 \
--value=1 \
--step=1)

[ $? -ne 0 ] && exit

[ -z "$CYCLE" ] && CYCLE=1

echo "MODE=\"$MODE\"" > "$CONFIG"
echo "CYCLE=\"$CYCLE\"" >> "$CONFIG"

zenity --question --title="Autostart" --text="Do you want this wallpaper to run at startup?"
if [ $? -eq 0 ]; then

    mkdir -p ~/.config/autostart
    cat > ~/.config/autostart/earth-wallpaper.desktop <<EOL
[Desktop Entry]
Type=Application
Name=Earth Wallpaper
Exec=/usr/share/wallpaper_manager/w_m/actions/earth-loop.sh
X-GNOME-Autostart-enabled=true
EOL

else
    rm -f ~/.config/autostart/earth-wallpaper.desktop

fi

########################################
# arrancar motor
########################################

bash /usr/share/wallpaper_manager/w_m/actions/earth-loop.sh &

while true; do

wget -q -O "$DIR/clouds_latest.gif" \
https://www.ssec.wisc.edu/data/comp/latest_moll.gif

########################################
# Calcular longitud según hora actual
########################################
H=$(date -u +%H)
M=$(date -u +%M)

TIME=$(echo "$H + $M/60" | bc -l)

OFFSET=20
#Quita # si quieres que la Tierra rote
#ROTATE=1

if [ "$ROTATE" = "1" ]; then
    LON=$(echo "$TIME * 15 - 180 + $OFFSET" | bc)
else
    LON="$OFFSET"
fi

########################################
# Generar imagen
########################################
if [[ "$MODE" == "Rectangular" ]]; then
    xplanet \
    -searchdir /usr/share/xplanet/images \
    -projection mercator \
    -longitude $LON \
    -geometry 4096x2048 \
    -num_times 1 \
    -output "$DIR/earth.jpg"

else
    AMERICA_OFFSET=-90

    LON1=$(echo "$LON + $AMERICA_OFFSET" | bc)
    LON2=$(echo "$LON1 + 180" | bc)

    xplanet \
    -searchdir /usr/share/xplanet/images \
    -projection orthographic \
    -longitude $LON1 \
    -geometry 2048x2048 \
    -num_times 1 \
    -output "$DIR/hemi1.jpg"

    xplanet \
    -searchdir /usr/share/xplanet/images \
    -projection orthographic \
    -longitude $LON2 \
    -geometry 2048x2048 \
    -num_times 1 \
    -output "$DIR/hemi2.jpg"

    convert +append "$DIR/hemi1.jpg" "$DIR/hemi2.jpg" "$DIR/earth.jpg"
fi

gsettings set org.gnome.desktop.background picture-uri"$mode" "file://$DIR/earth.jpg"
gsettings set org.gnome.desktop.background picture-options 'zoom'



pkill -f earth-loop.sh 2>/dev/null

sleep 1h
bash /usr/share/wallpaper_manager/w_m/actions/earth-loop.sh
exit 1
done


