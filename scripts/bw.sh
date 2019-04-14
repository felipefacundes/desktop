convert *.pgm -depth 8 \
-colorspace Gray -type grayscale \
-channel rgba -alpha set -fuzz 50% \
-fill none -opaque white \
-fill white -opaque black \
-fill black -opaque none \
-colors 2 -strip \
-alpha off -negate -threshold 1% -density 300x300 imagem.tif
#-fill white -colorize 5 imagem.tif
