#!/usr/bin/env bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

wall=$(gsettings get org.gnome.desktop.background picture-uri"$mode" | tr -d "'" )
wall=${wall#file://}

paths="$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"

images=()

# archivos seleccionados
if [[ -n "$paths" ]]; then
    while IFS= read -r p; do
        if [[ -f "$p" ]] && file --mime-type -b "$p" | grep -q image; then
            images+=("$p")
        fi
    done <<< "$paths"
fi

# fallback wallpaper
if [[ ${#images[@]} -eq 0 ]]; then
    [[ -f "$wall" ]] && images+=("$wall")
fi

# si no hay nada
[[ ${#images[@]} -eq 0 ]] && {
    notify-send "No image"
    exit 1
}

for img in "${images[@]}"; do
    "/usr/share/wallpaper_manager/w_m/actions/tinypic" "$img"
done
