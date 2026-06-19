#!/bin/bash

if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

image="$@"

colors=$(convert "$image" -resize 100x100 -colors 16 -depth 8 \
  -format %c histogram:info:- | \
  awk -F'[(), ]+' '
  function rgb_to_hue(r,g,b){
    r/=255; g/=255; b/=255;
    max=(r>g?r:g); max=(max>b?max:b);
    min=(r<g?r:g); min=(min<b?min:b);
    d=max-min;

    if(d==0) return -1;

    if(max==r) h=(g-b)/d;
    else if(max==g) h=2+(b-r)/d;
    else h=4+(r-g)/d;

    h*=60;
    if(h<0) h+=360;
    return h;
  }

  {
    count=$1;
    r=$3; g=$4; b=$5;

    max=(r>g?r:g); max=(max>b?max:b);
    min=(r<g?r:g); min=(min<b?min:b);
    sat=max-min;
    lum=(r+g+b)/3;

    hue = rgb_to_hue(r,g,b);

    # ignorar grises
    if(sat < 25) next;

    # 🔥 peso real: cantidad + saturación
    score = count * (sat + 10);

    printf("%f %d %d %d %d\n", score, r, g, b, hue);
  }' | \
  sort -nr | head -n 1 | \
  awk '{printf("#%02x%02x%02x\n",$2,$3,$4)}')

echo "$colors" 
echo "$colors" > ~/.config/Clementine/color_background

#gsettings set org.gnome.desktop.background primary-color "$colors"

exit
