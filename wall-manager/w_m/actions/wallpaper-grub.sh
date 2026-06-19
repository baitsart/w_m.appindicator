#!/bin/bash

#-----------------------------------------------------------------------------#
#                           * wallpaper-on-grub *                             #
#-----------------------------------------------------------------------------#
# Éste script rastreará su imagen de fondo de escritorio, y la pondrá como
#  imagen en el cargador de arranque de grub2
# Debes ejecutar "wallpaper-grub" con doble clic, o desde la terminal puedes
# ejecutar directamente wall_grub2_setup.sh.
# No debes mover de ésta carpeta los script, pero puedes renombrar la carpeta
# si deseas, por ej. con un punto . delante , para que sea un archivo
# invisible, y puedes moverla a donde desees.
# Para tenerlo en /usr/bin, y poderlo ejecutar desde la terminal, debes copiar
# wall_grub2_setup.sh, a /usr/bin con estos comandos:
# cd */wallpaper-on-grub
# sudo cp ./wall_grub2_setup.sh  /usr/bin/wallpaper-grub
# Y podrás ejecutar directamente el comando wallpaper-grub.
# Y para usarlo en nautilus-scripts,  remplace en el script wallpaper-grub.sh ,
# todo exepto #!/bin/bash , y escriba esto:
# gnome-terminal -e wallpaper-grub
# si es que lo copió a /usr/bin/
# si no lo copió a /usr/bin/, escriba esto:
# gnome-terminal -e /ruta/a/wallpaper-on-grub/wall_grub2_setup.sh
# Si deseas eliminar el wallpaper del grub puedes ejecutar éste comando
# sudo rm /boot/grub/image-background.jpg
# Eres libre de modificarlo y redistribuirlo.
#  por  Rodrigo Esteves baitsart@gmail.com www.youtube.com/user/baitsart
# Disfrútalo !!!

gnome-terminal --hide-menubar --geometry=60x18 -e /usr/share/wallpaper_manager/w_m/actions/wall_grub2_setup.sh
