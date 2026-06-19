#!/bin/bash

# Detectar modo claro/oscuro
if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
else
    mode=""
fi

# Esperar hasta que haya XML
while true; do

URI=$(gsettings get org.gnome.desktop.background picture-uri"$mode")
path=$(printf "%s" "$URI" | tr -d "'" | sed 's|file://||')

case "$path" in
    *.xml)
        ;;  # sigue normalmente
    *)
        exit 0
        ;;
esac

    XML=$(gsettings get org.gnome.desktop.background picture-uri"$mode" \
          | tr -d "'" \
          | sed 's|file://||')

    case "$XML" in
        *.xml) break ;;
        *) sleep 2 ;;
    esac
done

# --- STARTTIME ---
START=$(awk '
/<starttime>/,/<\/starttime>/ {
  if ($0 ~ /<year>/) y=$0
  if ($0 ~ /<month>/) m=$0
  if ($0 ~ /<day>/) d=$0
  if ($0 ~ /<hour>/) h=$0
  if ($0 ~ /<minute>/) min=$0
  if ($0 ~ /<second>/) s=$0
}
END {
  gsub(/[^0-9]/,"",y)
  gsub(/[^0-9]/,"",m)
  gsub(/[^0-9]/,"",d)
  gsub(/[^0-9]/,"",h)
  gsub(/[^0-9]/,"",min)
  gsub(/[^0-9]/,"",s)
  printf "%s-%s-%s %s:%s:%s\n",y,m,d,h,min,s
}' "$XML")

START_EPOCH=$(date -d "$START" +%s)

# --- PARSE TIMELINE ---
timeline=()
total=0

while IFS= read -r line; do
  if [[ $line =~ \<static\> ]]; then
    read -r dline
    DUR=$(echo "$dline" | grep -oP '[0-9.]+' | cut -d. -f1)

    read -r fline
    FILE=$(printf '%s\n' "$fline" | sed -n 's:.*<file>\(.*\)</file>.*:\1:p')

    timeline+=("$total|$((total + DUR))|$FILE")
    total=$((total + DUR))
  fi

  if [[ $line =~ \<transition\> ]]; then
    read -r dline
    DUR=$(echo "$dline" | grep -oP '[0-9.]+' | cut -d. -f1)

    read -r from
    read -r to
    TO=$(echo "$to" | sed -n 's:.*<to>\(.*\)</to>.*:\1:p')

    timeline+=("$total|$((total + DUR))|$TO")
    total=$((total + DUR))
  fi

done < "$XML"

# Evitar división por 0
[ "$total" -eq 0 ] && exit 1

# --- EJECUCIÓN INICIAL ---
NOW=$(date +%s)
OFFSET=$(( (NOW - START_EPOCH) % total ))

last=""

for entry in "${timeline[@]}"; do
    IFS="|" read -r S E FILE <<< "$entry"

    if (( OFFSET >= S && OFFSET < E )); then
        if [[ -f "$FILE" ]]; then
            bash /usr/share/wallpaper_manager/w_m/actions/color-back21.sh "$FILE"
            echo "$FILE" > ~/.config/Clementine/color_background
            last="$FILE"
        fi
        break
    fi
done

# --- LOOP ---
while true; do
  NOW=$(date +%s)
  OFFSET=$(( (NOW - START_EPOCH) % total ))

  for entry in "${timeline[@]}"; do
    IFS="|" read -r S E FILE <<< "$entry"

    if (( OFFSET >= S && OFFSET < E )); then
      if [[ "$FILE" != "$last" && -f "$FILE" ]]; then
        bash /usr/share/wallpaper_manager/w_m/actions/color-back21.sh "$FILE"
        echo "$FILE" > ~/.picture_back_color
        last="$FILE"
      fi

      sleep $((E - OFFSET))
      break
    fi
  done
done
