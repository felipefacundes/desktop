#!/bin/bash
#pdftoppm *.pdf -gray out

for i in *.[jJpP][nNpP][gG]
  do name=`echo "${i}" | cut -d'.' -f1`
  echo "${name}"
  convert "${i}" -density 300x300 -quality 100% "${name}".pgm
  convert "${name}".pgm -depth 8 \
  -colorspace Gray -type grayscale \
  -channel rgba -alpha set -fuzz 50% \
  -fill none -opaque white \
  -fill white -opaque black \
  -fill black -opaque none \
  -colors 2 -strip \
  -alpha off -negate -threshold 1% -density 300x300 -quality 100% "${i}" "${name}".tiff
  rm "${name}".pgm
  tesseract "${name}.tiff" "${name}" -l por txt
  rm "${name}".tiff
done
exit
