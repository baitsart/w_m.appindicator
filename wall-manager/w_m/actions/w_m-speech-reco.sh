#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

ping -c 4 www.google.com > /dev/null
if [ "$?" -eq 0 ]
then
FROM="en"
microphe_port=1
# You can modify the microphone port for the port number, of your election
pacmd set-source-port "$microphe_port" 'analog-input-microphone'
rec -r 16000 -c 1 -t flac  /tmp/grabacion.flac 2>&1 | awk -vRS="\r" '$1 ~ /In/ {gsub(/In:/," ");gsub(/%\)/," ");gsub(/ \(/," ");print $3"\n# Speech recognition.\\n\\nClose this window\\nto end the recording.\\n\\nTime:\\t"$2"\\nSize :\\t"$4; fflush();}' | zenity --window-icon="/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" --progress --pulsate --no-cancel --auto-kill --auto-close --width="255" --height="190" --title=" Recording..."
# | notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" " Recording..." 
pacmd set-source-port "$microphe_port" 'analog-input-microphone-internal'

key="ENTER-YOUR-KEY"
curl -s -X POST \
--data-binary @/tmp/grabacion.flac \
--header 'Content-Type: audio/x-flac; rate=16000;' \
'https://www.google.com/speech-api/v2/recognize?output=json&lang='$FROM'&key='$key'' | cut -d\" -f8 > /tmp/temp_line
habla=$(cat /tmp/temp_line)
if echo "$habla" | grep -q "Your client does not have permission to get URL" ; then
if new_key=$( zenity --entry --text="The key to google speech-api/v2, must be updated.\nPlease enter a new correct key.\nOtherwise the process can not be made" --title="speech-api new key"); then
if
curl -s -X POST \
--data-binary @/tmp/grabacion.flac \
--header 'Content-Type: audio/x-flac; rate=16000;' \
'https://www.google.com/speech-api/v2/recognize?output=json&lang='$FROM'&key='$new_key'' | grep "Your client does not have permission to get URL" ; then
notify-send "Wrong Password Message :" "Your client does not have permission to get URL"
exit 0
fi
sed -i 's/'"$key"'/'"$new_key"'/' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco.sh
sh /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco.sh
exit 1
fi
exit
fi
echo "$habla"
CMD_SEARCH=$(sed -n '1p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_HISTORY=$(sed -n '2p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_OPEN_PLACE=$(sed -n '3p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_OPEN_FILE=$(sed -n '4p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_CHANGE_IMAGE=$(sed -n '5p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_SAME_FOLD=$(sed -n '6p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_PREVIOUS=$(sed -n '7p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_NEXT=$(sed -n '8p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_FAV_LAUNCH=$(sed -n '9p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_FAV_SAVE=$(sed -n '10p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_ANIM_LAUNCH=$(sed -n '11p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_ART_LAUNCH=$(sed -n '12p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_CAR_LAUNCH=$(sed -n '13p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_COLOR_LAUNCH=$(sed -n '14p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_CROPS_LAUNCH=$(sed -n '15p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_DIGI_LAUNCH=$(sed -n '16p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_BILDS_LAUNCH=$(sed -n '17p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_SPACE_LAUNCH=$(sed -n '18p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_FILMS_LAUNCH=$(sed -n '19p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_MYSTIC_LAUNCH=$(sed -n '20p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_MUSIC_LAUNCH=$(sed -n '21p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_OCEAN_LAUNCH=$(sed -n '22p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_SCENERY_LAUNCH=$(sed -n '23p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_VEGE_LAUNCH=$(sed -n '24p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_RIVERS_LAUNCH=$(sed -n '25p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_SOFT_LAUNCH=$(sed -n '26p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_TECNO_LAUNCH=$(sed -n '27p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_ANIM_SAVE=$(sed -n '28p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_ART_SAVE=$(sed -n '29p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_CAR_SAVE=$(sed -n '30p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_COLOR_SAVE=$(sed -n '31p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_CROPS_SAVE=$(sed -n '32p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_DIGI_SAVE=$(sed -n '33p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_BILDS_SAVE=$(sed -n '34p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_SPACE_SAVE=$(sed -n '35p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_FILMS_SAVE=$(sed -n '36p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_MYSTIC_SAVE=$(sed -n '37p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_MUSIC_SAVE=$(sed -n '38p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_OCEAN_SAVE=$(sed -n '39p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_SCENERY_SAVE=$(sed -n '40p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_VEGE_SAVE=$(sed -n '41p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_RIVERS_SAVE=$(sed -n '42p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_SOFT_SAVE=$(sed -n '43p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_TECNO_SAVE=$(sed -n '44p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_MODE_ZOOM=$(sed -n '45p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_MODE_CENTERED=$(sed -n '46p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_MODE_SCALED=$(sed -n '47p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_MODE_MOSAIC=$(sed -n '48p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_MODE_STRETCHED=$(sed -n '49p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_INVERT_COLORS=$(sed -n '50p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_BLACK_AND_WHITE=$(sed -n '51p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_PASTE_TEXT=$(sed -n '52p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_NATURAL_COLOR=$(sed -n '53p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_ONLY_COLOR=$(sed -n '54p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_NASA_WALL=$(sed -n '55p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_NOTIFY=$(sed -n '56p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_DOWNLOAD=$(sed -n '57p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_NAT_GEO=$(sed -n '58p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)
CMD_SATELLITE=$(sed -n '59p' /usr/share/wallpaper_manager/w_m/actions/w_m-speech-reco_cmd-"$FROM" | cut -d '=' -f 2)

recog=$(echo "$habla" | grep "$CMD_SEARCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/search.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_HISTORY" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/historial.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_OPEN_PLACE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/open-place.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_OPEN_FILE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/open_file.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_CHANGE_IMAGE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/image.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_SAME_FOLD" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/lanzar-folder.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_PREVIOUS" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/prev.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_NEXT" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/prev-next.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_FAV_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/image-buenas.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_FAV_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/guarda.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_ANIM_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-animales.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_ART_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-arte.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_CAR_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-autos.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_COLOR_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-colores.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_CROPS_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-crops.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_DIGI_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-digitales.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_BILDS_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-edificios.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_SPACE_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-espacio.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_FILMS_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-films.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_MYSTIC_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-misticos.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_MUSIC_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-musica.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_OCEAN_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-oceano.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_SCENERY_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-paisajes.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_VEGE_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-plantas.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_RIVERS_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-rios.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_SOFT_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-software.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_TECNO_LAUNCH" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/lanzar-tecnologia.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_ANIM_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_animales.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_ART_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_arte.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_CAR_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_autos.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_COLOR_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_colores.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_CROPS_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_crops.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_DIGI_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_digitales.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_BILDS_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_edificios.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_SPACE_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_espacio.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_FILMS_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_films.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_MYSTIC_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_misticos.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_MUSIC_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_musica.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_OCEAN_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_oceano.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_SCENERY_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_paisajes.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_VEGE_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_plantas.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_RIVERS_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_rios.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_SOFT_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_soft.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_TECNO_SAVE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/categ_actions/guarda_tecnologi.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_MODE_ZOOM" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		gsettings set org.gnome.desktop.background picture-options 'zoom'
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_MODE_CENTERED" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		gsettings set org.gnome.desktop.background picture-options 'centered'
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_MODE_SCALED" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		gsettings set org.gnome.desktop.background picture-options 'scaled'
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_MODE_MOSAIC" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		gsettings set org.gnome.desktop.background picture-options 'wallpaper'
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_MODE_STRETCHED" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		gsettings set org.gnome.desktop.background picture-options 'stretched'
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_INVERT_COLORS" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/complementari.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_BLACK_AND_WHITE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/black-and-white.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_PASTE_TEXT" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		echo "$habla" | sed 's|'"$CMD_PASTE_TEXT"'||' > /tmp/texto_pegado_temp && sh /usr/share/wallpaper_manager/w_m/actions/text-to-image.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_NATURAL_COLOR" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/color-back1.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_ONLY_COLOR" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		gsettings set org.gnome.desktop.background picture-uri"$mode" file:///$HOME/.wallpaper_manager/colors-list && sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog_i=$(echo "$habla" | grep "$CMD_NASA_WALL" )
	if [ "$recog_i" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/nasa-wall-en-historial.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_NOTIFY" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_DOWNLOAD" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		/bin/bash /usr/share/wallpaper_manager/w_m/actions/wall-from-goolge.sh "`echo "$habla" | sed 's|'"$CMD_DOWNLOAD"'||g'`"
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_NAT_GEO" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		/bin/bash /usr/share/wallpaper_manager/w_m/actions/nat-geo-pic.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
recog=$(echo "$habla" | grep "$CMD_SATELLITE" )
	if [ "$recog" != "" ]
	then
		notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-on.png" "$habla"
		/bin/bash /usr/share/wallpaper_manager/w_m/actions/world-wall.sh
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit
fi
notify-send -i "/usr/share/icons/hicolor/48x48/apps/audio-recorder-off.png" "No command:" "$habla"
rm /tmp/grabacion.flac
rm /tmp/temp_line
exit 1
fi

	if [ $? -eq 0 ]; then
notify-send "Internet connection required"
exit
fi
fi
