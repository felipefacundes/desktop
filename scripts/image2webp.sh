#!/bin/bash
#
#for file in *.* ; 
#  do mv "$file" "${file#}.webp" ; 
#done

for i in *.*;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  convert -density 300 -quality 85% "$i" "${name}.webp";
done

sleep 1

rm *.jpg
rm *.jpeg
rm *.JPG
rm *.JPEG
rm *.png
rm *.PNG
rm *.gif
rm *.GIF
