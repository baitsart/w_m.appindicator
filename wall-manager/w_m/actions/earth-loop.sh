#!/bin/bash


if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

sleep 3

DIR="$HOME/.earth-wallpaper"
CONFIG="$DIR/config"

[ ! -f "$CONFIG" ] && exit
source "$CONFIG"

CYCLE="${CYCLE:-1}"
MODE="${MODE:-Rectangular}"

    # Verificar si el usuario cambió el fondo
    
while true; do

    image=$(gsettings get org.gnome.desktop.background picture-uri"$mode" | tr -d "'")
    if echo "$image" | grep -q -v /.earth-wallpaper\/earth.jpg; then
    rm -f ~/.config/autostart/earth-wallpaper.desktop
exit
fi

    # CHEQUEO DE INTERNET
    
ping -c 1 -W 2 www.google.com > /dev/null 2>&1
if [ $? -ne 0 ]; then
    notify-send -i /usr/share/icons/Humanity/apps/48/vinagre.svg \
    "Internet connection required" \
    "“Current image of the planet” will be updated when the indicated time has elapsed, and be connected to the internet."
    
    sleep 300
    continue
fi
    # Calcular hora y longitud
    H=$(date -u +%H)
    M=$(date -u +%M)
    TIME=$(echo "$H + $M/60" | bc -l)
    OFFSET=20
    #ROTATE=1
    
    if [ "$ROTATE" = "1" ]; then
    LON=$(echo "$TIME * 15 - 180 + $OFFSET" | bc)
else
    LON="$OFFSET"
fi

    # Generar imagen según modo
    if [[ "$MODE" == "Rectangular" ]]; then
        xplanet -searchdir /usr/share/xplanet/images \
            -projection mercator \
            -longitude $LON \
            -geometry 4096x2048 \
            -num_times 1 \
            -output "$DIR/earth.jpg"
    else
    
     AMERICA_OFFSET=-90

    LON1=$(echo "$LON + $AMERICA_OFFSET" | bc)
    LON2=$(echo "$LON1 + 180" | bc)
        xplanet -searchdir /usr/share/xplanet/images \
            -projection orthographic \
            -longitude $LON1 \
            -geometry 2048x2048 \
            -num_times 1 \
            -output "$DIR/hemi1.jpg"

        xplanet -searchdir /usr/share/xplanet/images \
            -projection orthographic \
            -longitude $LON2 \
            -geometry 2048x2048 \
            -num_times 1 \
            -output "$DIR/hemi2.jpg"

        convert +append "$DIR/hemi1.jpg" "$DIR/hemi2.jpg" "$DIR/earth.jpg"
    fi

    # Aplicar wallpaper
    gsettings set org.gnome.desktop.background picture-uri"$mode" "file://$DIR/earth.jpg"

    # Sleep en bloques de 1 hora para poder detectar cambio de fondo
    for ((i=0; i<CYCLE; i++)); do
    sleep 3600

    image=$(gsettings get org.gnome.desktop.background picture-uri"$mode" | tr -d "'")

    if echo "$image" | grep -q -v /.earth-wallpaper\/earth.jpg; then
    rm -f ~/.config/autostart/earth-wallpaper.desktop
    exit
fi
done

done


