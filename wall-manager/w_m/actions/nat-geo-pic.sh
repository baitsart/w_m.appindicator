#!/bin/bash
IMG_FOLDER=$(xdg-user-dir PICTURES)


if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'prefer-dark'; then 
    mode="-dark"
    else
    mode=""
fi

animals()
{
sitio=$(echo "http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=2
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=3
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=4
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=5
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=6
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=7
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=8
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=9
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=10
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=11
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=12
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=13
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=14
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=15
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=16
http://photography.nationalgeographic.com/photography/photo-of-the-day/animals/?page=17
http://animals.nationalgeographic.com/animals/photos/"| shuf -n 1)
wget -O /tmp/photo-of-the-day.html "$sitio"
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/Animals | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/Animals ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/Animals
cd "$IMG_FOLDER"/National_Geographic/Animals
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/Animals/"$name"
echo "$IMG_FOLDER"/National_Geographic/Animals/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
adventure_exploration()
{
sitio=$(echo "http://photography.nationalgeographic.com/photography/photo-of-the-day/adventure-exploration/
http://photography.nationalgeographic.com/photography/photo-of-the-day/adventure-exploration/?page=2
http://photography.nationalgeographic.com/photography/photo-of-the-day/adventure-exploration/?page=3
http://adventure.nationalgeographic.com/adventure/adventure-photos/"| shuf -n 1)
wget -O /tmp/photo-of-the-day.html "$sitio"
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/"Adventure and Exploration" | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/"Adventure and Exploration" ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/"Adventure and Exploration"
cd "$IMG_FOLDER"/National_Geographic/"Adventure and Exploration"
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/"Adventure and Exploration"/"$name"
echo "$IMG_FOLDER"/National_Geographic/Adventure and Exploration/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
black_white()
{
sitio=$(echo "http://photography.nationalgeographic.com/photography/photo-of-the-day/black-white/
http://photography.nationalgeographic.com/photography/photo-of-the-day/black-white/?page=2
http://photography.nationalgeographic.com/photography/photo-of-the-day/black-white/?page=3"| shuf -n 1)
wget -O /tmp/photo-of-the-day.html "$sitio"
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/"Black and White" | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/"Black and White" ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/"Black and White"
cd "$IMG_FOLDER"/National_Geographic/"Black and White"
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/"Black and White"/"$name"
echo "$IMG_FOLDER"/National_Geographic/Black and White/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
history()
{
sitio=$(echo "http://photography.nationalgeographic.com/photography/photo-of-the-day/history/
http://photography.nationalgeographic.com/photography/photo-of-the-day/history/?page=2"| shuf -n 1)
wget -O /tmp/photo-of-the-day.html "$sitio"
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/History | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/History ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/History
cd "$IMG_FOLDER"/National_Geographic/History
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/History/"$name"
echo "$IMG_FOLDER"/National_Geographic/History/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
landscapes()
{
sitio=$(echo "http://photography.nationalgeographic.com/photography/photo-of-the-day/landscapes/
http://photography.nationalgeographic.com/photography/photo-of-the-day/landscapes/?page=2
http://photography.nationalgeographic.com/photography/photo-of-the-day/landscapes/?page=3
http://photography.nationalgeographic.com/photography/photo-of-the-day/landscapes/?page=4
http://photography.nationalgeographic.com/photography/photo-of-the-day/landscapes/?page=5
http://photography.nationalgeographic.com/photography/photo-of-the-day/landscapes/?page=6
http://photography.nationalgeographic.com/photography/photo-of-the-day/landscapes/?page=7
http://photography.nationalgeographic.com/photography/photo-of-the-day/landscapes/?page=8
http://photography.nationalgeographic.com/photography/photo-of-the-day/landscapes/?page=9"| shuf -n 1)
wget -O /tmp/photo-of-the-day.html "$sitio"
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/Landscapes | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/Landscapes ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/Landscapes
cd "$IMG_FOLDER"/National_Geographic/Landscapes
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/Landscapes/"$name"
echo "$IMG_FOLDER"/National_Geographic/Landscapes/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
nature_weather()
{
sitio=$(echo "http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=2
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=3
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=4
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=5
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=6
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=7
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=8
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=9
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=10
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=11
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=12
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=13
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=14
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=15
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=16
http://photography.nationalgeographic.com/photography/photo-of-the-day/nature-weather/?page=17"| shuf -n 1)
wget -O /tmp/photo-of-the-day.html "$sitio"
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/"Nature and Weather" | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/"Nature and Weather" ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/"Nature and Weather"
cd "$IMG_FOLDER"/National_Geographic/"Nature and Weather"
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/"Nature and Weather"/"$name"
echo "$IMG_FOLDER"/National_Geographic/Nature and Weather/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
people_culture()
{
sitio=$(echo "http://photography.nationalgeographic.com/photography/photo-of-the-day/people-culture/
http://photography.nationalgeographic.com/photography/photo-of-the-day/people-culture/?page=2
http://photography.nationalgeographic.com/photography/photo-of-the-day/people-culture/?page=3
http://photography.nationalgeographic.com/photography/photo-of-the-day/people-culture/?page=4
http://photography.nationalgeographic.com/photography/photo-of-the-day/people-culture/?page=5
http://photography.nationalgeographic.com/photography/photo-of-the-day/people-culture/?page=6
http://photography.nationalgeographic.com/photography/photo-of-the-day/people-culture/?page=7
http://photography.nationalgeographic.com/photography/photo-of-the-day/people-culture/?page=8
http://photography.nationalgeographic.com/photography/photo-of-the-day/people-culture/?page=9
http://photography.nationalgeographic.com/photography/photo-of-the-day/people-culture/?page=10
http://photography.nationalgeographic.com/photography/photo-of-the-day/people-culture/?page=11"| shuf -n 1)
wget -O /tmp/photo-of-the-day.html "$sitio"
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/"People and Culture" | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/"People and Culture" ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/"People and Culture"
cd "$IMG_FOLDER"/National_Geographic/"People and Culture"
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/"People and Culture"/"$name"
echo "$IMG_FOLDER"/National_Geographic/People and Culture/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
science_space()
{
sitio=$(echo "http://photography.nationalgeographic.com/photography/photo-of-the-day/science-space/")
wget -O /tmp/photo-of-the-day.html "$sitio"
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/"Science and Space" | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/"Science and Space" ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/"Science and Space"
cd "$IMG_FOLDER"/National_Geographic/"Science and Space"
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/"Science and Space"/"$name"
echo "$IMG_FOLDER"/National_Geographic/Science and Space/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
travel()
{
sitio=$(echo "http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=2
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=3
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=4
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=5
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=6
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=7
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=8
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=9
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=10
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=11
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=12
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=13
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=14
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=15
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=16
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=17
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=18
http://photography.nationalgeographic.com/photography/photo-of-the-day/travel/?page=19
http://travel.nationalgeographic.com/travel/travel-photos/"| shuf -n 1)
wget -O /tmp/photo-of-the-day.html "$sitio"
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | sed '/<img src=\"cache/d' | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/Travel | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/Travel ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/Travel
cd "$IMG_FOLDER"/National_Geographic/Travel
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/Travel/"$name"
echo "$IMG_FOLDER"/National_Geographic/Travel/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
underwater()
{
sitio=$(echo "http://photography.nationalgeographic.com/photography/photo-of-the-day/underwater/
http://photography.nationalgeographic.com/photography/photo-of-the-day/underwater/?page=2
http://photography.nationalgeographic.com/photography/photo-of-the-day/underwater/?page=3
http://photography.nationalgeographic.com/photography/photo-of-the-day/underwater/?page=4"| shuf -n 1)
wget -O /tmp/photo-of-the-day.html "$sitio"
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/Underwater | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/Underwater ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/Underwater
cd "$IMG_FOLDER"/National_Geographic/Underwater
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/Underwater/"$name"
echo "$IMG_FOLDER"/National_Geographic/Underwater/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
archive()
{
sitio=$(echo "http://photography.nationalgeographic.com/photography/photo-of-the-day/archive/
http://photography.nationalgeographic.com/photography/photo-of-the-day/archive/?page=2
http://photography.nationalgeographic.com/photography/photo-of-the-day/archive/?page=3"| shuf -n 1)
wget -O /tmp/photo-of-the-day.html "$sitio"
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/"Archive by Date" | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/"Archive by Date" ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/"Archive by Date"
cd "$IMG_FOLDER"/National_Geographic/"Archive by Date"
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/"Archive by Date"/"$name"
echo "$IMG_FOLDER"/National_Geographic/Archive by Date/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
best_of_the_day()
{
wget -O /tmp/photo-of-the-day.html http://photography.nationalgeographic.com/photography/best-of-photo-of-the-day/
if grep -q "More From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
if grep -q "More Photography From National Geographic" /tmp/photo-of-the-day.html ; then
num=$(grep -n "More Photography From National Geographic" /tmp/photo-of-the-day.html | cut -d ':' -f1)
head -n"$num" /tmp/photo-of-the-day.html >  /tmp/photo-of-the-day.html1
mv  /tmp/photo-of-the-day.html1  /tmp/photo-of-the-day.html
fi
cat /tmp/photo-of-the-day.html | grep "60x45.jpg"  | sed 's/60x45/990x742/g' > /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "100x75.jpg"  | sed 's/100x75/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "160x120.jpg"  | sed 's/160x120/990x742/g' >> /tmp/pictures_natgeo
cat /tmp/photo-of-the-day.html | grep "600x450.jpg"  | sed 's/600x450/990x742/g' >> /tmp/pictures_natgeo
ls "$IMG_FOLDER"/National_Geographic/"Best of Photo of the Day" | while read line; do archivo=$(echo "$line" | tr '/' '\n' | tail -n1); if grep -q "$archivo" /tmp/pictures_natgeo; then sed -i '/'"$archivo"'/d' /tmp/pictures_natgeo; fi; done
picture=$(cat /tmp/pictures_natgeo | shuf -n 1  | sed 's|<img src=\"//||g;s|<img src=\"||g;s|</a>		||g;s|\t||g;s| ||g' | cut -d'"' -f1| sed 's|/overrides/|/cache/|')
		if [ -n "$picture" ]; then
name=$(echo "$picture" | tr '/' '\n' | tail -n1)

[[ -d "$IMG_FOLDER"/National_Geographic/"Best of Photo of the Day" ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic/"Best of Photo of the Day"
cd "$IMG_FOLDER"/National_Geographic/"Best of Photo of the Day"
wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/"Best of Photo of the Day"/"$name"
echo "$IMG_FOLDER"/National_Geographic/Best of Photo of the Day/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/pictures_natgeo
rm /tmp/photo-of-the-day.html
fi
}
photo_day()
{
wget -O /tmp/photo-of-the-day.html http://photography.nationalgeographic.com/photography/photo-of-the-day/
picture=$(cat /tmp/photo-of-the-day.html | grep "<meta name=\"twitter:image\" content" | sed 's|                    <meta name="twitter:image" content=\"//||g;s|\"/>||')
name=$(echo "$picture" | tr '/' '\n' | tail -n1)
if
ls "$IMG_FOLDER"/National_Geographic/ | grep "$name" ; then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/"$name"
echo "$IMG_FOLDER"/National_Geographic/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio
 
sleep 2
notify-send "Photo_of_the_today_(1_per_day)" "Already downloaded the photo of the day\nYou can try with another category"
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
rm /tmp/photo-of-the-day.html
exit 0
fi
[[ -d "$IMG_FOLDER"/National_Geographic ]] || mkdir -p  "$IMG_FOLDER"/National_Geographic
cd "$IMG_FOLDER"/National_Geographic

wget "$picture" -O "$name"
temp=$(stat -c%s "$name")
		if [[ $temp > 1000 ]]
			then
gsettings set org.gnome.desktop.background picture-uri"$mode" file:///"$IMG_FOLDER"/National_Geographic/"$name"
echo "$IMG_FOLDER"/National_Geographic/"$name"" >> ~/.wallpaper_manager/fondo-de-escritorio

sleep 2
sh /usr/share/wallpaper_manager/w_m/actions/notify-image.sh
sh /usr/share/wallpaper_manager/w_m/actions/ir-prev.sh
fi
rm /tmp/photo-of-the-day.html
}

dialoga()
{

	file=$( zenity --list --radiolist --text="Pick a theme, to download" --width="310" --height="420" --title="NatGeo" --window-icon="/usr/share/wallpaper_manager/w_m/iconos/nat_geo-logo.png" --ok-label="Download" --cancel-label="Quit" \
					--column='(   *   )' --column='Categories'   \
					'TRUE' 		"Animals" \
					'FALSE' 		"Adventure_and_Exploration" \
					'FALSE' 		"Black_and_White" \
					'FALSE' 		"History" \
					'FALSE' 		"Landscapes" \
					'FALSE' 		"Nature_and_Weather" \
					'FALSE' 		"People_and_Culture" \
					'FALSE' 		"Science_and_Space" \
					'FALSE' 		"Travel" \
					'FALSE' 		"Underwater" \
					'FALSE' 		"Archive_by_Date" \
					'FALSE' 		"Best_of_Photo_of_the_Day" \
					'FALSE' 		"Photo_of_the_today_(1_per_day)" )
}

comand()
{
	dialoga
	if [ ${file} = 'Animals' ]; then
		animals
	elif [ ${file} = 'Adventure_and_Exploration' ]; then
		adventure_exploration
	elif [ ${file} = 'Black_and_White' ]; then
		black_white
	elif [ ${file} = 'History' ]; then
		history
	elif [ ${file} = 'Landscapes' ]; then
		landscapes
	elif [ ${file} = 'Nature_and_Weather' ]; then
		nature_weather
	elif [ ${file} = 'People_and_Culture' ]; then
		people_culture
	elif [ ${file} = 'Science_and_Space' ]; then
		science_space
	elif [ ${file} = 'Travel' ]; then
		travel
	elif [ ${file} = 'Underwater' ]; then
		underwater
	elif [ ${file} = 'Archive_by_Date' ]; then
		archive
	elif [ ${file} = 'Best_of_Photo_of_the_Day' ]; then
		best_of_the_day
	elif [ ${file} = 'Photo_of_the_today_(1_per_day)' ]; then
		photo_day		
	else
		echo "Error en selección."
		exit 1
	fi
}
ping -c 4 www.google.com > /dev/null
if [ "$?" -eq 0 ]
then
comand
exit 0
fi
if [ $? -eq 0 ]; then
notify-send "Internet connection required"
exit
fi
