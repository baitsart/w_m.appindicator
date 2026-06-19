#!/bin/sh

no_command()
{
echo "no command"
}
dialogo()
{
	file=$( zenity --list --radiolist --width="180" --height="130" --title="Categories of Images" \
					--column='Pick' --column='Option'  \
					'FALSE' 		"" )
}
# Inicio
comando()
{
	dialogo
	if [ ${file} = '' ]; then
		no_commmand
	else
		echo "Error e selección."
		exit 1
	fi
}
comando
exit 0

