#!/bin/sh


USER_NAME="${SUDO_USER:-$(logname 2>/dev/null)}"
USER_HOME=$(getent passwd "$USER_NAME" | cut -d: -f6)
image_folder=$(grep '^XDG_PICTURES_DIR' "$USER_HOME/.config/user-dirs.dirs" \
| cut -d'=' -f2 \
| tr -d '"' \
| sed "s|\$HOME|$USER_HOME|")

USER_HOME=$(getent passwd "$USER_NAME" | cut -d: -f6)
image_folder=$(grep '^XDG_PICTURES_DIR' "$USER_HOME/.config/user-dirs.dirs" \
| cut -d'=' -f2 \
| tr -d '"' \
| sed "s|\$HOME|$USER_HOME|")

sed -i 's|/usr/share/icons/gnome/32x32/apps/preferences-desktop-wallpaper.png|/usr/share/wallpaper_manager/w_m/iconos/wallpaper-manager.png|' /usr/share/wallpaper_manager/w_m/wm-app-indicador
chmod +x /usr/share/wallpaper_manager/w_m/wm-app-indicador

idioma=$(echo $LANG | cut -d'.' -f1)
sed -i 's|es_UY|'$idioma'|g' /usr/share/wallpaper_manager/w_m/wm-app-indicador.desktop
sed -i 's|es_UY|'$idioma'|g' /usr/share/wallpaper_manager/w_m/app-panel/w_m-speech-reco.sh-1.desktop /usr/share/wallpaper_manager/w_m/app-panel/nasa-wall-en-historial.sh.desktop /usr/share/wallpaper_manager/w_m/app-panel/nat-geo-pic.sh.desktop
sed -i 's|es_UY|'$idioma'|g' /usr/share/wallpaper_manager/w_m/wallpaper_manager.desktop

mkdir -p $USER_HOME/.local/share/nautilus/scripts
cp /usr/share/wallpaper_manager/w_m/wallpaper-manager $USER_HOME/.local/share/nautilus/scripts/wallpaper-manager
cp "/usr/share/wallpaper_manager/w_m/Picture wallpaper" "$USER_HOME/.local/share/nautilus/scripts/Picture wallpaper"
chown $USER_NAME:$USER_NAME $USER_HOME/.local/share/nautilus/scripts/wallpaper-manager
chown $USER_NAME:$USER_NAME "$USER_HOME/.local/share/nautilus/scripts/Picture wallpaper"
chmod +x $USER_HOME/.local/share/nautilus/scripts/wallpaper-manager
chmod +x "$USER_HOME/.local/share/nautilus/scripts/Picture wallpaper"
mkdir -p "$USER_HOME/.xplanet/config"
echo "[earth]
cloud_map=$USER_HOME/.earth-wallpaper/clouds_latest.gif
cloud_ssec=true" > "$USER_HOME/.xplanet/config/default"

cp /usr/share/wallpaper_manager/"Readme\"Speech recognition commands\"" $USER_HOME/.wallpaper_manager/"Readme\"Speech recognition commands\""
if [ -f $USER_HOME/.wallpaper_manager/colors-list  ]; then
echo ""
else
echo "#4d575e	~'blue-gray'
#228b7a1e2a01	~'green'
#afe37cfe3614	~'mystic orange'
#afe37cfe3614	~'soft orange'
#67183614afe3	~'bright violet'
#54fd9ab0bfa7	~'celestial'
#724d72	~'Electronic violet'
#6c5b4a	~'light brown'
#363819	~'green olive'
#63637070d0d0	~'Maya blue'
#023c88	~'blue presice'" > $USER_HOME/.wallpaper_manager/colors-list
fi 

chown -R $USER_NAME:$USER_NAME /usr/share/wallpaper_manager/w_m
cp /usr/share/wallpaper_manager/LEEME $USER_HOME/.wallpaper_manager/
cp /usr/share/wallpaper_manager/README $USER_HOME/.wallpaper_manager
chmod +x /usr/bin/wallpaper-manager

mkdir -p "$USER_HOME/.wallpaper_manager/tags/datos_fechados/"

chown -R $USER_NAME:$USER_NAME $USER_HOME/.wallpaper_manager

echo "
            * wallpaper-manger *                

The script already coordinated with the name
user of your computer. And copied to the:
$USER_HOME/.local/share/nautilus/scripts/wallpaper-manager, 
and so you can throw the right-click menu in option:
Scripts, wallpaper-manager!

This folder is copied to $USER_HOME/.wallpaper-manager
to have data files stored separated from
your everyday files. And you can Remove it
from nautilus-scripts, if not wants to have
it in the right click menu. So might as well
just throw it in the place:

/usr/share/wallpaper_manager/w_m/wallpaper-manager
/usr/share/wallpaper_manager/w_m/wm-app-indicador
/usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco.sh
And also in Applications menu.

To install Video wall, dependencies, run:

sudo apt install git make gcc libx11-dev

git push https://github.com/mmhobi7/xwinwrap.git

cd xwinwrap
make
sudo make install

Use:
The command line function « w-m --help »
"
cp -r /usr/share/wallpaper_manager/wall-manager/* /usr/share/wallpaper_manager/


if [ -d $USER_HOME/.config/autostart ]; then
cp /usr/share/wallpaper_manager/w_m/wm-app-indicador.desktop $USER_HOME/.config/autostart/

chown $USER_NAME:$USER_NAME $USER_HOME/.config/autostart/wm-app-indicador.desktop
fi

rm -rf /usr/share/wallpaper_manager/wall-manager/
rm -rf /usr/share/wallpaper_manager/Dependencies
rm -f "/usr/share/wallpaper_manager/w_m/Picture wallpaper"

rm -f /usr/share/wallpaper_manager/install.sh
exit
fi
fi

