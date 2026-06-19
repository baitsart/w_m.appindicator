#!/bin/bash
ping -c 4 www.google.com > /dev/null
if [ "$?" -eq 0 ]
then
# Script #
# Eres libre de modificarlo y redistribuirlo
# por  Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart
perl /usr/share/wallpaper_manager/w_m/actions/random-nasa-wallpaper.pl  && sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
exit
fi
	if [ $? -eq 0 ]; then
notify-send "Internet connection required"
exit 0
fi
