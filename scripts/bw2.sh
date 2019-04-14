convert *.pgm -depth 8 -quality 100 -density 300 \
-colorspace Gray -type GrayScaleMatte \
-channel rgba -alpha set -fuzz 50% \
-fill none -opaque white \
-fill white -opaque black \
-fill black -opaque none \
-strip -alpha Remove -background white -threshold 75% \
-contrast-stretch 15% -normalize -modulate 120,90 \
-level 50%,75% -auto-level -negate \
-compose plus -separate -density 300 imagem.tif
#-evaluate Pow 15%
#-deskew 40%
#-brightness-contrast 5%
