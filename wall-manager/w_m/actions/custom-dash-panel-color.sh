#!/bin/bash

COLOR=$(cat ~/.config/Clementine/color_background)

gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color true
gsettings set org.gnome.shell.extensions.dash-to-dock background-color "$COLOR"
