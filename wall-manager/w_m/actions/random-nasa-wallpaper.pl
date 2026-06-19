#!/usr/bin/perl

my $theme = `gsettings get org.gnome.desktop.interface color-scheme`;
chomp $theme;

my $mode = "";

if ($theme =~ /prefer-dark/) {
    $mode = "-dark";
} else {
    $mode = "";
}

my $uri = `gsettings get org.gnome.desktop.background picture-uri"$mode"`;
chomp $uri;

print "$uri\n";

# Copyright (c) Laszlo Simon.
# This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or ( at your option) any later version.
#             
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#                            
# You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA)

# CONFIGURATION
$explonation = 'true';        # true | false
$explonation_place = 'south'; # east|north|west|south|norteast|...


$PICTURES_FOLDER = '`xdg-user-dir PICTURES`';
# INIT
if (system("xdpyinfo"))
{
  die("Can not determine screen resolution. Maybe 'xdpyinfo' not installed.\n");
} 
$explonation_width = int(`xdpyinfo | grep dimensions | cut -d':' -f2 | cut -d'p' -f1|cut -d'x' -f1 | sed 's/ //g'` * 2 / 3);
$explonation_height = int(`xdpyinfo | grep dimensions | cut -d':' -f2 | cut -d'p' -f1|cut -d'x' -f1 | sed 's/ //g'` / 10);
$width = int(`xdpyinfo | grep dimensions | cut -d':' -f2 | cut -d'p' -f1|cut -d'x' -f1 | sed 's/ //g'`);
$height = int(`xdpyinfo | grep dimensions | cut -d':' -f2 | cut -d'p' -f1|cut -d'x' -f2 | sed 's/ //g'`);

$date = sprintf("%02d",0+int(rand(8)))
        .sprintf("%02d",1+int(rand(12)))
        .sprintf("%02d",1+int(rand(28)));

if (system("wget --version"))
{
  die("'wget' should be installed.\n")
}

system("wget -O /tmp/apxxxxxx.html 'http://antwrp.gsfc.nasa.gov/apod/ap$date.html'");

# Get image

open HTML, "/tmp/apxxxxxx.html";
$content = join('',(<HTML>));
close HTML;

$content =~ /\<a\s+href\=\"((?:\w+\/)*)(\w+)(\.\w+)\"\s*\>\s*\n*\s*\<img/ims;

$path = $1;
$img = $2;
$ext = $3;

`mkdir -p $PICTURES_FOLDER/Nasa_wallpapers`;
print ">>>>http://antwrp.gsfc.nasa.gov/$path$img$ext\n";
system("wget -O $PICTURES_FOLDER/Nasa_wallpapers/$img$ext 'http://antwrp.gsfc.nasa.gov/$path$img$ext'");

# Get text

if (system("html2text -version"))
{
  warn("Explonation disabled. 'html2text' should be installed.\n");
  $explonation = 'false';
}

if (system("convert -version"))
{
  warn("Explonation disabled. 'convert' (imagemagick) should be installed. \n");
  $explonation = 'false';
}


if ($explonation eq 'true')
{
  system("html2text -style pretty -o /tmp/apxxxxxx.txt /tmp/apxxxxxx.html");
 
  open TXT, "/tmp/apxxxxxx.txt";
  $content = join('',(<TXT>));
  close TXT;

  $text = 
    ($content =~ /Explanation:\s*(.*)\s*Tomorrow\'s picture:/s)
    ? $1
    : '';

  print $text."\n";
  
  $text =~ s/\n/ /g;

  open TXT, ">/tmp/$img$ext.txt";
  print TXT $text;
  close TXT;

  system("convert $PICTURES_FOLDER/Nasa_wallpapers/$img$ext "
         ."-resize $width"."x$height\\> "
         ."-size $width"."x$height xc:black +swap "
         ."-gravity center "
         ."-composite "
         ."$PICTURES_FOLDER/Nasa_wallpapers/$img$ext"
         );

  system("convert "
         ."-background '#0008' "
         ."-fill white "
         ."-gravity northwest "
         ."-pointsize 14 "
         ."-size $explonation_width"."x$explonation_height "
         ."caption:\@/tmp/$img$ext.txt "
         ."$PICTURES_FOLDER/Nasa_wallpapers/$img$ext "
         ."+swap -gravity $explonation_place -composite "
         ."$PICTURES_FOLDER/Nasa_wallpapers/$img$ext"
         );
}

system("gsettings set org.gnome.desktop.background picture-uri'$mode' file:///$PICTURES_FOLDER/Nasa_wallpapers/$img$ext");
#`notify-send 'Info' '$text'`;
`mv /tmp/$img$ext.txt $PICTURES_FOLDER/Nasa_wallpapers/$img$ext.txt`;
`sh /usr/share/wallpaper_manager/w_m/actions/color-back1.sh`;
`sh /usr/share/wallpaper_manager/w_m/actions/color-back21.sh`; 
`echo "\nPicture URL: http://antwrp.gsfc.nasa.gov/$path$img$ext" >> $PICTURES_FOLDER/Nasa_wallpapers/$img$ext.txt`;
`echo "$PICTURES_FOLDER/Nasa_wallpapers/$img$ext.txt" >> ~/.wallpaper_manager/fondo-de-escritorio`;
