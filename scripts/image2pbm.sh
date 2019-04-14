#!/bin/bash
#
#for file in *.* ; 
#  do mv "$file" "${file#}.webp" ; 
#done

for i in *.*;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
convert -density 300x300 -depth 8 \
-quality 100% -colorspace Gray -type grayscale \
-channel rgba -alpha set -fuzz 50% \
-fill none -opaque white \
-fill white -opaque black \
-fill black -opaque none \
-colors 256 -strip \
-alpha off -negate -threshold 1% -density 300x300 "$i" "${name}.pbm";
done

sleep 1

rm *.pgm
rm *.jpg
rm *.jpeg
rm *.JPG
rm *.JPEG
rm *.png
rm *.PNG
rm *.gif
rm *.GIF
